import SKeyboard 1.0
import QtQuick 2.0

Key {
    functionKey: true
    showPreview: false
    onClicked: Qt.inputMethod.hide()
    btnBackground: "transparent"
    btnIcon: "qrc:/icons/SKeyboard/keyboard_hide.svg"
}
