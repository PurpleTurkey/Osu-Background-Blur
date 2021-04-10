import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controlset"
import Qt.labs.platform 1.1
import QtQuick.Dialogs 1.2

Item {
    Rectangle {
        id: mainFrame
        color: "#313540"
        border.color: "#00000000"
        anchors.fill: parent


        Button {
            id: buttontest
            x: 781
            y: 33
            text: qsTr("Button")

            onClicked: {
                backend.welcomeText(qsTr("test"))
            }
        }

        Rectangle {
            id: topBar
            height: 70
            color: "#3b455e"
            radius: 10
            border.color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 180
            anchors.leftMargin: 180
            anchors.topMargin: 26

            CustomPushButton {
                id: blurButton
                y: 237
                width: 140
                text: "Blur"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 31
                font.pointSize: 13
                FileDialog {
                    id: bgDialog1
                }
                font.family: "Verdana"
                anchors.topMargin: 10
                anchors.bottomMargin: 10

                onClicked: {
                    customBlurLabel.visible = true
                    customBgLabel.visible = false
                    customColorLabel.visible = false
                }
            }

            CustomPushButton {
                id: fileSelectButton
                x: 328
                y: 10
                width: 140
                height: 50
                text: "Select File"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 13
                FileDialog {
                    id: bgDialog2
                }
                font.family: "Verdana"

                onClicked: {
                    customBlurLabel.visible = false
                    customBgLabel.visible = true
                    customColorLabel.visible = false
                }
            }

            CustomPushButton {
                id: staticColorButton
                x: 461
                y: 18
                width: 140
                text: "Static Color"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 31
                font.pointSize: 13
                FileDialog {
                    id: bgDialog3
                }
                font.family: "Verdana"
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                onClicked: {
                    customBlurLabel.visible = false
                    customBgLabel.visible = false
                    customColorLabel.visible = true
                }
            }

        }

        Rectangle {
            id: folderBoxOutline
            height: 65
            visible: true
            color: "#394053"
            radius: 10
            border.color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: topBar.bottom
            anchors.rightMargin: 75
            anchors.bottomMargin: 20
            anchors.topMargin: 50
            anchors.leftMargin: 75

            Rectangle {
                id: folderBox
                color: "#2f3648"
                radius: 10
                anchors.left: parent.left
                anchors.right: bgFolderButton.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 80
                clip: true
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10

                Label {
                    id: folderLabel
                    color: "#dde0e1"

                    text : if(bgFolderButton.selectedFile == "") {
                               "osu! folder not selected"
                           } else {
                               bgFolderButton.selectedFile.toString().substring(8)
                           }

                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    font.family: "Verdana"
                    font.pointSize: 13
                    styleColor: "#00000000"
                }
            }

            CustomPushButton {
                id: bgFolderButton
                x: 320
                y: 10
                width: 140
                text: "Select osu! Folder"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pointSize: 10
                font.family: "Verdana"
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10

                property var selectedFile: bgDialog.folder

                FolderDialog {
                    id: bgDialog
                    currentFolder: folder
                }

                onClicked: {
                    bgDialog.open()
                }
            }
        }

        Label {
            id: customBlurLabel
            visible: true
            color: "#dde0e1"
            text: qsTr("Blur Backgrounds")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: folderBoxOutline.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 55
            anchors.rightMargin: 0
            font.pointSize: 20
            font.family: "Verdana"
            anchors.leftMargin: 0
            styleColor: "#00000000"
        }

        Label {
            id: customBgLabel
            x: 432
            visible: false
            color: "#dde0e1"
            text: qsTr("Select Custom Background File")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: folderBoxOutline.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 55
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            font.family: "Verdana"
            styleColor: "#00000000"
            font.pointSize: 20
        }

        Label {
            id: customColorLabel
            visible: false
            color: "#dde0e1"
            text: qsTr("Custom Static Color")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: folderBoxOutline.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 55
            anchors.rightMargin: 0
            font.pointSize: 20
            font.family: "Verdana"
            anchors.leftMargin: 0
            styleColor: "#00000000"
        }

        Rectangle {
            id: blurSliderOutline
            x: 75
            y: 0
            height: 65
            visible: true
            color: "#394053"
            radius: 10
            border.color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: customBlurLabel.bottom
            anchors.leftMargin: 75
            anchors.topMargin: 35
            anchors.bottomMargin: 20
            anchors.rightMargin: 75

            Slider {

                id: blurSlider
                to: 100
                stepSize: 0.01
                value: 10

                visible: customBlurLabel.visible
                anchors.fill: parent
                anchors.rightMargin: 70
                anchors.leftMargin: 70

            }
        }

        Rectangle {
            id: fileBoxOutline
            height: 65
            color: "#394053"
            radius: 10
            border.color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: customBgLabel.bottom
            anchors.rightMargin: 75
            anchors.bottomMargin: 20
            anchors.topMargin: 35
            anchors.leftMargin: 75

            visible: customBgLabel.visible

            Rectangle {
                id: filebox
                color: "#2f3648"
                radius: 10
                anchors.left: parent.left
                anchors.right: bgFileButton.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 80
                clip: true
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10

                Label {
                    id: fileLabel
                    color: "#dde0e1"

                    text : if(bgFileButton.selectedFile == "") {
                               "osu! folder not selected"
                           } else {
                               bgFileButton.selectedFile.toString().substring(8)
                           }

                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    font.family: "Verdana"
                    font.pointSize: 13
                    styleColor: "#00000000"
                }
            }

            CustomPushButton {
                id: bgFileButton
                x: 320
                y: 10
                width: 140
                text: "Select Image"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pointSize: 10
                font.family: "Verdana"
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10

                property var selectedFile: bgFileDialog.fileUrl

                FileDialog {
                    id: bgFileDialog
                }

                onClicked: {
                    bgFileDialog.open()
                }
            }
        }

        Rectangle {
            id: colorBoxOutline
            height: 65
            color: "#394053"
            radius: 10
            border.color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: customColorLabel.bottom
            anchors.topMargin: 35
            anchors.rightMargin: 75
            anchors.leftMargin: 75

            visible: customColorLabel.visible

            CustomPushButton {
                id: colorPickerButton
                x: 320
                y: 10
                width: 140
                text: "Pick Color"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pointSize: 10
                FolderDialog {
                    id: bgDialog4
                    currentFolder: folder
                }
                font.family: "Verdana"
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                anchors.rightMargin: 10

                ColorDialog {
                    id: colorDialog
                    currentColor: color
                }

                onClicked: {
                    colorDialog.open()
                }
            }

            Rectangle {
                id: colorRectangle
                color: colorDialog.color
                radius: 10
                border.color: "#00000000"
                anchors.left: parent.left
                anchors.right: colorPickerButton.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 80
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10
            }
        }

        CustomPushButton {
            id: applyButton
            y: 466
            width: 140
            height: 50
            text: "Apply"
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 260
            anchors.bottomMargin: 50
            font.pointSize: 12
            FolderDialog {
                id: bgDialog5
                currentFolder: folder
            }
            font.family: "Verdana"


            property var currentMode : if(customBlurLabel.visible) {
                                           0
                                       } else if (customBgLabel.visible) {
                                           1
                                       } else if (customColorLabel.visible) {
                                           2
                                       }

            onClicked: {

                backend.transitionConsole()
                backend.setRunning(true)

                // mode, folder path, slider value, file path, color
                backend.apply(applyButton.currentMode, bgFolderButton.selectedFile.toString().substring(8), blurSlider.value , bgFileButton.selectedFile.toString().substring(8), colorDialog.color)


            }
        }

        CustomPushButton {
            id: revertButton
            objectName: "revertButton"
            x: 486
            y: 470
            width: 140
            height: 50
            text: "Restore"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 260
            anchors.bottomMargin: 50
            font.pointSize: 12
            FolderDialog {
                id: bgDialog6
                currentFolder: folder
            }
            font.family: "Verdana"

            onClicked: {
                backend.transitionConsole()
                backend.revert()
            }
        }


    }

    Connections {
        target: backend

        function onSetName(name) {
            buttontest.text = "e"
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:580;width:900}D{i:19}D{i:18}
}
##^##*/
