import QtQuick 2.0
import QtQuick.Layouts 1.12

ColumnLayout {
    property var inputPanel

    RowLayout {
        property real keyWeight: 160

        Key {
            text: "ς"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ε"
            alternativeKeys: "έ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ρ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "τ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ψ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "υ"
            alternativeKeys: "ύϋΰ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "θ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ι"
            alternativeKeys: "ίϊΐ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ο"
            alternativeKeys: "ό"
            inputPanelRef: inputPanel
        }

        Key {
            text: "π"
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
            text: "α"
            alternativeKeys: "ά"
            inputPanelRef: inputPanel
        }

        Key {
            text: "σ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "δ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "φ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "γ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "η"
            alternativeKeys: "ή"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ξ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "κ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "λ"
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
            text: "ζ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "χ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ψ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ω"
            alternativeKeys: "ώ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "β"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ν"
            inputPanelRef: inputPanel
        }

        Key {
            text: "μ"
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
            alternativeKeys: "!.;?"
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
