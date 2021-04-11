
# Archivo de Cmake para la generaci�n del proyecto ElectrodeMP.

# ------------------------------------------------------------------------------

# Usaremos la siguiente versi�n de CMake como minimo.

cmake_minimum_required (VERSION 3.2.3)

# Ahora daremos el nombre a nuestro proyecto actual.

project (ELECTRODEMP)

# ------------------------------------------------------------------------------

# ------------------------------  Modulos  -------------------------------------

# Incluiremos los modulos respectivos para la busqueda de elementos de bibliotecas y archivos de terceros que ocupa
# electrodemp para su compilaci�n y generaci�n.

# Anexaremos los siguientes directorios a la lista de modulos para CMake.

list (APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake" "${CMAKE_SOURCE_DIR}/cmake/Modules")

# ---------------  ElectrodeMP  ---------------

# Anexaremos nuestro modulo para la busqueda de dependencias y configuraci�n de la misma.

include (ElectrodeMPDependences)

# Anexaremos el modulo para comprobaci�n de elementos.

include (ElectrodeMPChecker)

# Anexaremos el modulo para la configuraci�n de opciones para ElectrodeMP.

include (ElectrodeMPConfigure)

# ------------------------------------------------------------------------------

# ------------------------  Cabeceras y Dependencias  --------------------------

# Tendremos una lista de cabeceras a incluir en nuestra biblioteca y ejecutable del reproductor , las cuales contendran
# todas las direcciones para utilizar asi como dependencias de bibliotecas de terceros que requiere la aplicaci�n.

ElectrodeMPDependences ()

# ------------------------------------------------------------------------------

# -----------------------------  Biblioteca  -----------------------------------

# Comenzaremos anexando el sub-diretorio donde se compilan todas las fuentes de la biblioteca
# y por tanto la generaci�n del archivo .a o .dll de acuerdo a la siguiente opci�n.

option (ELECTRODEMP_BUILD_SHARED_LIBS "Compila la biblioteca de forma dinamica (*.dll)" OFF)

# Colocaremos la opci�n en la variable siguiente.
# option (BUILD_SHARED_LIBS "Compila la biblioteca de forma dinamica (*.dll)" OFF)

set (BUILD_SHARED_LIBS "${ELECTRODEMP_BUILD_SHARED_LIBS}")

# Anexaremos el subdirectorio para la generaci�n de la biblioteca con la salida en el mismo directorio bin que est�.

add_subdirectory ("${CMAKE_SOURCE_DIR}/sources" "${CMAKE_BINARY_DIR}/library")

# ------------------------------------------------------------------------------

# ----------------------------  Media Player  ----------------------------------

# Validamos la opci�n elegida para poder determinar si compilar el programa.

if (ELECTRODEMP_BUILD_MEDIA_PLAYER)

	# Incluiremos el subdirectorio para la compilaci�n del reproductor de audio.
	
	add_subdirectory ("${CMAKE_SOURCE_DIR}/player" "${CMAKE_BINARY_DIR}/player")

endif ()

# ------------------------------------------------------------------------------

# Guardaremos el estado de configurado actual.

set (CONFIGURADO TRUE CACHE INTERNAL "Flag de Configuraci�n")