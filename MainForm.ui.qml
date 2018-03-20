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
    property alias buttonDial: buttonDial
    property alias logText: logText
    property alias dialNumber: dialNumber
    property alias iconDial: iconDial
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
        x: 14
        y: 11
        width: 149
        height: 40
        text: qsTr("Do Not Disturb")
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
        x: 32
        y: 494
        width: 265
        height: 72
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        title: qsTr("Log")

        Text {
            id: logText
            text: qsTr("Text")
            anchors.leftMargin: -5
            anchors.bottomMargin: -7
            anchors.rightMargin: -5
            anchors.topMargin: -9
            anchors.fill: parent
            anchors.top: parent.top
            opacity: 1
            font.weight: Font.Light
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 12
        }
    }

    Frame {
        id: dialBox
        x: 84
        y: 105
        width: 158
        height: 40

        TextInput {
            id: dialNumber
            anchors.bottomMargin: -6
            font.pointSize: 14
            anchors.rightMargin: -73
            anchors.leftMargin: -73
            anchors.top: parent.verticalCenter
            anchors.right: parent.horizontalCenter
            anchors.left: parent.horizontalCenter
            anchors.topMargin: -15
            anchors.bottom: parent.bottom
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
        source: "images/list.png"

        MouseArea {
            id: buttonList
            anchors.fill: parent
        }
    }

    Image {
        id: iconDial
        x: 248
        y: 105
        width: 40
        height: 40
        scale: 1
        enabled: true
        source: "images/call.png"

        MouseArea {
            id: buttonDial
            anchors.fill: parent
        }
    }

    Image {
        id: iconSettings
        x: 270
        y: 19
        width: 25
        height: 25
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
        source: "images/help.png"

        MouseArea {
            id: buttonHelp
            anchors.fill: parent
        }
    }

    GridLayout {
        x: 90
        y: 168
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
        x: 38
        y: 382
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
        x: 30
        y: 65
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

    Rectangle {
        id: rectangle
        x: 324
        y: 0
        width: 200
        height: 200
        color: "#ffffff"
        opacity: 0
    }
}
