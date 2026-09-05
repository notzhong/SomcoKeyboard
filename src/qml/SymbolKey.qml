import SomcoKeyboard 1.0
import QtQuick 2.0

Key {
    objectName: inputPanelRef.objectName + "Key_Symbol"
    btnKey: Qt.Key_Context1
    btnDisplayedText: !InputEngine.symbolMode ? "12?!." : "abcd"
    functionKey: true
    showPreview: false
    btnBackground: ThemeManager.currentTheme.btnSpecialBackgroundColor
    weight: 112
    onClicked: InputEngine.symbolMode = !InputEngine.symbolMode
}
