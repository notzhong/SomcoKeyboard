import QtQuick 2.0
import SomcoKeyboard 1.0

Key {
    objectName: inputPanelRef.objectName + "Key_Shift"
    weight: 112
    btnKey: Qt.Key_Shift
    functionKey: true
    showPreview: false
    btnBackground: ThemeManager.currentTheme.btnSpecialBackgroundColor
    btnIcon: {
        switch (InputEngine.shiftState) {
        case InputEngine.ShiftOn:
            return ThemeManager.currentTheme.shiftOnIcon
        case InputEngine.CapsLock:
            return ThemeManager.currentTheme.capsLockIcon
        default:
            return ThemeManager.currentTheme.shiftOffIcon
        }
    }
    onClicked: {
        var newState = (InputEngine.shiftState + 1) % 3
        InputEngine.shiftState = newState
    }
}
