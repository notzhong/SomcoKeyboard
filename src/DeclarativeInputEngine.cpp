#include "DeclarativeInputEngine.h"

#include <QDebug>
#include <QGuiApplication>
#include <QInputMethodEvent>
#include <QMetaEnum>
#include <QTimer>

#include "DeclarativeInputEngine.h"

/**
 * Private data class
 */
struct DeclarativeInputEnginePrivate
{
    explicit DeclarativeInputEnginePrivate(DeclarativeInputEngine* _public);

    struct LayoutData
    {
        QString layoutFile;
        QString description;
        QString spaceIdentifier;
    };

    DeclarativeInputEngine* _this;
    bool Animating;
    QTimer* AnimatingFinishedTimer{nullptr};
    int InputMode;
    QRect KeyboardRectangle;

    QStringList availableLanguageLayouts;
    QString languageLayout;

    bool isUppercase{false};
    bool symbolMode{false};
    const QHash<DeclarativeInputEngine::InputLayouts, LayoutData> layoutFiles = {
        // Czech
        {DeclarativeInputEngine::Cs, {"CsLayout", "Čeština"}},

        // Bosnian (Cyrillic), Serbian (Cyrillic)
        {DeclarativeInputEngine::CyBs, {"CySrBsLayout", "Босански"}},
        {DeclarativeInputEngine::CySr, {"CySrBsLayout", "Српски"}},

        // Danish
        {DeclarativeInputEngine::Da, {"DaLayout", "Dansk"}},

        // German
        {DeclarativeInputEngine::De, {"DeLayout", "Deutsch", "Leerzeichen"}},

        // Greek
        {DeclarativeInputEngine::El, {"ElLayout", "Ελληνικός"}},

        // English
        {DeclarativeInputEngine::En, {"EnLayout", "English", "Space"}},

        // Spanish
        {DeclarativeInputEngine::Es, {"EsLayout", "Español"}},

        // Finnish
        {DeclarativeInputEngine::Fi, {"FiLayout", "Suomi"}},

        // French
        {DeclarativeInputEngine::Fr, {"FrLayout", "Français", "Espace"}},

        // Italian
        {DeclarativeInputEngine::It, {"ItLayout", "Italiano"}},

        // Bosnian (Latin), Croatian, Serbian (Latin)
        {DeclarativeInputEngine::LtBs, {"LtSrHrBsLayout", "Bosanski"}},
        {DeclarativeInputEngine::Hr, {"LtSrHrBsLayout", "Hrvatski"}},
        {DeclarativeInputEngine::LtSr, {"LtSrHrBsLayout", "Srpski"}},

        // Dutch
        {DeclarativeInputEngine::Nl, {"NlLayout", "Nederlands"}},

        // Polish
        {DeclarativeInputEngine::Pl, {"PlLayout", "Polski"}},

        // Portuguese
        {DeclarativeInputEngine::Pt, {"PtLayout", "Português"}},

        // Russian
        {DeclarativeInputEngine::Ru, {"RuLayout", "Русский", "Пробел"}},

        // Swedish
        {DeclarativeInputEngine::Sv, {"SvLayout", "Svenska"}},

        // Ukrainian
        {DeclarativeInputEngine::Uk, {"UkLayout", "Українська", "Пробіл"}},
    };
};

DeclarativeInputEnginePrivate::DeclarativeInputEnginePrivate(DeclarativeInputEngine* _public)
    : _this(_public), Animating(false), InputMode(DeclarativeInputEngine::Letters)
{

    QMetaEnum metaEnum = QMetaEnum::fromType<DeclarativeInputEngine::InputLayouts>();
    for (int i = 0; i < metaEnum.keyCount(); ++i)
    {
        int value = metaEnum.value(i);
        if (!layoutFiles.contains(static_cast<DeclarativeInputEngine::InputLayouts>(value)))
        {
            qCritical() << "ERROR: Missing layout for" << metaEnum.key(i);
            Q_ASSERT_X(false, "DeclarativeInputEngine", "Missing layout");
        }
    }
}

DeclarativeInputEngine::DeclarativeInputEngine(QObject* parent) : QObject(parent), d(new DeclarativeInputEnginePrivate(this))
{
    d->AnimatingFinishedTimer = new QTimer(this);
    d->AnimatingFinishedTimer->setSingleShot(true);
    d->AnimatingFinishedTimer->setInterval(100);
    connect(d->AnimatingFinishedTimer, &QTimer::timeout, this, &DeclarativeInputEngine::animatingFinished);
}

DeclarativeInputEngine::~DeclarativeInputEngine() { delete d; }

bool DeclarativeInputEngine::virtualKeyClick(Qt::Key key, const QString& text, Qt::KeyboardModifiers modifiers)
{
    QKeyEvent pressEvent(QEvent::KeyPress, key, Qt::KeyboardModifiers(modifiers), text);
    QKeyEvent releaseEvent(QEvent::KeyRelease, key, Qt::KeyboardModifiers(modifiers), text);

    return QCoreApplication::sendEvent(QGuiApplication::focusObject(), &pressEvent) &&
           QCoreApplication::sendEvent(QGuiApplication::focusObject(), &releaseEvent);
}

