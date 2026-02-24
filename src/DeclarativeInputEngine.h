/**
 * \file DeclarativeInputEngine.h
 *
 * \brief Declaration of CDeclarativeInputEngine
 *
 * \author Uwe Kindler
 * \date 08/01/2015
 *
 * Copyright (c) 2015 Uwe Kindler
 */

#pragma once

#include <QObject>
#include <QRect>
#include <qqml.h>

struct DeclarativeInputEnginePrivate;

/**
 * The input engine provides input context information and is responsible
 * for routing input events to focused QML items.
 * The InputEngine can be accessed as singleton instance from QML
 */
class DeclarativeInputEngine : public QObject
{
    Q_OBJECT
    QML_SINGLETON

    // clang-format off
    /** The geometry of the currently visible keyboard in screen coordinates. */
    Q_PROPERTY(QRect keyboardRectangle READ keyboardRectangle WRITE setKeyboardRectangle NOTIFY keyboardRectangleChanged FINAL)

    /** Indicates whether the keyboard is currently animating (e.g., opening or closing). */
    Q_PROPERTY(bool animating READ isAnimating WRITE setAnimating NOTIFY animatingChanged FINAL)

    /** Current input mode, e.g., Letters or DigitsOnly. \sa InputMode */
    Q_PROPERTY(int inputMode READ inputMode WRITE setInputMode NOTIFY inputModeChanged FINAL)

    /** True if the next character should be uppercase (shift pressed). */
    Q_PROPERTY(bool uppercase READ isUppercase WRITE setUppercase NOTIFY isUppercaseChanged FINAL)

    /** True if the keyboard is in symbol mode (e.g., showing punctuation). */
    Q_PROPERTY(bool symbolMode READ isSymbolMode WRITE setSymbolMode NOTIFY isSymbolModeChanged FINAL)

    /** List of available language layout identifiers (e.g., "En", "Fr", "De"). */
    Q_PROPERTY(QStringList availableLanguageLayouts READ availableLanguageLayouts WRITE setAvailableLanguageLayouts NOTIFY availableLanguageLayoutsChanged FINAL)

    /** The currently selected language layout identifier. */
    Q_PROPERTY(QString languageLayout READ languageLayout WRITE setLanguageLayout NOTIFY languageLayoutChanged FINAL)
    // clang-format on

public:
    /**
     * Predefined identifiers for supported input layouts (ISO 639-1).
     * These are used to reference layout files and descriptions.
     */
    enum InputLayouts
    {
        Cs,   ///< Czech
        CyBs, ///< Bosnian (Cyrillic)
        CySr, ///< Serbian (Cyrillic)
        Da,   ///< Danish
        De,   ///< German
        El,   ///< Greek
        En,   ///< English
        Es,   ///< Spanish
        Fi,   ///< Finnish
        Fr,   ///< French
        It,   ///< Italian
        LtBs, ///< Bosnian (Latin)
        Hr,   ///< Croatian (Latin)
        LtSr, ///< Serbian (Latin)
        Nl,   ///< Dutch
        Pl,   ///< Polish
        Pt,   ///< Portuguese
        Ru,   ///< Russian
        Sv,   ///< Swedish
        Uk,   ///< Ukrainian
    };
    Q_ENUM(InputLayouts)

    /**
     * Input modes that determine which character set is active.
     */
    enum InputMode
    {
        Letters,   ///< Alphabetic keys (letters)
        DigitsOnly ///< Numeric keypad (digits only)
    };
    Q_ENUM(InputMode)

    /**
     * Constructs a declarative input engine with the given parent.
     */
    explicit DeclarativeInputEngine(QObject* parent = nullptr);

    /**
     * Destructor.
     */
    virtual ~DeclarativeInputEngine();

    /**
     * Returns the current keyboard rectangle in screen coordinates.
     */
    QRect keyboardRectangle() const;

    /**
     * Returns true if the keyboard is currently animating.
     */
    bool isAnimating() const;

