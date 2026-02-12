import SKeyboard 1.0
import QtQuick 2.0

Key {
    btnKey: Qt.Key_Enter
    repeatable: true
    showPreview: false
    btnBackground: Theme.btnEnterBackgroundColor
    btnText: "\n"
    btnDisplayedText: "Enter"
    btnIcon: Theme.getThemedUrl("keyboard_return.svg")
    enabled: InputContext.inputItem ? InputContext.inputItem.EnterKeyAction.enabled : true
    opacity: enabled ? 1 : 0.5
}
