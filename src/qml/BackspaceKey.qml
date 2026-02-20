import QtQuick 2.0
import SomcoKeyboard 1.0

Key {
    btnKey: Qt.Key_Backspace
    weight: 150
    repeatable: true
    showPreview: false
    btnBackground: ThemeManager.currentTheme.btnSpecialBackgroundColor
    btnIcon: ThemeManager.currentTheme.backspaceIcon
}