    /**
     * Sets the animating status. Used during UI transitions to prevent
     * interference with ongoing animations.
     */
    void setAnimating(bool Animating);

    /**
     * Returns the current input mode.
     * \see InputMode for possible values.
     */
    int inputMode() const;

    /**
     * Sets the current input mode.
     * \see InputMode for possible values.
     */
    void setInputMode(int Mode);

    /**
     * Returns true if uppercase (shift) is active.
     */
    bool isUppercase() const;

    /**
     * Sets the uppercase (shift) state.
     */
    void setUppercase(bool uppercase);

    /**
     * Returns true if symbol mode is active.
     */
    bool isSymbolMode() const;

    /**
     * Sets the symbol mode state.
     */
    void setSymbolMode(bool symbolMode);

    /**
     * Returns the list of available language layout identifiers.
     */
    QStringList availableLanguageLayouts() const;

    /**
     * Sets the list of available language layouts.
     * If the current language layout is not in the new list, the first
     * available layout is selected automatically.
     */
    void setAvailableLanguageLayouts(const QStringList& availableLanguageLayouts);

    /**
     * Returns the currently selected language layout identifier.
     */
    QString languageLayout() const;

    /**
     * Sets the current language layout. The layout must be present in
     * availableLanguageLayouts, otherwise the change is ignored (a warning
     * may be logged).
     */
    void setLanguageLayout(const QString& languageLayout);

    /**
     * Cycles to the next available language layout in the list.
     * If the current layout is invalid, the first layout is selected.
     */
    Q_INVOKABLE void cycleLanguageLayout();

    /**
     * Checks whether the given layout identifier corresponds to a valid
     * input layout that can be activated.
     */
    Q_INVOKABLE bool inputLayoutValid(const QString& layout) const;

    /**
     * Returns the file name (without path) for the given layout identifier.
     * Some layouts share a common file (e.g., several languages use the same
     * base keyboard layout).
     */
    Q_INVOKABLE QString fileOfLayout(QString layout);

    /**
     * Returns a human‑readable description for the given layout (e.g., "English").
     */
    Q_INVOKABLE QString descriptionOfLayout(QString layout);

    /**
     * Returns the text to display on the spacebar for the given layout
     * (e.g., "space" in the appropriate language).
     */
    Q_INVOKABLE QString spaceIdentifierOfLayout(QString layout);

    /**
     * Simulates a key click on the virtual keyboard. Not yet fully implemented.
     * \param key          Qt key code
     * \param text         Text generated by the key
     * \param modifiers    Keyboard modifiers (Shift, Ctrl, etc.)
     * \return true if the event was accepted by the input engine
     */
    Q_INVOKABLE bool virtualKeyClick(Qt::Key key, const QString& text, Qt::KeyboardModifiers modifiers);

    /**
     * Informs the engine about the current keyboard rectangle. This should be
     * called whenever the keyboard's geometry changes (e.g., during resizing
     * or repositioning).
     */
    Q_INVOKABLE void setKeyboardRectangle(const QRect& Rect);

signals:
    /** Emitted when the keyboard rectangle changes. */
    void keyboardRectangleChanged();

    /** Emitted when the animating property changes. */
    void animatingChanged();

    /** Emitted when the input mode changes. */
    void inputModeChanged();

    /** Emitted when the uppercase (shift) state changes. */
    void isUppercaseChanged();

    /** Emitted when the symbol mode state changes. */
    void isSymbolModeChanged();

    /** Emitted when the list of available language layouts changes. */
    void availableLanguageLayoutsChanged();

    /** Emitted when the current language layout changes. */
    void languageLayoutChanged();

private:
    DeclarativeInputEnginePrivate* d;

    friend struct DeclarativeInputEnginePrivate;

private slots:
    /**
     * Internal slot called when an animation finishes.
     * Used to update the animating property accordingly.
     */
    void animatingFinished();
};
