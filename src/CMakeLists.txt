
file(GLOB_RECURSE HEADERS *.h *.hpp)
file(GLOB_RECURSE SOURCES *.cpp)
file(GLOB_RECURSE QML_FILES qml/*.qml)

foreach(_file ${QML_FILES})
  cmake_path(GET _file FILENAME _fileName)
  set_source_files_properties(${_file} PROPERTIES QT_RESOURCE_ALIAS ${_fileName})
endforeach()

qt_add_qml_module(
  ${PROJECT_NAME}
  URI "QtQuick.SomcoKeyboard"
  VERSION 1.0
  PLUGIN_TARGET ${PROJECT_NAME}
  RESOURCE_PREFIX "/"
  OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/QtQuick/SomcoKeyboard"
  CLASS_NAME "VirtualKeyboardInputContextPlugin"
  SOURCES
    ${HEADERS}
    ${SOURCES}
  QML_FILES
    ${QML_FILES}
  RESOURCES
    icons/icons.qrc
    somcokeyboard.json
  NO_GENERATE_PLUGIN_SOURCE
)

set_target_properties(${PROJECT_NAME} PROPERTIES
  OUTPUT_NAME somcokeyboard
  DEBUG_POSTFIX d 
)

set_target_properties(${PROJECT_NAME} PROPERTIES
  OUTPUT_NAME somcokeyboard
  DEBUG_POSTFIX d
)

if(INSTALL_PLUGINSDIR)
  message(STATUS "Installing to custom directory: ${INSTALL_PLUGINSDIR}/platforminputcontexts")
  set_target_properties(${PROJECT_NAME} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${INSTALL_PLUGINSDIR}/platforminputcontexts"
    RUNTIME_OUTPUT_DIRECTORY "${INSTALL_PLUGINSDIR}/platforminputcontexts"
  )
elseif(INSTALL_AS_QT_PLUGIN)
  message(STATUS "Installing as Qt plugin addon: ${Qt6_DIR}/../../../plugins/platforminputcontexts")
  set_target_properties(${PROJECT_NAME} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${Qt6_DIR}/../../../plugins/platforminputcontexts"
    RUNTIME_OUTPUT_DIRECTORY "${Qt6_DIR}/../../../plugins/platforminputcontexts"
  )
else()
  message(STATUS "Installing next to executable: ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/platforminputcontexts")
  set_target_properties(${PROJECT_NAME} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/platforminputcontexts"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/platforminputcontexts"
  )
endif()

target_link_libraries(${PROJECT_NAME} PRIVATE
  Qt::Core
  Qt::Gui
  Qt::GuiPrivate
  Qt::Quick
  Qt::Qml
  Qt::QuickPrivate
)
