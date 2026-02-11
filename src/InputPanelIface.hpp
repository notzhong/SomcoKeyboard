#pragma once

#include <QObject>

/*!
 * \brief The InputPanelIface class contains properties shared between the
 * keyboards component.
 */
class InputPanelIface : public QObject {
    Q_OBJECT

    // clang-format off
    Q_PROPERTY(QStringList availableLanguageLayouts READ availableLanguageLayouts WRITE setAvailableLanguageLayouts NOTIFY availableLanguageLayoutsChanged)
    Q_PROPERTY(QString languageLayout READ languageLayout WRITE setLanguageLayout NOTIFY languageLayoutChanged FINAL)
    // clang-format on

public:
    explicit InputPanelIface(QObject *parent = nullptr);
    ~InputPanelIface();

    QStringList availableLanguageLayouts() const;
    void setAvailableLanguageLayouts(const QStringList &availableLanguageLayouts);

    QString languageLayout() const;
    void setLanguageLayout(const QString &languageLayout);

signals:
    void availableLanguageLayoutsChanged();
    void languageLayoutChanged();

private:
    struct InputPanelIfacePrivate;
    InputPanelIfacePrivate *pimpl;
};
