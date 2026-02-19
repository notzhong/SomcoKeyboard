import QtQuick 2.0
import QtQuick.Layouts 1.12

ColumnLayout {
    property var inputPanel

    RowLayout {
        property real keyWeight: 160

        Key {
            btnKey: Qt.Key_Q
            text: "q"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_W
            text: "w"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_E
            text: "e"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_R
            text: "r"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_T
            text: "t"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_Y
            text: "y"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_U
            text: "u"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_I
            text: "i"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_O
            text: "o"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_P
            text: "p"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_Aring
            text: "å"
            inputPanelRef: inputPanel
        }

        BackspaceKey {
            inputPanelRef: inputPanel
        }

    }

    RowLayout {
        property real keyWeight: 160

        Key {
            weight: 56
            functionKey: true
            showPreview: false
            btnBackground: "transparent"
        }

        Key {
            btnKey: Qt.Key_A
            text: "a"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_S
            text: "s"
            alternativeKeys: "ß"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_D
            text: "d"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_F
            text: "f"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_G
            text: "g"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_H
            text: "h"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_J
            text: "j"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_K
            text: "k"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_L
            text: "l"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_Odiaeresis
            text: "ö"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_Adiaeresis
            text: "ä"
            inputPanelRef: inputPanel
        }

        EnterKey {
            weight: 283
            inputPanelRef: inputPanel
        }

    }

    RowLayout {
        property real keyWeight: 156

        ShiftKey {
        }

        Key {
            btnKey: Qt.Key_Z
            text: "z"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_X
            text: "x"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_C
            text: "c"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_V
            text: "v"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_B
            text: "b"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_N
            text: "n"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_M
            text: "m"
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_Comma
            text: ","
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_Period
            text: "."
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_Minus
            text: "-"
            inputPanelRef: inputPanel
        }

        ShiftKey {
            weight: 204
        }

    }

    RowLayout {
        property real keyWeight: 154

        SymbolKey {
            weight: availableLanguageLayouts.length === 1 ? 217 : 108.5
        }

        LanguageKey {
            visible: availableLanguageLayouts.length > 1
            weight: 108.5
        }

        SpaceKey {
            weight: 1168
            inputPanelRef: inputPanel
        }

        Key {
            btnKey: Qt.Key_Apostrophe
            text: "'"
            inputPanelRef: inputPanel
        }

        HideKey {
            weight: 205
        }

    }

}
