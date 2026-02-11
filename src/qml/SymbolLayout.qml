import QtQuick 2.0
import QtQuick.Layouts 1.12

Item {
    id: root
    property var inputPanel
    property bool secondPage

    onVisibleChanged: {
        if (!visible)
            secondPage = false
    }

    ColumnLayout {
        id: page1

        anchors.fill: parent
        visible: !root.secondPage
        spacing: root.inputPanel.spacing

        RowLayout {
            spacing: root.inputPanel.spacing

            Key {
                btnKey: Qt.Key_1
                btnText: "1"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_2
                btnText: "2"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_3
                btnText: "3"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_4
                btnText: "4"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_5
                btnText: "5"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_6
                btnText: "6"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_7
                btnText: "7"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_8
                btnText: "8"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_9
                btnText: "9"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_0
                btnText: "0"
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
                btnKey: Qt.Key_At
                btnText: "@"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_NumberSign
                btnText: "#"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Percent
                btnText: "%"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Ampersand
                btnText: "&"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Asterisk
                btnText: "*"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Minus
                btnText: "-"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Plus
                btnText: "+"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_ParenLeft
                btnText: "("
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_ParenRight
                btnText: ")"
                inputPanelRef: root.inputPanel
            }

            EnterKey {
                weight: 205
                inputPanelRef: root.inputPanel
            }
        }

        RowLayout {
            spacing: root.inputPanel.spacing
            Key {
                weight: 105
                btnDisplayedText: "1/2"
                showPreview: false
                functionKey: true
                onClicked: root.secondPage = !root.secondPage
            }

            Key {
                btnKey: Qt.Key_Exclam
                btnText: "!"
                alternativeKeys: "¡"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_QuoteDbl
                btnText: '"'
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Less
                btnText: "<"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Greater
                btnText: ">"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Apostrophe
                btnText: "'"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Colon
                btnText: ":"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Semicolon
                btnText: ";"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Slash
                btnText: "/"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Question
                btnText: "?"
                alternativeKeys: "¿"
                inputPanelRef: root.inputPanel
            }

            Key {
                weight: 115
                btnDisplayedText: "1/2"
                showPreview: false
                functionKey: true
                onClicked: root.secondPage = !root.secondPage
            }
        }

        RowLayout {
            spacing: root.inputPanel.spacing
            Key {
                weight: 112
                functionKey: true
                showPreview: false
                btnBackground: "transparent"
            }

            SpaceKey {
                inputPanelRef: root.inputPanel
                weight: 640
            }

            SymbolKey {
                inputPanelRef: root.inputPanel
                weight: 112
            }

            HideKey {
                weight: 112
            }
        }
    }

    ColumnLayout {
        id: page2

        anchors.fill: parent
        visible: root.secondPage
        spacing: root.inputPanel.spacing

        RowLayout {
            spacing: root.inputPanel.spacing

            Key {
                btnKey: Qt.Key_AsciiTilde
                btnText: "~"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Agrave
                btnText: "`"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Bar
                btnText: "|"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_periodcentered
                btnText: "·"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: 8730
                btnText: "√"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_division
                btnText: "÷"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_multiply
                btnText: "×"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_onehalf
                btnText: "½"
                alternativeKeys: "¼⅓¾⅞"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_BraceLeft
                btnText: "{"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_BraceRight
                btnText: "}"
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
                btnKey: Qt.Key_Dollar
                btnText: "$"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: 8364
                btnText: "€"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: 194
                btnText: "£"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: 162
                btnText: "¢"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: 165
                btnText: "¥"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Equal
                btnText: "="
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_section
                btnText: "§"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_BracketLeft
                btnText: "["
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_BracketRight
                btnText: "]"
                inputPanelRef: root.inputPanel
            }

            EnterKey {
                weight: 205
                inputPanelRef: root.inputPanel
            }
        }

        RowLayout {
            spacing: root.inputPanel.spacing

            Key {
                weight: 105
                btnDisplayedText: "2/2"
                showPreview: false
                functionKey: true
                onClicked: secondPage = !secondPage
            }

            Key {
                btnKey: Qt.Key_Underscore
                btnText: "_"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: 8482
                btnText: '™'
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: 174
                btnText: '®'
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_guillemotleft
                btnText: '«'
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_guillemotright
                btnText: '»'
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: 8220
                btnText: '“'
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: 8221
                btnText: '”'
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_Backslash
                btnText: "\\"
                inputPanelRef: root.inputPanel
            }

            Key {
                btnKey: Qt.Key_AsciiCircum
                btnText: "^"
                inputPanelRef: root.inputPanel
            }

            Key {
                weight: 115
                btnDisplayedText: "2/2"
                showPreview: false
                functionKey: true
                onClicked: root.secondPage = !root.secondPage
            }
        }

        RowLayout {
            spacing: root.inputPanel.spacing

            Key {
                weight: 112
                functionKey: true
                showPreview: false
                btnBackground: "transparent"
            }

            SpaceKey {
                inputPanelRef: root.inputPanel
                weight: 640
            }

            SymbolKey {
                inputPanelRef: root.inputPanel
                weight: 112
            }

            HideKey {
                weight: 112
            }
        }
    }
}