QRect DeclarativeInputEngine::keyboardRectangle() const { return d->KeyboardRectangle; }

void DeclarativeInputEngine::setKeyboardRectangle(const QRect& Rect)
{
    setAnimating(true);
    d->AnimatingFinishedTimer->start();
    d->KeyboardRectangle = Rect;
    emit keyboardRectangleChanged();
}

bool DeclarativeInputEngine::isAnimating() const { return d->Animating; }

void DeclarativeInputEngine::setAnimating(bool Animating)
{
    if (d->Animating != Animating)
    {
        d->Animating = Animating;
        emit animatingChanged();
    }
}

void DeclarativeInputEngine::animatingFinished() { setAnimating(false); }

int DeclarativeInputEngine::inputMode() const { return d->InputMode; }

void DeclarativeInputEngine::setInputMode(int Mode)
{
    if (Mode != d->InputMode)
    {
        d->InputMode = Mode;
        emit inputModeChanged();
    }
}

bool DeclarativeInputEngine::isUppercase() const { return d->isUppercase; }

void DeclarativeInputEngine::setUppercase(bool uppercase)
{
    if (d->isUppercase != uppercase)
    {
        d->isUppercase = uppercase;
        emit isUppercaseChanged();
    }
}

bool DeclarativeInputEngine::isSymbolMode() const { return d->symbolMode; }

void DeclarativeInputEngine::setSymbolMode(bool symbolMode)
{
    if (d->symbolMode != symbolMode)
    {
        d->symbolMode = symbolMode;
        emit isSymbolModeChanged();
    }
}

QStringList DeclarativeInputEngine::availableLanguageLayouts() const { return d->availableLanguageLayouts; }

void DeclarativeInputEngine::setAvailableLanguageLayouts(const QStringList& availableLanguageLayouts)
{
    if (d->availableLanguageLayouts != availableLanguageLayouts)
    {
        d->availableLanguageLayouts = availableLanguageLayouts;
        emit availableLanguageLayoutsChanged();
    }
}

QString DeclarativeInputEngine::languageLayout() const { return d->languageLayout; }

void DeclarativeInputEngine::setLanguageLayout(const QString& languageLayout)
{
    if (d->languageLayout != languageLayout)
    {
        d->languageLayout = languageLayout;
        emit languageLayoutChanged();
    }
}

void DeclarativeInputEngine::cycleLanguageLayout()
{
    if (d->availableLanguageLayouts.isEmpty())
        return;

    int indx = d->availableLanguageLayouts.indexOf(d->languageLayout);
    QString nextLayout;

    if (indx != -1)
    {
        int nextIndx = (indx + 1) % d->availableLanguageLayouts.size();
        nextLayout = d->availableLanguageLayouts.at(nextIndx);
    }
    else
    {
        nextLayout = d->availableLanguageLayouts.first();
    }

    if (inputLayoutValid(nextLayout))
        setLanguageLayout(nextLayout);
}

bool DeclarativeInputEngine::inputLayoutValid(const QString& layout) const
{
    QMetaEnum metaEnum = QMetaEnum::fromType<InputLayouts>();
    for (int i = 0; i < metaEnum.keyCount(); ++i)
    {
        if (layout == QLatin1String(metaEnum.key(i)))
        {
            return true;
        }
    }

    qCritical() << "Keyboard layout" << layout << "is not supported.";
    return false;
}

QString DeclarativeInputEngine::fileOfLayout(QString layout)
{
    if (!inputLayoutValid(layout))
    {
        return QString();
    }
    bool ok = false;
    auto layoutVal = static_cast<InputLayouts>(QMetaEnum::fromType<InputLayouts>().keyToValue(layout.toUtf8().data(), &ok));
    if (!ok)
    {
        return QString();
    }
    return d->layoutFiles.value(layoutVal).layoutFile;
}

QString DeclarativeInputEngine::descriptionOfLayout(QString layout)
{
    if (!inputLayoutValid(layout))
    {
        return QString();
    }
    bool ok = false;
    auto layoutVal = static_cast<InputLayouts>(QMetaEnum::fromType<InputLayouts>().keyToValue(layout.toUtf8().data(), &ok));
    if (!ok)
    {
        return QString();
    }
    return d->layoutFiles.value(layoutVal).description;
}

QString DeclarativeInputEngine::spaceIdentifierOfLayout(QString layout)
{
    if (!inputLayoutValid(layout))
    {
        return QString();
    }
    bool ok = false;
    auto layoutVal = static_cast<InputLayouts>(QMetaEnum::fromType<InputLayouts>().keyToValue(layout.toUtf8().data(), &ok));
    if (!ok)
    {
        return QString();
    }
    return d->layoutFiles.value(layoutVal).spaceIdentifier;
}
