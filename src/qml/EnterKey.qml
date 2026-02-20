import QtQuick 2.0
import SKeyboard 1.0

Key {
    btnKey: Qt.Key_Enter
    repeatable: true
    showPreview: false
    btnBackground: ThemeManager.currentTheme.btnEnterBackgroundColor
    text: "\n"
    btnDisplayedText: "Enter"
    btnIcon: ThemeManager.currentTheme.enterIcon
    enabled: InputContext.inputItem ? InputContext.inputItem.EnterKeyAction.enabled : true
    opacity: enabled ? 1 : 0.5
}
