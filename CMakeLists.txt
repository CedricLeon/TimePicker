# ┌──────────────────────────────────────────────────────────────────┐
# │                       CMAKE PROPERTIES                           │
# └──────────────────────────────────────────────────────────────────┘

cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(HourPicker LANGUAGES CXX)

# ┌──────────────────────────────────────────────────────────────────┐
# │                         QT5 CMAKE                                │
# └──────────────────────────────────────────────────────────────────┘

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ┌──────────────────────────────────────────────────────────────────┐
# │                    DEPENDENCIES : Qaterial                       │
# └──────────────────────────────────────────────────────────────────┘

include(FetchContent)

FetchContent_Declare(
  Qaterial
  GIT_REPOSITORY "https://github.com/OlivierLDff/Qaterial.git"
  GIT_TAG        master
  )
FetchContent_MakeAvailable(Qaterial)

# ┌──────────────────────────────────────────────────────────────────┐
# │                       SOURCES                                    │
# └──────────────────────────────────────────────────────────────────┘

qtquick_compiler_add_resources(TimePicker_QML_RES ${CMAKE_CURRENT_SOURCE_DIR}/qml/qml.qrc
  )

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/qml/qml.qrc
  ${CMAKE_CURRENT_BINARY_DIR}/qml.qrc.junk
  )

add_executable(TimePicker
  src/main.cpp
  ${TimePicker_QML_RES}
  )
set_target_properties(TimePicker PROPERTIES AUTORCC TRUE)
target_compile_features(TimePicker PUBLIC cxx_std_11)
target_link_libraries(TimePicker PRIVATE
  Qt5::Core
  Qt5::Quick
  Qaterial
  )
