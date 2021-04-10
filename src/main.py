# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal
from PySide2.QtWidgets import *

from eventhandler import EventHandler


Manager = EventHandler() 

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

    # Set Name
    setName = Signal(str)

    # Transition to Console
    transitionConsole = Signal()

    # Set running
    changeRunning = Signal(bool)

    @Slot(str, result="")
    def welcomeText(self, name):
        self.setName.emit("Welcome, " + name)
        print(name)

    @Slot(bool)
    def setRunning(self, isRunning):
        self.changeRunning.emit(isRunning)

    @Slot()
    def revert(self):
        self.transitionConsole.emit()

        print("revert here")

    @Slot(int, str, float, str, str, result="")
    def apply(self, mode, dir_path, slider, f_path, color):
        # mode, osu! folder path, slider value, file path, color

        # mode = 0  -> blur
        # mode = 1  -> custom background
        # mode = 2  -> static color

        self.transitionConsole.emit()



if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    app.setOrganizationName("osu! Backgrounds")
    app.setOrganizationDomain("domain")

    print("test")

    # Get Context
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    # Load QML File
    engine.load(os.path.join(os.path.dirname(__file__), "qml\main.qml"))


    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())

