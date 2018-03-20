import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    width: 200
    height: 400
    property alias login: login
    property alias password: password
    property alias ipValue: ipValue

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
                x: 1
                y: 28

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
                        id: ipValue
                        text: qsTr("10.0.0.100")
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
                        text: qsTr("10.0.0.100")
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
                        text: qsTr("10.0.0.100")
                        font.pixelSize: 12
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }
    }
}
