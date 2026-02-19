#pragma once

#include <QObject>
#include "KeyboardTheme.h"
/*!
 * \brief The InputPanelIface class contains properties shared between the
 * keyboards component.
 */
class InputPanelIface : public QObject {
    Q_OBJECT

    // clang-format off
    Q_PROPERTY(QStringList availableLanguageLayouts READ availableLanguageLayouts WRITE setAvailableLanguageLayouts NOTIFY availableLanguageLayoutsChanged)
    Q_PROPERTY(QString languageLayout READ languageLayout WRITE setLanguageLayout NOTIFY languageLayoutChanged FINAL)
    Q_PROPERTY(KeyboardTheme::KeyboardTheme keyboardTheme READ keyboardTheme WRITE setKeyboardTheme NOTIFY keyboardThemeChanged FINAL)
    // clang-format on

public:
    explicit InputPanelIface(QObject *parent = nullptr);
    ~InputPanelIface();

    QStringList availableLanguageLayouts() const;
    void setAvailableLanguageLayouts(const QStringList &availableLanguageLayouts);

    QString languageLayout() const;
    void setLanguageLayout(const QString &languageLayout);

    KeyboardTheme::KeyboardTheme keyboardTheme() const;
    void setKeyboardTheme(KeyboardTheme::KeyboardTheme theme);

signals:
    void availableLanguageLayoutsChanged();
    void languageLayoutChanged();
    void keyboardThemeChanged();

private:
    struct InputPanelIfacePrivate;
    InputPanelIfacePrivate *pimpl;
};
