import QtQuick 2.12
import QtQuick.Controls.Basic 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

import QtQuick.SKeyboard 1.0

ApplicationWindow {
    id: window

    visible: true
    width: 640
    height: 800
    title: qsTr("SKeyboard Example")

    background: Rectangle {
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#0C3A2D"
            }
            GradientStop {
                position: 1.0
                color: "#084E4B"
            }
        }
    }

    component CTextField: TextField {
        implicitWidth: 512
        implicitHeight: 68
        color: "#FFFFFF"
        font.pixelSize: 30
        font.family: "Inter"
        background: Rectangle {
            anchors.fill: parent
            color: "#0A322D"
            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                height: 2
                color: "#D9D9D9"
            }
        }
    }

    ColumnLayout {
        anchors {
            top: parent.top
            bottom: parent.bottom
            margins: 40
            bottomMargin: inputPanel.height
            left: parent.left
            onRightChanged: parent.right
        }

        spacing: 100

        Image {
            fillMode: Image.PreserveAspectFit
            source: "qrc:/icons/logo.svg"
            Layout.preferredWidth: 575
            Layout.preferredHeight: 88
        }

        ColumnLayout {
            spacing: 39
            ColumnLayout {
                spacing: 9

                Text {
                    text: qsTr("Login ID")
                    color: "#FFFFFF"
                    font.pixelSize: 20
                    font.family: "Inter"
                }

                CTextField {
                    id: tf1
                }
            }

            ColumnLayout {
                spacing: 9

                Text {
                    text: qsTr("Password")
                    color: "#FFFFFF"
                    font.pixelSize: 20
                    font.family: "Inter"
                }

                CTextField {
                    inputMethodHints: Qt.ImhDigitsOnly
                    echoMode: TextInput.Password
                }
            }
        }
    }

    InputPanel {
        id: inputPanel

        z: 99
        y: Qt.inputMethod.visible ? (window.height - inputPanel.height) : window.height
        anchors.left: parent.left
        anchors.right: parent.right
        languageLayout: "En"
        availableLanguageLayouts: ["En", "De"]

        Behavior on y {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }
}
