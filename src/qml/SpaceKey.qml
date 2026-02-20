import QtQuick 2.0
import SomcoKeyboard 1.0

Key {
    btnKey: Qt.Key_Space
    text: " "
    btnDisplayedText: ""
    showPreview: false
    repeatable: true
    btnIcon: ThemeManager.currentTheme.spaceIcon
}
