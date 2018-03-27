import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    width: 200
    height: 200
    property alias showPassword: showPassword
    property alias login: login
    property alias password: password
    property alias ipAddress: ipAddress

    Rectangle {
        id: rectangle
        color: "#ebebeb"
        anchors.fill: parent

        Frame {
            id: frame
            anchors.top: parent.top
            anchors.topMargin: 23
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 29
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0

            ColumnLayout {
                x: 0
                y: 0

                Text {
                    id: ipText
                    text: qsTr("Phone IP")
                    Layout.preferredHeight: 14
                    Layout.preferredWidth: 54
                    font.pixelSize: 12
                }

                Rectangle {
                    id: rectangle1
                    color: "#ffffff"
                    Layout.preferredHeight: 14
                    Layout.preferredWidth: 111

                    TextInput {
                        id: ipAddress
                        text: qsTr("172.16.4.200")
                        horizontalAlignment: Text.AlignHCenter
                        anchors.fill: parent
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: loginText
                    text: qsTr("Login:")
                    Layout.preferredHeight: 14
                    Layout.preferredWidth: 54
                    font.pixelSize: 12
                }

                Rectangle {
                    id: rectangle2
                    color: "#ffffff"
                    Layout.preferredHeight: 14
                    Layout.preferredWidth: 111

                    TextInput {
                        id: login
                        text: qsTr("root")
                        font.pixelSize: 12
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Text {
                    id: passwdText
                    text: qsTr("Senha:")
                    Layout.preferredHeight: 14
                    Layout.preferredWidth: 54
                    font.pixelSize: 12
                }

                Rectangle {
                    id: rectangle3
                    color: "#ffffff"
                    Layout.preferredHeight: 14
                    Layout.preferredWidth: 111

                    TextInput {
                        id: password
                        text: qsTr("root")
                        font.pixelSize: 12
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        echoMode: TextInput.Password

                        Image {
                            id: image
                            y: -43
                            width: 100
                            height: 100
                            anchors.left: parent.left
                            anchors.leftMargin: 79
                            anchors.verticalCenter: parent.verticalCenter
                            scale: 0.2
                            source: "images/eye.png"

                            MouseArea {
                                id: showPassword
                                anchors.fill: parent
                            }
                        }
                    }
                }
            }
        }

        Text {
            x: 8
            text: qsTr("Settings menu")
            anchors.top: parent.top
            anchors.topMargin: 3
            font.pixelSize: 12
        }
    }
}
