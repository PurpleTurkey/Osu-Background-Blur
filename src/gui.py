# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'form.ui'
#
# Created by: PyQt5 UI code generator 5.15.3
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import pyqtSignal, QTimer
from replacer import *
from PIL.ImageQt import ImageQt
import PIL
import sys, os
import multiprocessing as mp

def resource_path(relative_path):
     if hasattr(sys, '_MEIPASS'):
         return os.path.join(sys._MEIPASS, relative_path)
     return os.path.join(os.path.abspath("."), relative_path)
    
resource_path("osublurred.ico")

class Ui_scan(object):
  
    def __init__(self):
        
        self.osu_dir = None
        self.start = {"active" : False}
        self.driver = None
    
    def setupUi(self, scan):
        scan.setObjectName("scan")
        scan.resize(800, 600)
        self.horizontalLayoutWidget = QtWidgets.QWidget(scan)
        self.horizontalLayoutWidget.setGeometry(QtCore.QRect(10, 10, 771, 81))
        self.horizontalLayoutWidget.setObjectName("horizontalLayoutWidget")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.horizontalLayoutWidget)
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.label = QtWidgets.QLabel(self.horizontalLayoutWidget)
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        self.label.setObjectName("label")
        self.horizontalLayout.addWidget(self.label)
        self.label_2 = QtWidgets.QLabel(self.horizontalLayoutWidget)
        self.label_2.setAlignment(QtCore.Qt.AlignCenter)
        self.label_2.setObjectName("label_2")
        self.horizontalLayout.addWidget(self.label_2)
        self.horizontalLayoutWidget_2 = QtWidgets.QWidget(scan)
        self.horizontalLayoutWidget_2.setGeometry(QtCore.QRect(10, 80, 771, 86))
        self.horizontalLayoutWidget_2.setObjectName("horizontalLayoutWidget_2")
        self.horizontalLayout_2 = QtWidgets.QHBoxLayout(self.horizontalLayoutWidget_2)
        self.horizontalLayout_2.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.label_4 = QtWidgets.QLabel(self.horizontalLayoutWidget_2)
        self.label_4.setText("")
        self.label_4.setObjectName("label_4")
        self.horizontalLayout_2.addWidget(self.label_4)
        self.pushButton_3 = QtWidgets.QPushButton(self.horizontalLayoutWidget_2)
        self.pushButton_3.setObjectName("pushButton_3")
        self.horizontalLayout_2.addWidget(self.pushButton_3)
        self.lineEdit = QtWidgets.QLineEdit(self.horizontalLayoutWidget_2)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.lineEdit.sizePolicy().hasHeightForWidth())
        self.lineEdit.setSizePolicy(sizePolicy)
        var = 45
        self.lineEdit.setMinimumSize(QtCore.QSize(241+var, 0))
        self.lineEdit.setMaxLength(500)
        self.lineEdit.setReadOnly(True)
        self.lineEdit.setObjectName("lineEdit")
        self.horizontalLayout_2.addWidget(self.lineEdit)

        self.horizontalSlider = QtWidgets.QSlider(self.horizontalLayoutWidget_2)
        self.horizontalSlider.setOrientation(QtCore.Qt.Horizontal)
        self.horizontalSlider.setObjectName("horizontalSlider")
        self.horizontalSlider.setMinimum(0)
        self.horizontalSlider.setMaximum(90);

        self.horizontalLayout_2.addWidget(self.horizontalSlider)
        self.plainTextEdit_2 = QtWidgets.QPlainTextEdit(scan)
        self.plainTextEdit_2.setGeometry(QtCore.QRect(10, 170, 378, 421))
        self.plainTextEdit_2.setTextInteractionFlags(QtCore.Qt.NoTextInteraction)
        self.plainTextEdit_2.setObjectName("plainTextEdit_2")
        self.horizontalLayoutWidget_3 = QtWidgets.QWidget(scan)
        self.horizontalLayoutWidget_3.setGeometry(QtCore.QRect(400, 170, 381, 341))
        self.horizontalLayoutWidget_3.setObjectName("horizontalLayoutWidget_3")
        self.horizontalLayout_3 = QtWidgets.QHBoxLayout(self.horizontalLayoutWidget_3)
        self.horizontalLayout_3.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout_3.setObjectName("horizontalLayout_3")
        
        
        self.label_3 = QtWidgets.QLabel(self.horizontalLayoutWidget_3)
        self.label_3.setText("")
        self.label_3.setObjectName("label_3")
        pixmap = QtGui.QPixmap(resource_path('citybg.png'))
        self.label_3.setPixmap(pixmap)
        
        
        self.horizontalLayout_3.addWidget(self.label_3)
        self.label_5 = QtWidgets.QLabel(self.horizontalLayoutWidget_3)
        self.label_5.setText("")
        self.label_5.setObjectName("label_5")
        self.label_5.setObjectName("label_3")
        #pixmap = QtGui.QPixmap.fromImage(ImageQt(PIL.Image.open('basic2.png'))) #
        pixmap = QtGui.QPixmap(resource_path('citybg.png'))
        self.label_5.setPixmap(pixmap)
        
        
        self.horizontalLayout_3.addWidget(self.label_5)
        self.horizontalLayoutWidget_4 = QtWidgets.QWidget(scan)
        self.horizontalLayoutWidget_4.setGeometry(QtCore.QRect(400, 520, 381, 71))
        self.horizontalLayoutWidget_4.setObjectName("horizontalLayoutWidget_4")
        self.horizontalLayout_4 = QtWidgets.QHBoxLayout(self.horizontalLayoutWidget_4)
        self.horizontalLayout_4.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout_4.setObjectName("horizontalLayout_4")
        self.pushButton_2 = QtWidgets.QPushButton(self.horizontalLayoutWidget_4)
        self.pushButton_2.setObjectName("pushButton_2")
        self.horizontalLayout_4.addWidget(self.pushButton_2)
        self.pushButton = QtWidgets.QPushButton(self.horizontalLayoutWidget_4)
        self.pushButton.setObjectName("pushButton")
        self.horizontalLayout_4.addWidget(self.pushButton)

        self.retranslateUi(scan)
        QtCore.QMetaObject.connectSlotsByName(scan)
    
        # on button press
        self.pushButton_3.clicked.connect(self.button_press_opendir)
        self.pushButton_2.clicked.connect(self.button_press_start)
        self.pushButton.clicked.connect(self.button_press_restore)

        # on slider change
        self.horizontalSlider.valueChanged.connect(self.blur_slider_change)
        

    def retranslateUi(self, scan):
        _translate = QtCore.QCoreApplication.translate
        scan.setWindowTitle(_translate("scan", "osu! Background Blurrer"))
        self.label.setText(_translate("scan", "Choose osu! folder"))
        self.label_2.setText(_translate("scan", "Level of blur"))
        self.pushButton_3.setText(_translate("scan", "Open Folder"))
        self.pushButton_2.setText(_translate("scan", "Blur Backgrounds"))
        self.pushButton.setText(_translate("scan", "Restore Backgrounds"))


    def button_press_opendir(self):
        self.fileDialog = QtWidgets.QFileDialog.getExistingDirectory(self.horizontalLayoutWidget_2, "Select Folder")
        self.lineEdit.setText(str(self.fileDialog))
        self.osu_dir = str(self.fileDialog)
        self.driver = OsuDriver(self.osu_dir, self.start)

    def blur_slider_change(self):
        pixmap = QtGui.QPixmap.fromImage(ImageQt(pass_background_blur(resource_path('citybg.png'), int(self.horizontalSlider.value()*0.18) ))) #
        #pixmap = QtGui.QPixmap('basic2.png')
        self.label_5.setPixmap(pixmap)

    def button_press_start(self):
        if not self.start['active']:

            if self.driver:
                self.start = {"active" : True}
                
                self.driver.run(self.horizontalSlider.value())

                self.timer = QtCore.QTimer()
                self.timer.timeout.connect(self.timedLoop)
                self.timer.start(5)
            else:
                self.plainTextEdit_2.appendPlainText("Your 'osu!' directory has not been selected!")
                return

        if self.driver.run_complete == True:
            self.driver.run_complete = False
            self.start['active'] = False
    
    def button_press_restore(self):
        if not self.start['active']:

            if self.driver:
                self.start = {"active" : True}
                
                self.driver.log.append("[ Background Restoration Mode ]")
                self.driver.run(self.horizontalSlider.value(), True)     
                self.timer = QtCore.QTimer()
                self.timer.timeout.connect(self.timedLoop)
                self.timer.start(5)
            else:
                self.plainTextEdit_2.appendPlainText("Your 'osu!' directory has not been selected!")
                return

        if self.driver.run_complete == True:
            self.driver.run_complete = False
            self.start['active'] = False
    
    def timedLoop(self):
        if self.driver.log != []:
            self.driver.update_full_log()
            self.plainTextEdit_2.appendPlainText("\n".join(self.driver.log))
            self.driver.log = []




if __name__ == "__main__":
    import sys
    mp.freeze_support()
    app = QtWidgets.QApplication(sys.argv)
    test = QtWidgets.QWidget()
    ui = Ui_scan()
    ui.setupUi(test)
    test.show()
    sys.exit(app.exec_())