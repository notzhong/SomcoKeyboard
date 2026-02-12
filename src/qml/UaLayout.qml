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
            btnText: "й"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "ц"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "у"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "к"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "е"
            alternativeKeys: "ё"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "н"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "г"
            alternativeKeys: "ґ"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "ш"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "щ"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "з"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "х"
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
            btnText: "ф"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "і"
            alternativeKeys: "ї"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "в"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "а"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "п"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "р"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "о"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "л"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "д"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "ж"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "є"
            alternativeKeys: "э"
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
            btnText: "я"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "ч"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "с"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "м"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "и"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "т"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "ь"
            alternativeKeys: "ъ"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "б"
            inputPanelRef: root.inputPanel
        }

        Key {
            btnText: "ю"
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
            inputPanelRef: root.inputPanel
        }

        SpaceKey {
            weight: 640
            inputPanelRef: root.inputPanel
        }

        SymbolKey {
            weight: 112
            inputPanelRef: root.inputPanel
        }

        HideKey {
            weight: 112
        }
    }
}
