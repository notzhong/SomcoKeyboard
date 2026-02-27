import QtQuick 2.0
import QtQuick.Controls.Basic
import QtQuick.Layouts
import SomcoKeyboard 1.0

Button {
    id: key
    objectName: (inputPanelRef ? inputPanelRef.objectName : "") + (btnDisplayedText ? btnDisplayedText : text)

    property real weight: 70
    property string btnDisplayedText: key.text

    property int btnKey: Qt.Key_unknown
    property color btnBackground: ThemeManager.currentTheme.btnBackgroundColor
    property string btnIcon: ""
    property size btnIconSize: Qt.size(35, 35)
    property var alternativeKeys: []
    property var inputPanelRef
    property alias repeatable: key.autoRepeat
    property bool showPreview: true
    property bool functionKey: false

    focusPolicy: Qt.NoFocus
    Layout.minimumWidth: key.implicitWidth
    Layout.minimumHeight: key.implicitHeight
    Layout.preferredWidth: weight
    Layout.fillWidth: true
    Layout.fillHeight: true
    onPressed: {
        if (key.inputPanelRef !== null && key.showPreview)
            key.inputPanelRef.showKeyPopup(key)
    }
    onPressedChanged: {
        if (key.pressed) {
            key.opacity = 0.7
            if (key.alternativeKeys.length > 0)
                longPressTimer.running = true
        } else {
            key.opacity = 1
            longPressTimer.running = false
        }
    }
    onReleased: {
        if (!functionKey) {
            InputEngine.virtualKeyClick(btnKey, InputEngine.uppercase ? key.text.toUpperCase() : key.text,
                                        InputEngine.uppercase ? Qt.ShiftModifier : Qt.NoModifier)
            if (!InputEngine.persistentUppercase)
                InputEngine.uppercase = false
        }
    }

    Timer {
        id: longPressTimer

        interval: 800
        repeat: false
        running: false
        onTriggered: {
            key.enabled = false
            key.inputPanelRef.showAlternativesKeyPopup(key)
            key.enabled = true
        }
    }

    background: Rectangle {
        color: key.btnBackground
        radius: 8
    }

    contentItem: Item {
        anchors.fill: parent
        RowLayout {
            spacing: 16
            anchors.centerIn: parent

            Text {
                text: key.btnDisplayedText
                color: ThemeManager.currentTheme.btnTextColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                visible: key.btnDisplayedText !== ""
                font {
                    family: ThemeManager.currentTheme.btnTextFontFamily
                    weight: Font.Normal
                    pixelSize: ThemeManager.currentTheme.btnTextFontSize
                    capitalization: InputEngine.uppercase ? Font.AllUppercase : Font.MixedCase
                }
            }

            Image {
                source: key.btnIcon
                visible: key.btnIcon !== ""
                fillMode: Image.PreserveAspectFit
                Layout.preferredWidth: key.btnIconSize.width
                Layout.preferredHeight: key.btnIconSize.height
            }
        }
    }
}
