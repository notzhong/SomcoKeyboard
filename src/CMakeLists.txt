
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
  OUTPUT_DIRECTORY "QtQuick/SomcoKeyboard"
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
  LIBRARY_OUTPUT_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/platforminputcontexts
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/platforminputcontexts
  ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}
)

set(INSTALL_PLUGINSDIR "" CACHE PATH "Installation directory for plugins")
if (NOT INSTALL_PLUGINSDIR)
  if(${PROJECT_NAME} STREQUAL ${CMAKE_PROJECT_NAME})
    set(INSTALL_PLUGINSDIR ${Qt6_DIR}/../../../plugins)
    set_target_properties( ${PROJECT_NAME} PROPERTIES
      LIBRARY_OUTPUT_DIRECTORY "${INSTALL_PLUGINSDIR}/platforminputcontexts")
  else()
    set(INSTALL_PLUGINSDIR ${CMAKE_INSTALL_BINDIR})
    set_target_properties(${PROJECT_NAME} PROPERTIES
      LIBRARY_OUTPUT_DIRECTORY "$<TARGET_FILE_DIR:${CMAKE_PROJECT_NAME}>/platforminputcontexts")
  endif()
endif()


target_link_libraries(${PROJECT_NAME} PRIVATE
  Qt::Core
  Qt::Gui
  Qt::GuiPrivate
  Qt::Quick
  Qt::Qml
  Qt::QuickPrivate
)
