import QtQuick 2.0
import QtQuick.Layouts 1.12
import SKeyboard 1.0

ColumnLayout {
    id: root

    property var inputPanel

    spacing: root.inputPanel.spacing

    RowLayout {
        spacing: root.inputPanel.spacing
        Key {
            btnKey: Qt.Key_Q
            btnText: "q"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_W
            btnText: "w"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_E
            btnText: "e"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_R
            btnText: "r"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_T
            btnText: "t"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_Z
            btnText: "z"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_U
            btnText: "u"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_I
            btnText: "i"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_O
            btnText: "o"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_P
            btnText: "p"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_Udiaeresis
            btnText: "ü"
            inputPanelRef: root.inputPanel
        }

        BackspaceKey {
            inputPanelRef: root.inputPanel
        }
    }

    RowLayout {
        spacing: root.inputPanel.spacing
        Key {
            weight: 19
            functionKey: true
            showPreview: false
            btnBackground: "transparent"
        }

        Key {
            btnKey: Qt.Key_A
            btnText: "a"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_S
            btnText: "s"
            alternativeKeys: "ß"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_D
            btnText: "d"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_F
            btnText: "f"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_G
            btnText: "g"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_H
            btnText: "h"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_J
            btnText: "j"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_K
            btnText: "k"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_L
            btnText: "l"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_Odiaeresis
            btnText: "ö"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_Adiaeresis
            btnText: "ä"
            inputPanelRef: root.inputPanel
        }

        EnterKey {
            weight: 205
            inputPanelRef: root.inputPanel
        }
    }

    RowLayout {
        spacing: root.inputPanel.spacing

        ShiftKey {
            weight: 105
        }

        Key {
            btnKey: Qt.Key_Y
            btnText: "y"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_X
            btnText: "x"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_C
            btnText: "c"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_V
            btnText: "v"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_B
            btnText: "b"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_N
            btnText: "n"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_M
            btnText: "m"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_Comma
            btnText: ","
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_Period
            btnText: "."
            inputPanelRef: root.inputPanel
        }

        Key {
            btnKey: Qt.Key_Minus
            btnText: "-"
            inputPanelRef: root.inputPanel
        }

        Key {
            weight: 112
            functionKey: true
            showPreview: false
            btnBackground: "transparent"
        }
    }

    RowLayout {
        spacing: root.inputPanel.spacing

        LanguageKey {
            visible: InputPanel.availableLanguageLayouts.length > 1
            weight: 112
        }

        SpaceKey {
            weight: 640
            inputPanelRef: root.inputPanel
        }

        SymbolKey {
            weight: 112
        }

        HideKey {
            weight: 112
        }
    }
}
