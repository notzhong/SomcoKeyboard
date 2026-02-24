# SomcoKeyboard

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

![SomcoKeyboard](./assets/SomcoKeyboard.png)

SomcoKeyboard is a versatile, QML-based on-screen virtual keyboard designed specifically for embedded applications. It offers a seamless typing experience with customizable themes, multi-language support, and easy integration into Qt projects. Whether you're building touch-enabled interfaces for medical devices, industrial controls, or consumer electronics, SomcoKeyboard provides a reliable and user-friendly input solution that's lightweight and performant.

---

[![Somco Software](./assets/somcosoftware-full-logo.svg)](https://somcosoftware.com)

[![Built with Qt](./assets/buildWithQt.png)](https://qt.io)

---

## Features
- **Customizable Themes**: Switch between light, dark, or your own custom themes dynamically for a tailored look and feel.
- **Multi-Language Support**: Easily add layouts for different languages to support global users.
- **Embedded-Friendly**: Optimized for resource-constrained environments with smooth animations and minimal overhead.
- **Qt Integration**: Seamless plugin for Qt Quick applications, with simple setup via CMake.
- **Open Source**: Licensed under MIT, perfect for submodules in your projects—fork, contribute, and customize!

## Installation

To integrate SomcoKeyboard into your project as a submodule:

1. Add it as a Git submodule:
   ```
   git submodule add git@gitlab.com:somcosoftware/somcokeyboard.git 3rdParty/SomcoKeyboard
   ```

2. Include it in your root `CMakeLists.txt`:
   ```cmake
   add_subdirectory(3rdParty/SomcoKeyboard)
   ```

3. Set the input method in your `main.cpp`:
   ```cpp
   int main(int argc, char** argv) {
       qputenv("QT_IM_MODULE", QByteArray("somcokeyboard"));
       // ... rest of your main function
   }
   ```

4. Import and use it in your `main.qml`:
   ```qml
   import QtQuick.SomcoKeyboard 1.0

   ApplicationWindow {
       id: window

       // ... your window properties

       InputPanel {
           id: inputPanel

           z: 99
           y: Qt.inputMethod.visible ? (window.height - inputPanel.height) : window.height
           width: parent.width

           Behavior on y {
               NumberAnimation {
                   duration: 300
                   easing.type: Easing.InOutQuad
               }
           }
       }
   }
   ```

## Multi-Theme Support

SomcoKeyboard supports dynamic theme switching, allowing you to adapt the keyboard's appearance to your app's style—perfect for day/night modes or branded interfaces.

### Light Theme
![Light Theme](./assets/light_en_layout.png)

### Dark Theme
![Dark Theme](./assets/dark_en_layout.png)

For an example of implementing multiple themes, see `./example/main.qml`:

```qml
InputPanel {
    id: inputPanel

    // ... other properties

    themeName: darkTheme.themeName
    themes: [
        KeyboardTheme {
            id: lightTheme
            themeName: "light"

            overlayBackgroundColor: "#D4E3EE"
            backgroundColor: "#C2D4EA"
            btnBackgroundColor: "#DEECFB"
            btnSpecialBackgroundColor: "#ADC3DB"
            btnEnterBackgroundColor: "#1DCA9B"
            btnTextColor: "#000000"
            btnTextFontFamily: "Inter"
            btnTextFontSize: 21

            backspaceIcon: "qrc:/icons/SomcoKeyboardApp/light/keyboard_backspace.svg"
            enterIcon: "qrc:/icons/SomcoKeyboardApp/light/keyboard_return.svg"
            shiftOnIcon: "qrc:/icons/SomcoKeyboardApp/light/caps-lock-on.svg"
            shiftOffIcon: "qrc:/icons/SomcoKeyboardApp/light/caps-lock-off.svg"
            hideKeyboardIcon: "qrc:/icons/SomcoKeyboardApp/light/keyboard_hide.svg"
            languageIcon: "qrc:/icons/SomcoKeyboardApp/light/language.svg"
            spaceIcon: "qrc:/icons/SomcoKeyboardApp/light/keyboard_space.svg"
        },

        KeyboardTheme {
            id: darkTheme
            themeName: "dark"

            overlayBackgroundColor: "#000000"
            backgroundColor: "#000000"
            btnBackgroundColor: "#2A3139"
            btnSpecialBackgroundColor: "#4B545E"
            btnEnterBackgroundColor: "#1DCA9B"
            btnTextColor: "#FFFFFF"
            btnTextFontFamily: "Inter"
            btnTextFontSize: 21

            backspaceIcon: "qrc:/icons/SomcoKeyboardApp/dark/keyboard_backspace.svg"
            enterIcon: "qrc:/icons/SomcoKeyboardApp/dark/keyboard_return.svg"
            shiftOnIcon: "qrc:/icons/SomcoKeyboardApp/dark/caps-lock-on.svg"
            shiftOffIcon: "qrc:/icons/SomcoKeyboardApp/dark/caps-lock-off.svg"
            hideKeyboardIcon: "qrc:/icons/SomcoKeyboardApp/dark/keyboard_hide.svg"
            languageIcon: "qrc:/icons/SomcoKeyboardApp/dark/language.svg"
            spaceIcon: "qrc:/icons/SomcoKeyboardApp/dark/keyboard_space.svg"
        }
    ]

    // ... rest of InputPanel
}
```

## Contributing
We welcome contributions to make SomcoKeyboard even better! Whether it's adding new layouts, fixing bugs, or improving documentation:
- Fork the repository.
- Create a feature branch (`git checkout -b feature/YourFeature`).
- Commit your changes (`git commit -m 'Add some feature'`).
- Push to the branch (`git push origin feature/YourFeature`).
- Open a Pull Request.

Please follow standard Qt coding conventions.

## About Somco Software (previously Scythe Studio)
[Somco Software (previously Scythe Studio)](https://somcosoftware.com/en/) is an embedded and cross-platform software development company with a strong focus on Qt and C++, delivering reliable, high-quality solutions for regulated industries, with particular expertise in medical devices. We are an ISO 9001 and ISO 13485 certified software house, specializing in GUI development, Linux-based systems, and advanced connectivity solutions. Somco Software is an official Qt Service Partner and a trusted partner of leading hardware manufacturers.

<table align="center" style="margin: 0 auto; border: none;">
    <tr style="border: none;">
        <td style="border: none;">
            <a href="https://somcosoftware.com/">
                <img src="./assets/Qt-service-partner-badge.png" alt="Qt Service Partner">
            </a>
        </td>
        <td style="border: none;">
            <a href="https://clutch.co/profile/somco-software">
                <img height="150" width="150" src="https://github.com/user-attachments/assets/023e102e-84c1-4e7e-b9de-cae476e681e7" alt="Clutch Profile">
            </a>
        </td>
        <td style="border: none;">
            <a href="https://somcosoftware.com/en/iso">
                <img src="./assets/iso 13485.png" alt="ISO 13485">
            </a>
        </td>
        <td style="border: none;">
            <a href="https://somcosoftware.com/en/iso">
                <img src="./assets/iso 9001.png" alt="ISO 9001">
            </a>
        </td>
    </tr>
</table>

We support projects from design to delivery, offering UX/UI design, custom Yocto Linux images, and development in Qt as well as LVGL and TouchGFX. We also help with software modernization, training, and technical consulting. With a practical, developer-focused approach, we build efficient, reliable solutions that fit real project needs.

## Professional Support
Need help with anything? We’ve got you covered. Our professional support services are here to assist you with. For more details about support options and pricing, just drop us a line at https://somcosoftware.com/en/contact.

## Follow Us
Stay updated on the latest in Qt and QML development:
- 🌐 [Somco Software Website](https://somcosoftware.com/en/)
- ✍️ [Somco Software Blog](https://somcosoftware.com/en/blog)
- 👔 [Somco Software LinkedIn](https://www.linkedin.com/company/somcosoftware)
- 🎥 [Somco Software YouTube](https://www.youtube.com/channel/UCf4OHosddUYcfmLuGU9e-SQ/featured)

## Authors
- **Uwe Kindler** - Initial work - [githubuser0xFFFF](https://github.com/githubuser0xFFFF)
- **Andrea Ricchi** - CuteKeyboard inspiration - [AndreaRicchi](https://github.com/AndreaRicchi) (from [amarula/cutekeyboard](https://github.com/amarula/cutekeyboard))
- **Oleksandr Movchan** - Somco Software contributions - [SomcoSoftware](https://github.com/somcosoftware)