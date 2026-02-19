import QtQuick 2.0
import QtQml 2.0

import SKeyboard 1.0

Item {
    id: root

    readonly property bool active: Qt.inputMethod.visible

    property var availableLanguageLayouts: ["En", "De", "Ua"]
    property string languageLayout: "En"
    property int spacing: 16

    property int keyboardTheme: KeyboardTheme.Dark

    /*! \internal */
    readonly property bool __isRootItem: root.parent !== null
                                         && root.parent.parent === null

    function showKeyPopup(keyButton) {
        keyPopup.popup(keyButton, root)
    }

    function hideKeyPopup() {
        keyPopup.visible = false
    }

    function showAlternativesKeyPopup(keyButton) {
        alternativesKeyPopup.open(keyButton, root)
    }

    function loadLettersLayout() {
        var source = InputEngine.fileOfLayout(languageLayout)
        if (source === "") {
            InputPanel.languageLayout = "En"
            return
        }

        var description = InputEngine.descriptionOfLayout(languageLayout)
        var spaceIdentifier = InputEngine.spaceIdentifierOfLayout(
                    languageLayout)
        if (description !== "" && source !== "") {
            layoutLoader.langDescription = description
            layoutLoader.spaceIdentifier = spaceIdentifier
            layoutLoader.setSource(source + ".qml", {
                                       "inputPanel": root
                                   })
        } else {
            layoutLoader.langDescription = "English"
            layoutLoader.spaceIdentifier = "space"
            layoutLoader.setSource("EnLayout.qml", {
                                       "inputPanel": root
                                   })
        }
    }
    objectName: "inputPanel"
    width: parent.width
    height: 340
    onYChanged: InputEngine.setKeyboardRectangle(Qt.rect(x, y, width, height))
    onActiveChanged: {
        if (alternativesKeyPopup.visible && !active)
            alternativesKeyPopup.visible = false
    }
    onLanguageLayoutChanged: loadLettersLayout()
    onKeyboardThemeChanged: InputPanel.keyboardTheme = keyboardTheme
    Component.onCompleted: {
        InputContext.registerInputPanel(root)

        if (availableLanguageLayouts.length == 0)
            availableLanguageLayouts = ["En"]

        InputPanel.availableLanguageLayouts = availableLanguageLayouts
        InputPanel.languageLayout = languageLayout
        InputPanel.keyboardTheme = keyboardTheme
        loadLettersLayout()
    }

    KeyPopup {
        id: keyPopup

        visible: false
        z: 100
    }

    AlternativeKeysPopup {
        id: alternativesKeyPopup

        visible: false
        z: 100
    }

    Rectangle {
        anchors.fill: parent
        visible: alternativesKeyPopup.visible
        z: alternativesKeyPopup.z - 1
        color: "#80000000"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                alternativesKeyPopup.visible = false
            }
        }
    }

    Rectangle {
        id: keyboardRect

        anchors.fill: parent
        color: Theme.overlayBackgroundColor

        Rectangle {
            anchors {
                fill: parent
                margins: 16
            }
            color: Theme.backgroundColor
            radius: 12

            Loader {
                id: layoutLoader

                // lang description only needed for layouts that share a file
                property string langDescription
                // space identifier for the correct translation of the word "space"
                property string spaceIdentifier

                anchors {
                    fill: parent
                    margins: root.spacing
                }
            }

            Connections {
                function refreshLayouts() {
                    if (InputEngine.symbolMode)
                        layoutLoader.setSource("SymbolLayout.qml", {
                                                   "inputPanel": root
                                               })
                    else if (InputEngine.inputMode === InputEngine.DigitsOnly)
                        layoutLoader.setSource("DigitsLayout.qml", {
                                                   "inputPanel": root
                                               })
                    else
                        loadLettersLayout()
                }

                function onInputModeChanged() {
                    refreshLayouts()
                }

                function onIsSymbolModeChanged() {
                    refreshLayouts()
                }

                target: InputEngine
            }

            Connections {
                function onLanguageLayoutChanged() {
                    languageLayout = InputPanel.languageLayout
                    loadLettersLayout()
                }

                function onKeyboardThemeChanged() {
                    root.keyboardTheme = InputPanel.keyboardTheme
                    Theme.setTheme(root.keyboardTheme)
                }

                target: InputPanel
            }
        }
    }
}
