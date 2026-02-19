[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# SomcoKeyboard

SomcoKeyboard is a Qt virtual keyboard plugin for embedded applications.

## Installation

Download the repository, build and install the plugin.

```bash
mkdir build && cd build
qmake ..
make -j4
make install
```

### Custom Installation

```bash
mkdir build && cd build
qmake .. INSTALL_PREFIX=/home/custom_dir/custom_root
make -j4
make install
```

## Examples

```bash
mkdir build && cd build
qmake ..
make -j4
make install
```

## Usage

In the `main.cpp` add the `cutekeyboard` plugin.

```c++
qputenv("QT_IM_MODULE", QByteArray("cutekeyboard"));
```

In the `main.qml` insert the keyboard component

```javascript
import QtQuick.SKeyboard 1.0

ApplicationWindow {
        id: window

        ...

        InputPanel {
            id: inputPanel

            z: 99
            y: Qt.inputMethod.visible ? (window.height - inputPanel.height) : window.height
            width: parent.width

            Behavior on y {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
```


## About Somco Software
[Somco Software - Experts at Embedded GUI and Medical Devices](https://somcosoftware.com/en/) (previously Scythe Studio) is an embedded and cross-platform software development company with a strong focus on Qt and C++, delivering reliable, high-quality solutions for regulated industries, with particular expertise in medical devices. We are an ISO 9001 and ISO 13485 certified software house, specializing in GUI development, Linux-based systems, and advanced connectivity solutions. Somco Software is an official Qt Service Partner and a trusted partner of leading hardware manufacturers.

<table style="margin: 0 auto; border:0;">
    <tr style="border:0">
        <td style="border:0">
            <a href="https://somcosoftware.com/">
                <img src="./assets/Qt-service-partner-badge.png">
            </a>
        </td>
        <td style="border:0">
            <a href="https://clutch.co/profile/somco-software">
                <img height="150" width="150"
                    src="https://github.com/user-attachments/assets/023e102e-84c1-4e7e-b9de-cae476e681e7">
            </a>
        </td>
        <td style="border:0">
            <a href="https://somcosoftware.com/en/iso">
                <img src="./assets/iso 13485.png" style="background: #031813;">
            </a>
        </td>
        <td style="border:0">
            <a href="https://somcosoftware.com/en/iso">
                <img src="./assets/iso 9001.png" style="background: #031813;">
            </a>
        </td>
    </tr>
</table>

We support projects from design to delivery, offering UX/UI design, custom Yocto Linux images, and development in Qt as well as LVGL and TouchGFX. We also help with software modernization, training, and technical consulting. With a practical, developer-focused approach, we build efficient, reliable solutions that fit real project needs.

## Professional Support
Need help with anything? We’ve got you covered. Our professional support services are here to assist you with. For more details about support options and pricing, just drop us a line at https://somcosoftware.com/en/contact.

## Follow us
Check out those links if you want to see Somco Software in action and follow the newest trends saying about Qt Qml development.

* 🌐 [Somco Software Website](https://somcosoftware.com/en/)
* ✍️ [Somco Software Blog Website](https://somcosoftware.com/en/blog)
* 👔 [Somco Software LinkedIn Profile](https://www.linkedin.com/company/somcosoftware)
* 🎥 [Somco Software Youtube Channel](https://www.youtube.com/channel/UCf4OHosddUYcfmLuGU9e-SQ/featured)


## Authors
 * **Uwe Kindler** - *Initial work* - [githubuser0xFFFF](https://github.com/githubuser0xFFFF)
 * **Andrea Ricchi** - *Maintainer* - [AndreaRicchi](https://github.com/AndreaRicchi)
