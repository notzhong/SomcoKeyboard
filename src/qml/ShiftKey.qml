import SKeyboard 1.0
import QtQuick 2.0

Key {
    btnKey: Qt.Key_Shift
    functionKey: true
    showPreview: false
    btnBackground: Theme.btnSpecialBackgroundColor
    btnIcon: InputEngine.uppercase ? Theme.getThemedUrl("caps-lock-on.svg") : Theme.getThemedUrl("caps-lock-off.svg")
    onClicked: InputEngine.uppercase = !InputEngine.uppercase
}
