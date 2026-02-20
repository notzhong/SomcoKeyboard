import SKeyboard 1.0
import QtQuick 2.0

Key {
    btnKey: Qt.Key_Context1
    btnDisplayedText: !InputEngine.symbolMode ? ".?$%^" : "abcd"
    functionKey: true
    showPreview: false
    btnBackground: ThemeManager.currentTheme.btnSpecialBackgroundColor
    onClicked: InputEngine.symbolMode = !InputEngine.symbolMode
}
