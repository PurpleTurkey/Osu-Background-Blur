import os
import re
from os.path import sep
from PIL import Image, ImageFilter
import multiprocessing as mp

BLANK_COLOR = 0xFFEA9A

def split(a, n):
    # https://stackoverflow.com/questions/2130016/splitting-a-list-into-n-parts-of-approximately-equal-length
    # Splits a list into n equal parts
    k, m = divmod(len(a), n)
    return (a[i * k + min(i, m):(i + 1) * k + min(i + 1, m)] for i in range(n))

def generate_background_blank(path):
    img = Image.new('RGB', (480, 300), BLANK_COLOR)
    img.save(path)

def pass_background_blank(path):
    img = Image.new('RGB', (480, 300), BLANK_COLOR)
    return img

def generate_background_blur(source, path, blur):
    img = Image.open(source)
    if img.mode == 'P':
        img = img.convert('RGB')

    new_img = img.filter(ImageFilter.GaussianBlur(blur))
    if new_img.mode == 'RGBA':
        new_img.convert('RGB').save(path)
    else:
        new_img.save(path)

def pass_background_blur(source, blur):
    img = Image.open(source)
    if img.mode == 'P':
        img = img.convert('RGB')

    new_img = img.filter(ImageFilter.GaussianBlur(blur))
    if new_img.mode == 'RGBA':
        new_img.convert('RGB')
    
    return new_img
    

class OsuDriver:

    def __init__(self, path, active):
        self.path = path + sep + "Songs"
        self.active = active
        self.full_log = []
        self.log = []

        self.run_complete = None

    def update_full_log(self):

        self.full_log.extend(self.log)
    
    def get_background_name(self, song_map_path):
        with open(song_map_path, 'r', encoding='utf8') as f:
            lines = [x[:-1] for x in f.readlines()]
            lines = lines[lines.index('[Events]'):]
            image_line_regex = r'0,0,".+\..+".*'
            image_name_regex = r'"(.+\..+)"'
            image_name = ''
            for line in lines:
                if line != '' and re.match(image_line_regex, line):
                    match = re.search(image_name_regex, line)
                    image_name = match.group(1)
                    break

            return image_name


    # Restores or generates the backgrounds for a given beatmap
    def replace_map(self, folder, song_map, shared_images, restore, blur):
        try:
            image_name = self.get_background_name(folder + sep + song_map)

            if image_name == '':
                raise Exception(f'No valid image could be found for {song_map}')
            # Ensures that the replacement process only occurs once per image file
            # in the event that multiple beatmaps share the same image file.
            elif image_name in shared_images:
                return
        except Exception as e:
            msg = f'Couldn\'t retrieve the background filename for {song_map}'
            #print(msg)
            self.log.append(msg)

            self.log.append(str(e))
            #print(e)
            return

        bg_path = folder + sep + image_name
        original_bg_path = bg_path + '.replaced'

        # Restoring original images
        if restore:
            # Checks if there is an original background image
            if os.path.exists(original_bg_path):
                # Deletes the generated background
                try:
                    if os.path.exists(bg_path):
                        os.remove(bg_path)
                except:
                    msg = f'Could not delete the generated background for {song_map}'
                    #print(msg)
                    self.log.append(msg)

                    return image_name

                # Renames the original background to the original filename
                try:
                    os.rename(original_bg_path, bg_path)
                    self.log.append(f"Restoring background for {song_map}")
                except:
                    msg = f'Could not rename original background image to {image_name} for {song_map}'
                    #print(msg)
                    self.log.append(msg)
            else:
                msg = f'The original background image for {song_map} cannot not be found. This could be the result of renaming, moving, or deleting the original image file.'
                #print(msg)
                self.log.append(msg)
        # Generating blurred images
        else:
            # Checks if the original background exists
            if os.path.exists(bg_path):
                # Renames the original file to the replaced filename
                try:
                    os.rename(bg_path, original_bg_path)
                except:
                    msg = f'Couldn\'t rename original background to replace file for {song_map}'
                    #print(msg)
                    self.log.append(msg)
                    return image_name

                # Generates and saves blurred background with the original filename
                try:
                    generate_background_blur(original_bg_path, bg_path, blur)
                    self.log.append(f"Generating background for: {song_map}")

                except Exception as e:
                    msg = f'Couldn\'t generate a blurred background for {song_map}'
                    #print(msg)
                    #print(e)

                    self.log.append(msg)
                    self.log.append(str(e))
            # Original background image doesn't exist
            else:
                msg = f'Image filename is present in beatmap file but doesn\'t exist in the file system for {song_map}'
                #print(msg)
                self.log.append(msg)

        return image_name

    def replace_backgrounds(self, song_folder_path, blur, restore=False):
        # Gets all of the beatmaps in a folder
        try:
            osu_maps = [x for x in os.listdir(song_folder_path) if x.endswith('.osu')]
        except:
            osu_maps = []
            msg = "Directory name or location is invalid! Please select the 'osu!' folder."
            #print(msg)
            self.log.append(msg)

        # Shared images optimizes the process by skipping the replacement process if two beatmaps share the same background file
        shared_images = set()

        # Replaces all the backgrounds for each beatmap file
        for song_map in osu_maps:
            i = self.replace_map(song_folder_path, song_map, shared_images, restore, blur)
            if i is not None:
                shared_images.add(i)

    def replace_by_songs(self, song_folder_path, blur, songs, restore=False):
        songs_folder = self.path
        for song in songs:
            self.replace_backgrounds(songs_folder + sep + song, blur, restore)
        #print("Core process complete")

    def run(self, blur, restore=False):

        cpu_core_count = mp.cpu_count()
        songs_folder = self.path

        
        try:
            songs = os.listdir(songs_folder)
        except:
            msg = "Directory name or location is invalid! Please select the 'osu!' folder."
            #print(msg)
            self.log.append(msg)
            self.run_complete = True
            return

        if restore or (cpu_core_count <= 2 or len(songs) <= 20):
            #print(self.active)
            self.log.append("-----------------------\nBeginning background replacement\n-----------------------")
            for song in songs:
                #print(songs_folder + sep + song)
                self.replace_backgrounds(songs_folder + sep + song, blur, restore)
            self.log.append("-----------------------\nTask complete\n-----------------------")
            self.run_complete = True
        else:
            #print(self.active)
            self.log.append(f"-----------------------\nBeginning background replacement on {cpu_core_count} cores\n-----------------------")
            partioned_songs = list(split(songs, cpu_core_count))
            jobs = []
            for i, song_p in enumerate(partioned_songs):
                p = mp.Process(target=self.replace_by_songs, args=(songs_folder, blur, song_p, restore,))
                #self.replace_by_songs()
                jobs.append(p)
                p.start()

            while any([p.is_alive() for p in jobs]):
                pass
            self.log.append("-----------------------\nTask complete\n-----------------------")
            self.run_complete = True
        
if __name__ == "__main__":
    pass
