import SKeyboard 1.0
import QtQuick 2.0

Key {
    weight: 112
    btnKey: Qt.Key_Context2
    btnIcon: ThemeManager.currentTheme.languageIcon
    btnDisplayedText: InputEngine.languageLayout.toUpperCase()
    functionKey: true
    showPreview: false
    btnIconSize: Qt.size(24, 24)
    btnBackground: ThemeManager.currentTheme.btnSpecialBackgroundColor
    onClicked: {
        InputEngine.cycleLanguageLayout()
    }
}
