# Install script for directory: C:/Users/vic/Documents/obs-dev/obs-studio/plugins/win-capture

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/obs-studio")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/obs-plugins/32bit" TYPE MODULE FILES "C:/Users/vic/Documents/obs-dev/obs-studio/build32/plugins/win-capture/Debug/win-capture.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/obs-plugins/32bit" TYPE MODULE FILES "C:/Users/vic/Documents/obs-dev/obs-studio/build32/plugins/win-capture/Release/win-capture.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/obs-plugins/32bit" TYPE MODULE FILES "C:/Users/vic/Documents/obs-dev/obs-studio/build32/plugins/win-capture/MinSizeRel/win-capture.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/obs-plugins/32bit" TYPE MODULE FILES "C:/Users/vic/Documents/obs-dev/obs-studio/build32/plugins/win-capture/RelWithDebInfo/win-capture.dll")
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg]|[Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/obs-plugins/32bit" TYPE DIRECTORY FILES "C:/Users/vic/Documents/obs-dev/obs-studio/build32/plugins/win-capture/pdbs/")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg]|[Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/data/obs-plugins/win-capture" TYPE DIRECTORY FILES "C:/Users/vic/Documents/obs-dev/obs-studio/plugins/win-capture/data/" USE_SOURCE_PERMISSIONS)
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/Users/vic/Documents/obs-dev/obs-studio/build32/plugins/win-capture/graphics-hook/cmake_install.cmake")
  include("C:/Users/vic/Documents/obs-dev/obs-studio/build32/plugins/win-capture/get-graphics-offsets/cmake_install.cmake")
  include("C:/Users/vic/Documents/obs-dev/obs-studio/build32/plugins/win-capture/inject-helper/cmake_install.cmake")

endif()

