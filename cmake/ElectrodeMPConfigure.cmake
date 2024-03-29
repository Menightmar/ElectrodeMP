
# Modulo para la configuraci�n de elementos y propiedades de ElectrodeMP.

# ------------------------------------------------------------------------------

# ---------------------------  Configuraciones  --------------------------------

# Empezaremos por declarar algunos elementos configurables para la biblioteca que el usuario
# puede habilitar o desabilitar deacuerdo a lo que necesite.

# -------------  LOG  --------------

# Para poder realizar procesos de debugueo y mostrar los procesos efectuados por la aplicaci�n para
# fines de debug , tenemos el LOG propio del sistema que almacena los datos en un Log.txt , para esto
# se tiene la opci�n siguiente habilitada.

option (ELECTRODEMP_ENABLE_LOG "Habilita el LOG del programa en un archivo LOG.txt" ON)

# Para habilitar la salida del LOG por consola.
# Se utiliza la siguiente bandera de estado (por defecto est� desabilitada).

option (ELECTRODEMP_ENABLE_CONSOLE_LOG "Habilita la salida LOG por consola del programa" ON)

# Si la consola fue habilitada , entonces anexaremos lo siguiente.

if (ELECTRODEMP_ENABLE_CONSOLE_LOG)

	# Colocaremos la siguiente flag para el compilador de los ejecutables.
	
	set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mconsole")

else ()

	# Colocaremos la siguiente flag para el compilador de los ejecutables.
	
	set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mwindows")

endif ()

# --------------  Sample Type  ---------------

# Estableceremos ahora una lista de tipos de datos para elegir entre cual utilizar como tipo de muestra en el programa.

set (ELECTRODEMP_SAMPLE_TYPE "float" CACHE STRING "Tipo de dato de las Muestras de audio utilizadas")

# Colocaremos el resto de las opciones de est� forma :
#		float (32 bits)
#		signed char (8 bits)
#		unsigned char (8 bits)
#		short (16 bits)
#		int (32 bits)

set_property (CACHE ELECTRODEMP_SAMPLE_TYPE PROPERTY STRINGS
	"float"
	"signed char"
	"unsigned char"
	"short"
	"int"
)

# Mostraremos el mensaje con el tipo de muestra seleccionado.

message (STATUS "Seleccionado el tipo de Sample : ${ELECTRODEMP_SAMPLE_TYPE}")

# -------------  Media Player --------------

# Adicionalmente se puede compilar el programa Media Player hecho con wxWidgets para mostrar claramente
# el funcionamiento de ElectrodeMP en una aplicaci�n de reproducci�n basica.

option (ELECTRODEMP_BUILD_MEDIA_PLAYER "Compila el reproductor de Audio (Media Player) de ElectrodeMP" OFF)

# ------------------------------------------------------------------------------
