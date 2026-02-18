import QtQuick 2.0
import SomcoKeyboard 1.0

Key {
    objectName: inputPanelRef.objectName + "Key_Shift"
    weight: 112
    btnKey: Qt.Key_Shift
    functionKey: true
    showPreview: false
    btnBackground: ThemeManager.currentTheme.btnSpecialBackgroundColor
    btnIcon: InputEngine.uppercase ? ThemeManager.currentTheme.shiftOnIcon : ThemeManager.currentTheme.shiftOffIcon
    onClicked: InputEngine.uppercase = !InputEngine.uppercase
}
