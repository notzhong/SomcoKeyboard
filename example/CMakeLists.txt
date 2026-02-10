cmake_minimum_required(VERSION 3.16)
project(SKeyboard_example VERSION 1.0 LANGUAGES CXX)

qt_add_executable(${PROJECT_NAME} WIN32 MACOSX_BUNDLE main.cpp)
target_compile_definitions(${PROJECT_NAME} PRIVATE QT_DEPRECATED_WARNINGS)

target_link_libraries(${PROJECT_NAME} PRIVATE
  Qt::Core
  Qt::Gui
  Qt::Quick
)

set(resource_files "main.qml" "icons/logo.svg")

qt6_add_resources(${PROJECT_NAME} "qml" PREFIX "/" FILES ${resource_files})

install(
  TARGETS ${PROJECT_NAME}
  BUNDLE DESTINATION .
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

qt6_generate_deploy_app_script(TARGET ${PROJECT_NAME} OUTPUT_SCRIPT deploy_script
                              NO_UNSUPPORTED_PLATFORM_ERROR)
install(SCRIPT ${deploy_script})
