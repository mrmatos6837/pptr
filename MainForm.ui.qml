import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtQuick.Extras 1.4
import QtQuick.Window 2.10
import QtQuick.Scene2D 2.9
import QtQuick.Controls.Styles 1.4

Page {
    id: page
    width: 325
    height: 600
    property alias logText: logText
    property alias flickable: flickable
    property alias scrollBar: scrollBar
    //    property alias test: test
    property alias iconList: iconList
    property alias iconSettings: iconSettings
    property alias iconHelp: iconHelp
    property alias iconDial: iconDial
    property alias buttonDial: buttonDial
    //    property alias logText: logText
    property alias dialNumber: dialNumber
    property alias dialBox: dialBox
    property alias logBox: logBox
    property alias switchDND: switchDND
    property alias buttonHelp: buttonHelp
    property alias buttonSettings: buttonSettings
    property alias buttonLine3: buttonLine3
    property alias buttonLine2: buttonLine2
    property alias buttonLine1: buttonLine1
    property alias buttonList: buttonList
    property alias buttonMute: buttonMute
    property alias buttonSpeaker: buttonSpeaker
    property alias buttonHeadset: buttonHeadset
    property alias buttonHold: buttonHold
    property alias buttonCancel: buttonCancel
    property alias buttonTransfer: buttonTransfer
    property alias buttonMsg: buttonMsg
    property alias buttonConf: buttonConf
    property alias buttonRedial: buttonRedial
    property alias roundButton1: roundButton1
    property alias roundButton6: roundButton6
    property alias roundButton5: roundButton5
    property alias roundButton4: roundButton4
    property alias roundButton2: roundButton2
    property alias roundButton3: roundButton3
    property alias roundButton7: roundButton7
    property alias roundButton8: roundButton8
    property alias roundButton9: roundButton9
    property alias roundButton10: roundButton10
    property alias roundButton0: roundButton0
    property alias roundButton11: roundButton11

    title: qsTr("Home")

    SwitchDelegate {
        id: switchDND
        width: 149
        height: 40
        text: qsTr("Do Not Disturb")
        anchors.top: parent.top
        anchors.topMargin: 11
        anchors.left: parent.left
        anchors.leftMargin: 14
        highlighted: false
        autoExclusive: false
        leftPadding: 5
        rightPadding: 5
        bottomPadding: 5
        topPadding: 5
        transformOrigin: Item.Center
        checked: false
    }

    GroupBox {
        id: logBox
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: commandList.bottom
        anchors.topMargin: 25
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        title: qsTr("Log")

        Flickable {
            id: flickable
            boundsBehavior: Flickable.StopAtBounds
            flickableDirection: Flickable.VerticalFlick
            clip: false
            anchors.rightMargin: -8
            anchors.leftMargin: -8
            anchors.bottomMargin: -8
            anchors.topMargin: -8
            anchors.fill: parent

            TextArea.flickable: TextArea {
                id: logText
                text: "Power on!"
                anchors.fill: parent
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignBottom
            }
            ScrollBar.vertical: ScrollBar {
                id: scrollBar
                position: 1
            }
        }

        ////        TextEdit {
        ////            id: logText
        ////            text: qsTr("Text")
        ////            cursorVisible: true
        ////            readOnly: true
        ////            clip: true
        ////            textFormat: Text.AutoText
        ////            topPadding: -1
        ////            enabled: false
        ////            wrapMode: Text.WordWrap
        ////            anchors.topMargin: -10
        ////            anchors.bottomMargin: -10
        ////            anchors.leftMargin: -10
        ////            anchors.rightMargin: -10
        ////            anchors.fill: parent
        ////            opacity: 1
        ////            font.weight: Font.Light
        ////            verticalAlignment: Text.AlignTop
        ////            horizontalAlignment: Text.AlignLeft
        ////            font.pixelSize: 12
        //        //        }

        ////            flickableDirection: Flickable.VerticalFlick
        ////            anchors.rightMargin: -8
        ////            anchors.leftMargin: -8
        ////            anchors.bottomMargin: -8
        ////            anchors.topMargin: -8
        ////            anchors.fill: parent
        ////            ScrollBar.vertical: ScrollBar {
        ////                parent: flickable.parent
        ////                anchors.top: flickable.top
        ////                anchors.left: flickable.right
        ////                anchors.bottom: flickable.bottom
        ////            }
        //        }
    }

    Frame {
        id: dialBox
        x: 84
        width: 158
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: lineList.bottom
        anchors.topMargin: 13

        TextInput {
            id: dialNumber
            anchors.rightMargin: -10
            anchors.leftMargin: -10
            anchors.bottomMargin: -8
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: -8
            font.pointSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignHCenter
            font.family: "Tahoma"
            font.capitalization: Font.AllLowercase
        }
    }

    Image {
        id: iconList
        x: 38
        y: 105
        width: 40
        height: 40
        anchors.verticalCenter: dialBox.verticalCenter
        anchors.right: dialBox.left
        anchors.rightMargin: 6
        source: "images/list.png"

        MouseArea {
            id: buttonList
            anchors.fill: parent
        }
    }

    Image {
        id: iconDial
        y: 105
        width: 40
        height: 40
        rotation: 135

        anchors.verticalCenter: dialBox.verticalCenter
        anchors.left: dialBox.right
        anchors.leftMargin: 6
        scale: 1
        enabled: true
        source: "images/phone-1.png"

        MouseArea {
            id: buttonDial
            rotation: 0
            anchors.fill: parent
        }
    }

    Image {
        id: iconSettings
        x: 270
        width: 25
        height: 25
        anchors.top: parent.top
        anchors.topMargin: 19
        anchors.right: parent.right
        anchors.rightMargin: 30
        source: "images/cog.png"

        MouseArea {
            id: buttonSettings
            anchors.fill: parent
        }
    }

    Image {
        id: iconHelp
        x: 239
        y: 19
        width: 25
        height: 25
        anchors.right: iconSettings.left
        anchors.rightMargin: 6
        source: "images/help.png"

        MouseArea {
            id: buttonHelp
            anchors.fill: parent
        }
    }

    GridLayout {
        id: dialPad
        x: 90
        anchors.top: dialBox.bottom
        anchors.topMargin: 23
        anchors.horizontalCenter: parent.horizontalCenter
        rows: 4
        columns: 3

        RoundButton {
            id: roundButton1
            text: "1"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }

        RoundButton {
            id: roundButton2
            text: "2"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }

        RoundButton {
            id: roundButton3
            text: "3"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }

        RoundButton {
            id: roundButton4
            text: "4"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }

        RoundButton {
            id: roundButton5
            text: "5"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }

        RoundButton {
            id: roundButton6
            text: "6"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }

        RoundButton {
            id: roundButton7
            text: "7"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }

        RoundButton {
            id: roundButton8
            text: "8"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }

        RoundButton {
            id: roundButton9
            text: "9"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }

        RoundButton {
            id: roundButton10
            text: "*"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }

        RoundButton {
            id: roundButton0
            text: "0"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }

        RoundButton {
            id: roundButton11
            text: "#"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 45
        }
    }

    GridLayout {
        id: commandList
        x: 38
        anchors.top: dialPad.bottom
        anchors.topMargin: 19
        anchors.horizontalCenter: parent.horizontalCenter
        rows: 1
        columns: 3

        Button {
            id: buttonRedial
            text: qsTr("Redial")
            Layout.preferredHeight: 27
            Layout.preferredWidth: 80
        }

        Button {
            id: buttonConf
            text: qsTr("Conference")
            Layout.preferredHeight: 27
            Layout.preferredWidth: 80
        }

        Button {
            id: buttonMsg
            text: qsTr("Message")
            Layout.preferredHeight: 27
            Layout.preferredWidth: 80
        }

        Button {
            id: buttonTransfer
            text: qsTr("Transfer")
            Layout.preferredHeight: 27
            Layout.preferredWidth: 80
        }

        Button {
            id: buttonCancel
            text: qsTr("Cancel")
            Layout.preferredHeight: 27
            Layout.preferredWidth: 80
        }

        Button {
            id: buttonHold
            text: qsTr("Hold")
            Layout.preferredHeight: 27
            Layout.preferredWidth: 80
        }

        Button {
            id: buttonSpeaker
            text: qsTr("Speaker")
            Layout.preferredHeight: 27
            Layout.preferredWidth: 80
        }

        Button {
            id: buttonHeadset
            text: qsTr("Headset")
            Layout.preferredHeight: 27
            Layout.preferredWidth: 80
        }

        Button {
            id: buttonMute
            text: qsTr("Mute")
            Layout.preferredHeight: 27
            Layout.preferredWidth: 80
        }
    }

    RowLayout {
        id: lineList
        x: 30
        anchors.top: parent.top
        anchors.topMargin: 65
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: buttonLine1
            text: qsTr("Line 1")
            hoverEnabled: true
            font.underline: true
            highlighted: false
            Layout.preferredWidth: 80
            Layout.preferredHeight: 27
        }

        Button {
            id: buttonLine2
            text: qsTr("Line 2")
            Layout.preferredWidth: 80
            Layout.preferredHeight: 27
        }

        Button {
            id: buttonLine3
            text: qsTr("Line 3")
            Layout.preferredWidth: 80
            Layout.preferredHeight: 27
        }
    }
}
