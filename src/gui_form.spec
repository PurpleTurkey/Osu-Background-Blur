# -*- mode: python ; coding: utf-8 -*-

block_cipher = None


a = Analysis(['gui.py'],
             pathex=['C:\\Users\\101pa\\Desktop\\Advanced Python\\Repositories\\Osu-Background-Scanner-Gui'],
             binaries=[],
             datas=[],
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)
a.datas += [ ('citybg.png', 'C:\\Users\\101pa\\Desktop\\Advanced Python\\Repositories\\Osu-Background-Scanner-Gui\\citybg.png', 'Data')]
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)

exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          [],
          name='osu! Background Blurrer',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          upx_exclude=[],
          runtime_tmpdir=None,
          console=False,
          icon='C:\\Users\\101pa\\Desktop\\Advanced Python\\Repositories\\Osu-Background-Scanner-Gui\\osublurred.ico')
