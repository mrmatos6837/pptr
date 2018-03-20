import QtQuick 2.4
import QtQuick.Layouts 1.0
import QtQuick.Extras 1.4
import QtQuick.Controls 2.3

Item {
    width: 400
    height: 400
    property alias number11: number11
    property alias number10: number10
    property alias number9: number9
    property alias number8: number8
    property alias number7: number7
    property alias number6: number6
    property alias number5: number5
    property alias number4: number4
    property alias number3: number3
    property alias number2: number2
    property alias number1: number1
    property alias number0: number0
    property alias button11: button11
    property alias button10: button10
    property alias button9: button9
    property alias button8: button8
    property alias button7: button7
    property alias button6: button6
    property alias button5: button5
    property alias button4: button4
    property alias button3: button3
    property alias button2: button2
    property alias button1: button1
    property alias button0: button0

    Image {
        id: image
        anchors.fill: parent
        source: "images/list_window.png"

        ColumnLayout {
            id: columnLayout1
            x: 16
            y: 37
            width: 96
            height: 350

            Text {
                id: name0
                text: qsTr("Ana")
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: name1
                text: qsTr("Bob")
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: name2
                text: qsTr("Charlie")
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: name3
                text: qsTr("Denis")
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: name4
                text: qsTr("-")
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: name5
                text: qsTr("-")
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: name6
                text: qsTr("-")
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: name7
                text: qsTr("-")
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: name8
                text: qsTr("-")
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: name9
                text: qsTr("-")
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: name10
                text: qsTr("-")
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: name11
                text: qsTr("-")
                Layout.fillWidth: true
                font.pixelSize: 20
            }
        }

        ColumnLayout {
            x: 126
            y: 37
            width: 155
            height: 350
            TextEdit {
                id: number0
                text: qsTr("1001")
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 20
            }

            Text {
                id: number1
                text: qsTr("1002")
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: number2
                text: qsTr("1003")
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: number3
                text: qsTr("-")
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: number4
                text: qsTr("-")
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: number5
                text: qsTr("-")
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: number6
                text: qsTr("-")
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: number7
                text: qsTr("-")
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: number8
                text: qsTr("-")
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: number9
                text: qsTr("-")
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: 20
            }

            Text {
                id: number10
                text: qsTr("-")
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: 20
            }
            Text {
                id: number11
                text: qsTr("-")
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: 20
            }
        }

        ColumnLayout {
            id: columnLayout
            x: 292
            y: 37
            spacing: 2.4

            Button {
                id: button0
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }

            Button {
                id: button1
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }

            Button {
                id: button2
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }

            Button {
                id: button3
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }

            Button {
                id: button4
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }

            Button {
                id: button5
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }

            Button {
                id: button6
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }

            Button {
                id: button7
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }

            Button {
                id: button8
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }

            Button {
                id: button9
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }

            Button {
                id: button10
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }

            Button {
                id: button11
                text: qsTr("Call")
                Layout.preferredHeight: 27
                Layout.preferredWidth: 96
            }
        }
    }
}
