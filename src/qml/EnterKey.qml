import QtQuick 2.0
import SomcoKeyboard 1.0

Key {
    btnKey: Qt.Key_Enter
    repeatable: true
    showPreview: false
    btnBackground: ThemeManager.currentTheme.btnEnterBackgroundColor
    text: "\n"
    btnDisplayedText: "Enter"
    weight: 205
    btnIcon: ThemeManager.currentTheme.enterIcon
    enabled: InputContext.inputItem ? InputContext.inputItem.EnterKeyAction.enabled : true
    opacity: enabled ? 1 : 0.5
}
