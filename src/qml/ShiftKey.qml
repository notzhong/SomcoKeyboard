import SKeyboard 1.0
import QtQuick 2.0

Key {
    btnKey: Qt.Key_Shift
    functionKey: true
    showPreview: false
    btnBackground: ThemeManager.currentTheme.btnSpecialBackgroundColor
    btnIcon: InputEngine.uppercase ? ThemeManager.currentTheme.shiftOnIcon : ThemeManager.currentTheme.shiftOffIcon
    onClicked: InputEngine.uppercase = !InputEngine.uppercase
}
