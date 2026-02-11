import SKeyboard 1.0
import QtQuick 2.0

Key {
    btnKey: Qt.Key_Shift
    functionKey: true
    showPreview: false
    btnBackground: Theme.btnSpecialBackgroundColor
    btnIcon: InputEngine.uppercase ? "qrc:/icons/SKeyboard/caps-lock-on.svg" : "qrc:/icons/SKeyboard/caps-lock-off.svg"
    onClicked: InputEngine.uppercase = !InputEngine.uppercase
}
