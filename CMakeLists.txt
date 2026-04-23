cmake_minimum_required(VERSION 3.16)
project(SomcoKeyboard VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

find_package(Qt6 COMPONENTS Core Gui Qml Quick REQUIRED)

message(STATUS "Qt found: ${Qt6_VERSION_MAJOR}.${Qt6_VERSION_MINOR}")

if(Qt6_VERSION_MAJOR GREATER_EQUAL 6 AND Qt6_VERSION_MINOR GREATER_EQUAL 10)
  set(QT_NO_PRIVATE_MODULE_WARNING ON)
  find_package(Qt6 REQUIRED COMPONENTS GuiPrivate QuickPrivate)
endif()

if(QT_KNOWN_POLICY_QTP0001)
  qt_policy(SET QTP0001 NEW)
endif()

if(QT_KNOWN_POLICY_QTP0004)
  qt_policy(SET QTP0004 NEW)
endif()

qt_standard_project_setup()

option(BUILD_SOMCO_KEYBOARD_EXAMPLE "Build Somco Keyboard example" ON)
option(INSTALL_AS_QT_PLUGIN "Install as Qt platform plugin addon to Qt installation" OFF)
set(INSTALL_PLUGINSDIR "" CACHE PATH "Custom installation directory for plugins (optional)")

if(BUILD_SOMCO_KEYBOARD_EXAMPLE)
  add_subdirectory(example)
endif()

add_subdirectory(src)
