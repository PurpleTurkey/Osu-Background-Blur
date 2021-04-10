import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "controlset"

Window {
    id: mainWindow
    width: 1100
    height: 680
    minimumWidth: 1100
    minimumHeight: 680
    visible: true
    color: "#00000000"
    title: qsTr("Hello World")

    flags: Qt.Window | Qt.FramelessWindowHint

    property var isRunning: false

    Rectangle {
        id: appContainer
        color: "#00000000"
        anchors.fill: parent

        Rectangle {
            id: container
            color: "#23262f"
            border.color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10

            Rectangle {
                id: topBar
                height: 60
                color: "#23262f"
                border.color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                DragHandler {
                    onActiveChanged: if(active) {
                                         mainWindow.startSystemMove()
                                     }
                }

                Label {
                    id: lablelCurrentTab
                    x: 672
                    y: 13
                    width: 274
                    color: "#9bafd2"
                    text: qsTr("osu! Backgrounds")
                    anchors.right: logoRect.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.bottomMargin: 0
                    anchors.rightMargin: -450
                    anchors.topMargin: 0
                    font.pointSize: 15
                    font.family: "Verdana"
                }

                Rectangle {
                    id: logoRect
                    x: 0
                    y: 0
                    width: 180
                    height: 60
                    color: "#232a3a"
                }

                ToggleButton {
                    id: closeBtn
                    x: 1012
                    width: 60
                    height: 60
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.rightMargin: 0

                    onClicked: mainWindow.close()
                }

                ToggleButton {
                    id: maxBtn
                    x: 960
                    y: 0
                    width: 60
                    height: 60
                    visible: true
                    anchors.right: closeBtn.left
                    anchors.top: parent.top
                    btnIconSource: "../images/svg_images/maximize_icon.svg"
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    clip: false

                    onClicked: mainWindow.showMaximized()
                }

                ToggleButton {
                    id: minBtn
                    x: 890
                    y: 0
                    width: 60
                    height: 60
                    visible: true
                    anchors.right: maxBtn.left
                    anchors.top: parent.top
                    btnIconSource: "../images/svg_images/minimize_icon.svg"
                    anchors.topMargin: 0
                    anchors.rightMargin: 0
                    clip: false

                    onClicked: mainWindow.showMinimized()
                }
            }

            Rectangle {
                id: content
                anchors.left: sideBar.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                clip: true

                gradient: Gradient {

                    orientation: Gradient.Horizontal

                    GradientStop {
                        position: 0
                        color: "#22262f"
                    }

                    GradientStop {
                        position: 0.5
                        color: "#2b2f3b"
                    }

                    GradientStop {
                        position: 0.8
                        color: "#323742"
                    }

                    GradientStop {
                        position: 1
                        color: "#393e4b"
                    }
                }


                anchors.rightMargin: 0
                anchors.leftMargin: 180
                anchors.bottomMargin: 0
                anchors.topMargin: 60

                Rectangle {
                    id: bottomBar
                    x: -180
                    y: 560
                    height: 20
                    color: "#202737"
                    border.color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0

                    Label {
                        id: label
                        color: "#9bafd2"
                        text: qsTr("osu! Backgrounds by Everblaze & PurpleTurkey")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 20
                    }
                }

                MouseArea {
                    id: resizeDiagonal
                    x: 873
                    y: 580
                    width: 20
                    height: 20
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.rightMargin: 0
                    cursorShape: Qt.SizeFDiagCursor

                    Image {
                        id: image
                        anchors.fill: parent
                        source: "../images/svg_images/resize_icon.svg"
                        fillMode: Image.PreserveAspectFit
                    }

                    DragHandler {
                        target: null
                        onActiveChanged: if(active) {
                                             mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                         }
                    }

                }


                StackView {
                    id: stackView
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: bottomBar.top
                    anchors.bottomMargin: 0
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    initialItem: Qt.resolvedUrl("pages/homePage.qml")

                }
            }

            Rectangle {
                id: sideBar
                width: 180
                color: "#282f40"
                anchors.left: parent.left
                anchors.top: topBar.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 60
                anchors.leftMargin: 0

                Column {
                    id: column
                    width: 180
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0

                    LeftMenuBtn {
                        id: btnBlur
                        width: sideBar.width
                        text: qsTr("Blur")
                        isActiveMenu: true
                        font.pointSize: 13

                        onClicked: {

                            if (!mainWindow.isRunning) {
                                btnConsole.isActiveMenu = false
                                btnSettings.isActiveMenu = false

                                btnBlur.isActiveMenu = true
                                stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                            }


                        }
                    }

                    LeftMenuBtn {
                        id: btnConsole
                        width: sideBar.width
                        text: qsTr("Console")
                        btnIconSource: "../images/svg_images/dvr.svg"
                        font.pointSize: 13

                        onClicked: {
                            btnBlur.isActiveMenu = false
                            btnSettings.isActiveMenu = false

                            btnConsole.isActiveMenu = true
                            stackView.push(Qt.resolvedUrl("pages/consolePage.qml"))
                        }
                    }

                }

                LeftMenuBtn {
                    id: btnSettings
                    y: 120
                    text: qsTr("Settings")
                    anchors.left: column.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    btnIconSource: "../images/svg_images/settings.svg"
                    font.pointSize: 13

                    onClicked: {
                        btnBlur.isActiveMenu = false
                        btnConsole.isActiveMenu = false

                        btnSettings.isActiveMenu = true
                        stackView.push(Qt.resolvedUrl("pages/settingsPage.qml"))
                    }

                }
            }



        }
    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        cursorShape: Qt.SizeHorCursor
        DragHandler {
            target: null
            onActiveChanged:  if(active) {mainWindow.startSystemResize(Qt.LeftEdge)}
        }
    }

    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        cursorShape: Qt.SizeHorCursor
        DragHandler {
            target: null
            onActiveChanged:  if(active) {mainWindow.startSystemResize(Qt.RightEdge)}
        }
    }
    MouseArea {
        id: resizeBottom
        height:10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10

        cursorShape: Qt.SizeVerCursor
        DragHandler {
            target: null
            onActiveChanged:  if(active) {mainWindow.startSystemResize(Qt.BottomEdge)}
        }
    }

    Connections {
        target: backend

        function onTransitionConsole() {
            stackView.push(Qt.resolvedUrl("pages/consolePage.qml"))
            btnBlur.isActiveMenu = false
            btnConsole.isActiveMenu = true
            btnSettings.isActiveMenu = false
        }

        function onChangeRunning(running) {
            mainWindow.isRunning = running
        }
    }
}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:21}
}
##^##*/
