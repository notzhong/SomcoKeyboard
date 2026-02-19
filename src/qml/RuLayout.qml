import QtQuick 2.0
import QtQuick.Layouts 1.12

ColumnLayout {
    property var inputPanel

    RowLayout {
        property real keyWeight: 160

        Key {            
            text: "й"
            inputPanelRef: inputPanel
        }

        Key {            
            text: "ц"
            inputPanelRef: inputPanel
        }

        Key {            
            text: "у"            
            inputPanelRef: inputPanel
        }

        Key {
            text: "к"
            inputPanelRef: inputPanel
        }

        Key {            
            text: "е"
            alternativeKeys: "ё"
            inputPanelRef: inputPanel
        }

        Key {
            text: "н"            
            inputPanelRef: inputPanel
        }

        Key {
            text: "г"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ш"
            inputPanelRef: inputPanel
        }

        Key {
            text: "щ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "з"
            inputPanelRef: inputPanel
        }

        Key {
            text: "х"
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
            text: "ф"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ы"
            inputPanelRef: inputPanel
        }

        Key {        
            text: "в"            
            inputPanelRef: inputPanel
        }

        Key {
            text: "а"
            inputPanelRef: inputPanel
        }

        Key {            
            text: "п"
            inputPanelRef: inputPanel
        }

        Key {            
            text: "р"
            inputPanelRef: inputPanel
        }

        Key {
            text: "о"
            inputPanelRef: inputPanel
        }

        Key {            
            text: "л"
            inputPanelRef: inputPanel
        }

        Key {            
            text: "д"        
            inputPanelRef: inputPanel
        }

        Key {            
            text: "ж"
            inputPanelRef: inputPanel
        }

        Key {            
            text: "э"
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
            text: "я"            
            inputPanelRef: inputPanel
        }

        Key {
            text: "ч"
            inputPanelRef: inputPanel
        }

        Key {
            text: "с"            
            inputPanelRef: inputPanel
        }

        Key {
            text: "м"
            inputPanelRef: inputPanel
        }

        Key {
            text: "и"
            inputPanelRef: inputPanel
        }

        Key {
            text: "т"
            inputPanelRef: inputPanel
        }

        Key {
            text: "ь"
            alternativeKeys: "ъ"
            inputPanelRef: inputPanel
        }

        Key {
            text: "б"
            inputPanelRef: inputPanel
        }

        Key {            
            text: "ю"
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
            btnKey: Qt.Key_Period
            text: "."
            alternativeKeys: ","
            inputPanelRef: inputPanel
        }

        HideKey {
            weight: 205
        }

    }

}
