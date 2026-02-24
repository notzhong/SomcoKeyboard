#include "ThemeManager.h"
#include "KeyboardTheme.h"
#include <QDebug>

ThemeManager::ThemeManager(QObject* parent) : QObject(parent) {}

ThemeManager::~ThemeManager() { qDeleteAll(m_availableThemes); }

QQmlListProperty<KeyboardTheme> ThemeManager::availableThemes()
{
    return QQmlListProperty<KeyboardTheme>(
        this, this,
        [](QQmlListProperty<KeyboardTheme>* list, KeyboardTheme* theme)
        {
            auto self = static_cast<ThemeManager*>(list->data);
            self->addTheme(theme);
        },
        [](QQmlListProperty<KeyboardTheme>* list) -> qsizetype { return static_cast<ThemeManager*>(list->data)->m_availableThemes.count(); },
        [](QQmlListProperty<KeyboardTheme>* list, qsizetype index) -> KeyboardTheme*
        { return static_cast<ThemeManager*>(list->data)->m_availableThemes.at(index); },
        [](QQmlListProperty<KeyboardTheme>* list)
        {
            static_cast<ThemeManager*>(list->data)->m_availableThemes.clear();
            emit static_cast<ThemeManager*>(list->data)->availableThemesChanged();
        });
}

KeyboardTheme* ThemeManager::currentTheme() const { return m_currentTheme; }
void ThemeManager::setCurrentTheme(KeyboardTheme* theme)
{
    if (m_currentTheme != theme)
    {
        m_currentTheme = theme;
        emit currentThemeChanged();
    }
}

void ThemeManager::addTheme(KeyboardTheme* theme)
{
    if (!m_availableThemes.contains(theme))
    {
        m_availableThemes.append(theme);
        emit availableThemesChanged();
        qDebug() << "Added new theme:" << theme->themeName();
    }
}

void ThemeManager::setTheme(const QString& name)
{
    for (auto theme : std::as_const(m_availableThemes))
    {
        if (theme->themeName() == name)
        {
            setCurrentTheme(theme);
            qDebug() << "Keyboard theme changed to:" << name;
            return;
        }
    }
    qWarning() << "Theme not found:" << name;
}

QStringList ThemeManager::getAvailableThemeNames() const
{
    QStringList names;
    for (auto theme : m_availableThemes)
    {
        names << theme->themeName();
    }
    return names;
}
