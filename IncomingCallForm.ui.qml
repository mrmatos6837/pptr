import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0

Item {
    width: 250
    height: 120
    property alias rejectButton: rejectButton
    property alias answerButton: answerButton

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent

        Text {
            id: text1
            x: 105
            width: 175
            height: 18
            text: qsTr("INCOMING CALL!")
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 17
        }

        RowLayout {
            x: 68
            anchors.top: text1.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                id: answerButton
                text: qsTr("Answer")
            }

            Button {
                id: rejectButton
                text: qsTr("Reject")
            }
        }
    }
}
