import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtQuick.Window

import QtQuick.SomcoKeyboard 1.0

ApplicationWindow {
    id: window

    visible: true
    width: 1088
    height: 900
    title: qsTr("Somco Keyboard Example")

    background: Rectangle {
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#79968F"
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
        Keys.onEscapePressed: {
            Qt.inputMethod.hide()
        }
    }

    ColumnLayout {
        anchors {
            top: parent.top
            bottom: parent.bottom
            margins: 80
            bottomMargin: inputPanel.height + 40
            left: parent.left
            right: parent.right
        }

        spacing: 40

        Image {
            Layout.alignment: Qt.AlignHCenter
            fillMode: Image.PreserveAspectFit
            source: inputPanel.themeName === darkTheme.themeName ? "qrc:/icons/SomcoKeyboardApp/dark/logo.svg" : "qrc:/icons/SomcoKeyboardApp/light/logo.svg"
            Layout.preferredWidth: 575
            Layout.preferredHeight: 88
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 40
            Text {
                text: qsTr("Keyboard Theme")
                color: "#FFFFFF"
                font.pixelSize: 20
                font.family: "Inter"
            }

            Button {
                id: toggle
                implicitWidth: 65
                implicitHeight: 40
                checkable: true

                checked: inputPanel.themeName === darkTheme.themeName
                background: Rectangle {
                    anchors.fill: parent
                    radius: height / 2
                    color: toggle.checked ? "#1E1E2E" : "#F5F7FA"

                    Behavior on color {
                        ColorAnimation {
                            duration: 250
                        }
                    }
                }

                contentItem: Item {
                    anchors.fill: parent
                    Rectangle {
                        width: 28
                        height: 28
                        radius: width / 2
                        color: toggle.checked ? "#F1F5F9" : "#FDB813"
                        anchors.verticalCenter: parent.verticalCenter
                        x: toggle.checked ? parent.width - width - 6 : 6

                        Behavior on x {
                            NumberAnimation {
                                duration: 250
                            }
                        }

                        Behavior on color {
                            ColorAnimation {
                                duration: 250
                            }
                        }
                    }
                }

                onToggled: {
                    if (checked)
                        inputPanel.themeName = darkTheme.themeName
                    else
                        inputPanel.themeName = lightTheme.themeName
                }
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 39
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 9

                Text {
                    text: qsTr("Login ID")
                    color: "#FFFFFF"
                    font.pixelSize: 20
                    font.family: "Inter"
                }

                CTextField {
                    Layout.fillWidth: true
                }
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 9

                Text {
                    text: qsTr("Password")
                    color: "#FFFFFF"
                    font.pixelSize: 20
                    font.family: "Inter"
                }

                CTextField {
                    Layout.fillWidth: true
                    inputMethodHints: Qt.ImhDigitsOnly
                    echoMode: TextInput.Password
                    passwordMaskDelay: 1000
                    EnterKeyAction.enabled: text.length >= 6
                }
            }
        }
    }

    InputPanel {
        id: inputPanel

        z: 99
        y: Qt.inputMethod.visible ? (window.height - inputPanel.height) : window.height
        width: parent.width

        themes: [
            KeyboardTheme {
                id: lightTheme
                themeName: "light"

                overlayBackgroundColor: "#D4E3EE"
                backgroundColor: "#C2D4EA"
                btnBackgroundColor: "#DEECFB"
                btnSpecialBackgroundColor: "#ADC3DB"
                btnEnterBackgroundColor: "#1DCA9B"
                btnTextColor: "#000000"
                btnTextFontFamily: "Inter"
                btnTextFontSize: 21

                backspaceIcon: "qrc:/icons/SomcoKeyboardApp/light/keyboard_backspace.svg"
                enterIcon: "qrc:/icons/SomcoKeyboardApp/light/keyboard_return.svg"
                shiftOnIcon: "qrc:/icons/SomcoKeyboardApp/light/caps-lock-on.svg"
                shiftOffIcon: "qrc:/icons/SomcoKeyboardApp/light/caps-lock-off.svg"
                hideKeyboardIcon: "qrc:/icons/SomcoKeyboardApp/light/keyboard_hide.svg"
                languageIcon: "qrc:/icons/SomcoKeyboardApp/light/language.svg"
                spaceIcon: "qrc:/icons/SomcoKeyboardApp/light/keyboard_space.svg"
            },

            KeyboardTheme {
                id: darkTheme
                themeName: "dark"

                overlayBackgroundColor: "#000000"
                backgroundColor: "#000000"
                btnBackgroundColor: "#2A3139"
                btnSpecialBackgroundColor: "#4B545E"
                btnEnterBackgroundColor: "#1DCA9B"
                btnTextColor: "#FFFFFF"
                btnTextFontFamily: "Inter"
                btnTextFontSize: 21

                backspaceIcon: "qrc:/icons/SomcoKeyboardApp/dark/keyboard_backspace.svg"
                enterIcon: "qrc:/icons/SomcoKeyboardApp/dark/keyboard_return.svg"
                shiftOnIcon: "qrc:/icons/SomcoKeyboardApp/dark/caps-lock-on.svg"
                shiftOffIcon: "qrc:/icons/SomcoKeyboardApp/dark/caps-lock-off.svg"
                hideKeyboardIcon: "qrc:/icons/SomcoKeyboardApp/dark/keyboard_hide.svg"
                languageIcon: "qrc:/icons/SomcoKeyboardApp/dark/language.svg"
                spaceIcon: "qrc:/icons/SomcoKeyboardApp/dark/keyboard_space.svg"
            }
        ]
        themeName: darkTheme.themeName

        Behavior on y {
            NumberAnimation {
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }
    }
}
