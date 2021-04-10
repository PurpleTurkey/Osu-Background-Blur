import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controlset"
import Qt.labs.platform 1.1

Item {
    Rectangle {
        id: rectangle
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

        Label {
            id: blurLabel
            y: 79
            color: "#dde0e1"
            text: qsTr("Blur Level")
            anchors.left: parent.left
            anchors.leftMargin: 50
            font.pointSize: 20
            font.family: "Verdana"
            styleColor: "#00000000"
        }

        Label {
            id: customBgLabel
            color: "#dde0e1"
            text: qsTr("Custom Background File (optional)")
            anchors.left: parent.left
            anchors.top: blurLabel.bottom
            anchors.leftMargin: 50
            anchors.topMargin: 90
            font.family: "Verdana"
            styleColor: "#00000000"
            font.pointSize: 20
        }

        Label {
            id: staticBgLabel
            color: "#dde0e1"
            text: qsTr("Static Color Background (optional)")
            anchors.left: parent.left
            anchors.top: customBgLabel.bottom
            anchors.leftMargin: 50
            anchors.topMargin: 110
            font.family: "Verdana"
            font.pointSize: 20
            styleColor: "#00000000"
        }

        Slider {

            id: blurSlider
            width: 538
            height: 40
            anchors.left: parent.left
            anchors.top: blurLabel.bottom
            to: 100
            anchors.leftMargin: 75
            anchors.topMargin: 20
            stepSize: 0.01
            value: 0.5


        }

        Rectangle {
            id: fileBoxOutline
            width: 687
            visible: true
            color: "#394053"
            radius: 10
            border.color: "#00000000"
            anchors.left: parent.left
            anchors.top: customBgLabel.bottom
            anchors.bottom: staticBgLabel.top
            anchors.bottomMargin: 20
            anchors.topMargin: 20
            anchors.leftMargin: 75

            Rectangle {
                id: filebox
                width: 510
                color: "#2f3648"
                radius: 10
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                clip: true
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10

                Label {
                    id: fileLabel
                    color: "#dde0e1"

                    text : if(bgFileButton.selectedFile == "") {
                               "No File Selected"
                           } else {
                               bgFileButton.selectedFile
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
                text: "Choose File"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pointSize: 13
                font.family: "Verdana"
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10

                property var selectedFile: bgDialog.file

                FileDialog {
                    id: bgDialog
                    currentFile: file
                }

                onClicked: {
                    bgDialog.open()
                }
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
    D{i:0;autoSize:true;height:580;width:900}
}
##^##*/
