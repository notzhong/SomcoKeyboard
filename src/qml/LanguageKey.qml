import QtQuick 2.0
import SomcoKeyboard 1.0

Key {
    weight: 112
    btnKey: Qt.Key_Context2
    btnIcon: ThemeManager.currentTheme.languageIcon
    btnDisplayedText: InputEngine.languageLayout.toUpperCase()
    enabled: InputEngine.availableLanguageLayouts.length > 1
    functionKey: true
    showPreview: false
    btnIconSize: Qt.size(24, 24)
    btnBackground: ThemeManager.currentTheme.btnSpecialBackgroundColor
    onClicked: {
        InputEngine.cycleLanguageLayout()
    }
}
