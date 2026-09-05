#include "DeclarativeInputEngine.h"

#include <QDebug>
#include <QGuiApplication>
#include <QInputMethodEvent>
#include <QTimer>

#include "DeclarativeInputEngine.h"

/**
 * Private data class
 */
struct DeclarativeInputEnginePrivate
{
    explicit DeclarativeInputEnginePrivate(DeclarativeInputEngine* _public);

    DeclarativeInputEngine* _this;
    bool Animating;
    QTimer* AnimatingFinishedTimer{nullptr};
    DeclarativeInputEngine::InputMode InputMode;
    QRect KeyboardRectangle;

    DeclarativeInputEngine::ShiftState shiftState{DeclarativeInputEngine::ShiftState::ShiftOff};
    bool symbolMode{false};
    bool autoCapitalize{false};

};

DeclarativeInputEnginePrivate::DeclarativeInputEnginePrivate(DeclarativeInputEngine* _public)
    : _this(_public), Animating(false), InputMode(DeclarativeInputEngine::Letters)
{
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

DeclarativeInputEngine::InputMode DeclarativeInputEngine::inputMode() const { return d->InputMode; }

void DeclarativeInputEngine::setInputMode(DeclarativeInputEngine::InputMode mode)
{
    if (mode != d->InputMode)
    {
        d->InputMode = mode;
        emit inputModeChanged();
    }
}

bool DeclarativeInputEngine::isUppercase() const { return d->shiftState == ShiftState::ShiftOn || d->shiftState == ShiftState::CapsLock; }

DeclarativeInputEngine::ShiftState DeclarativeInputEngine::shiftState() const { return d->shiftState; }

void DeclarativeInputEngine::setShiftState(ShiftState state)
{
    if (state != d->shiftState)
    {
        d->shiftState = state;
        emit shiftStateChanged();
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

bool DeclarativeInputEngine::isAutoCapitalize() const { return d->autoCapitalize; }

void DeclarativeInputEngine::setAutoCapitalize(bool autoCapitalize)
{
    if (d->autoCapitalize != autoCapitalize)
    {
        d->autoCapitalize = autoCapitalize;
        emit isAutoCapitalizeChanged();
    }
}


