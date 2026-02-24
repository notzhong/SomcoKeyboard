import SomcoKeyboard 1.0
import QtQuick 2.0

Key {
    functionKey: true
    showPreview: false
    btnBackground: "transparent"
    btnIcon: ThemeManager.currentTheme.hideKeyboardIcon
    weight: 112
    onClicked: Qt.inputMethod.hide()
}
