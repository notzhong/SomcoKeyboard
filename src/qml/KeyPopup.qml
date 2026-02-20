import SKeyboard 1.0
import QtQuick 2.0

Item {
    id: root

    function popup(keybutton, inputPanel) {
        width = keybutton.width * 1.4
        height = keybutton.height * 1.4
        var KeyButtonGlobalLeft = keybutton.mapToItem(inputPanel, 0, 0).x
        var KeyButtonGlobalTop = keybutton.mapToItem(inputPanel, 0, 0).y
        var PopupGlobalLeft = KeyButtonGlobalLeft - (width - keybutton.width) / 2
        var PopupGlobalTop = KeyButtonGlobalTop - height - keyboardRect.height / 40 * 1.5
        var PopupLeft = root.parent.mapFromItem(inputPanel, PopupGlobalLeft,
                                                PopupGlobalTop).x
        y = root.parent.mapFromItem(inputPanel, PopupGlobalLeft,
                                    PopupGlobalTop).y
        if (PopupGlobalLeft < 0)
            x = 0
        else if ((PopupGlobalLeft + width) > inputPanel.width)
            x = PopupLeft - (PopupGlobalLeft + width - inputPanel.width)
        else
            x = PopupLeft
        txt.text = InputEngine.uppercase ? keybutton.text.toUpperCase(
                                               ) : keybutton.text

        txt.font.family = keybutton.font.family
        root.visible = Qt.binding(function () {
            return keybutton.pressed
        })
    }

    width: 40
    height: 40
    visible: false

    Rectangle {
        id: popup

        anchors.fill: parent
        radius: 8
        z: shadow.z + 1

        Text {
            id: txt

            anchors.fill: parent
            fontSizeMode: Text.Fit
            font.pixelSize: height * 0.7
            color: ThemeManager.currentTheme.btnTextColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        gradient: Gradient {
            GradientStop {
                position: 0
                color: ThemeManager.currentTheme.btnSpecialBackgroundColor
            }

            GradientStop {
                position: 1
                color: ThemeManager.currentTheme.btnBackgroundColor
            }
        }
    }

    Rectangle {
        id: shadow

        width: popup.width
        height: popup.height
        radius: popup.radius
        color: "#3F000000"
        x: 4
        y: 4
    }
}
