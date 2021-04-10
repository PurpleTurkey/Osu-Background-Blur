import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#313540"
        border.color: "#00000000"
        anchors.fill: parent

        Label {
            id: label
            x: 214
            y: 197
            width: 379
            height: 172
            text: qsTr("Console")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 40
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:580;width:900}
}
##^##*/
