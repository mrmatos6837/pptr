import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    width: 300
    height: 420
    property alias image: image
    property alias rectangle3: rectangle3
    property alias passwdText: passwdText
    property alias rectangle2: rectangle2
    property alias loginText: loginText
    property alias ipText: ipText
    property alias rectangle1: rectangle1

    property alias showPassword: showPassword
    property alias login: login
    property alias password: password
    property alias ipAddress: ipAddress

    Rectangle {
        id: rectangle
        color: "#ebebeb"
        anchors.fill: parent
        transformOrigin: Item.Bottom

        ColumnLayout {
            id: configs
            height: 119
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            transformOrigin: Item.Center
            anchors.top: parent.top
            anchors.topMargin: 20

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
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
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
                    anchors.fill: parent
                    font.pixelSize: 12
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
                    anchors.right: parent.right
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
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
        TextArea {
            id: disclaimer
            height: 123
            text: "DISCLAIMER\n\nEsta é uma versão APLHA de desenvolvimento e portanto é sucetível a diversos bugs e comportamentos inesperados.\nEsta aplicação serve como prova de conceito bem como teste de viabilidade e usabilidade das funções oferecidas."
            enabled: false
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: configs.bottom
            anchors.topMargin: 20
            horizontalAlignment: Text.AlignLeft
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        Image {
            id: image1
            y: 315
            height: 100
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: disclaimer.bottom
            anchors.topMargin: 20
            source: "images/khomp_Logo_Small.png"

            Rectangle {
                id: rectangle6
                color: "#ffffff"
                anchors.fill: parent
                z: -1
            }
        }
    }
}
