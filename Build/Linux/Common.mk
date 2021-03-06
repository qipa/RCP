CC = g++
OPTIMIZE = -O3 -DNDEBUG
DEBUG_CFLAGS = -g -O0 -D_DEBUG
ADDL_LINKFLAGS =
LINKFLAGS_EXE = $(ADDL_LINKFLAGS)
LINKFLAGS_SO = -shared -Wl,-z,defs $(ADDL_LINKFLAGS)
PLATFORM_CFLAG =
PLATFORM_LFLAG =
TARGET_SUFFIX =
ADDL_CFLAGS =
CFLAGS = $(OPTIMIZE) -std=c++11 -fPIC -Wall -Wno-unknown-pragmas -Wno-strict-aliasing -Wno-non-virtual-dtor -Wno-conversion-null -Wno-ignored-attributes -Werror -msse $(PLATFORM_CFLAG) $(ADDL_CFLAGS)
HSAFDN_CFLAGS =
PLATFORM_DIR = x64
HSA_PLATFORM_DIR = x86_64
AMD_LIB_SUFFIX =
HSA_PLATFORM_SUFFIX = 64
HSA_PLATFORM_SUFFIX_COMPILER_LIB = 64
MAKEFILENAME=makefile
FRAMEWORK_OUTPUT_BASE_DIR=Output_x86_64
DEBUG_RELEASE=release
INTERNAL_PUBLIC =
# Build defines
BASE_DEFINES = -D_LINUX -DUSE_POINTER_SINGLETON
ADDL_DEFINES =
ADDITIONAL_COMPILER_DEFINES_FROM_BUILD_SCRIPT =
BUILD_DEFINES = -DAMDT_PUBLIC -DAMDT_BUILD_SUFFIX=\"\"
PLATFORM_DEFINES = -DAMDT_PLATFORM_SUFFIX=\"\"
DEBUG_DEFINES = -DAMDT_DEBUG_SUFFIX=\"\"
DEFINES = $(BASE_DEFINES) $(BUILD_DEFINES) $(PLATFORM_DEFINES) $(DEBUG_DEFINES) $(ADDL_DEFINES) $(ADDITIONAL_COMPILER_DEFINES_FROM_BUILD_SCRIPT)

# Directory definitions
SRC_DIR = $(DEPTH)/Src
OUTPUT_DIR = $(DEPTH)/Output
OUTPUT_BIN_DIR = $(OUTPUT_DIR)/bin
OUTPUT_LIB_DIR = $(OUTPUT_DIR)/lib
OUTPUT_OBJ_DIR = $(OUTPUT_DIR)/obj
OBJ_DIR = $(OUTPUT_OBJ_DIR)/$(DEBUG_RELEASE)$(INTERNAL_PUBLIC)/$(PLATFORM_DIR)/$(PROJECT_NAME)
OUTPUT_DIRS_TO_CREATE = $(OBJ_DIR) $(OUTPUT_BIN_DIR) $(OUTPUT_LIB_DIR)

SRC_COMMON_DIR = $(SRC_DIR)/Common
SRC_DEVICEINFO_DIR = $(SRC_DIR)/DeviceInfo
SRC_CLCOMMON_DIR = $(SRC_DIR)/CLCommon
SRC_CLPROFILEAGENT_DIR = $(SRC_DIR)/CLProfileAgent
SRC_CLTRACEAGENT_DIR = $(SRC_DIR)/CLTraceAgent
SRC_CLOCCUPANCYAGENT_DIR = $(SRC_DIR)/CLOccupancyAgent
SRC_SPROFILE_DIR = $(SRC_DIR)/sprofile
SRC_SANALYZE_DIR = $(SRC_DIR)/sanalyze
SRC_HSAFDNCOMMON_DIR = $(SRC_DIR)/HSAFdnCommon
SRC_HSAFDNTRACE_DIR = $(SRC_DIR)/HSAFdnTrace
SRC_HSAUTILS_DIR = $(SRC_DIR)/HSAUtils
SRC_PROFILEDATAPARSER_DIR= $(SRC_DIR)/ProfileDataParser

FRAMEWORK_OUTPUT_DIR = $(DEPTH)/Output/$(FRAMEWORK_OUTPUT_BASE_DIR)/$(DEBUG_RELEASE)/bin

COMMON_DIR = $(DEPTH)/../Common
COMMON_SRC = $(COMMON_DIR)/Src
COMMON_LIB = $(COMMON_DIR)/Lib
COMMON_LIB_AMD = $(COMMON_DIR)/Lib/AMD
COMMON_LIB_EXT = $(COMMON_DIR)/Lib/Ext
GPU_PERF_API_DIR = $(COMMON_LIB_AMD)/GPUPerfAPI/2_23/Include
ATI_STREAM_SDK_DIR = $(COMMON_LIB_AMD)/APPSDK/3-0
APPSDK_DIR = $(ATI_STREAM_SDK_DIR)
CAL_DIR = $(COMMON_LIB_AMD)/CAL/8.95
ACL_DIR = $(COMMON_LIB_AMD)/ACL/TOT
HSA_DIR = /opt/rocm/hsa
HSA_LIB_DIR = $(HSA_DIR)/lib/
BOOST_DIR = $(COMMON_LIB_EXT)/Boost/boost_1_59_0
BOOST_LIB_DIR = /usr/lib/x86_64-linux-gnu
BOOST_LIB_DIR32 = /usr/lib/i386-linux-gnu
BOOST_DEFINES = "-DBOOST_ALL_NO_LIB -DBOOST_NO_CXX11_NUMERIC_LIMITS"
DEVICEINFO_DIR = $(COMMON_SRC)/DeviceInfo
DEVICEINFO_INTERNAL_DIR = $(COMMON_SRC)/DeviceInfo-Internal
DYNAMICLIBRARYMODULE_DIR = $(COMMON_SRC)/DynamicLibraryModule
GPUPERFAPIUTILS_DIR = $(COMMON_SRC)/GPUPerfAPIUtils
TSINGLETON_DIR = $(COMMON_SRC)/TSingleton
ACLMODULEMANAGER_DIR = $(COMMON_SRC)/ACLModuleManager
UTF8CPP_DIR = $(COMMON_LIB_EXT)/utf8cpp/source
ADL_DIR = $(COMMON_LIB_AMD)/ADL
ADLUTIL_DIR = $(COMMON_SRC)/ADLUtil
COMMON_PROJ_DIR = $(COMMON_DIR)/Src
CELF_DIR = $(COMMON_SRC)/CElf
HSAUTILS_DIR = $(COMMON_SRC)/HSAUtils

GPU_PROFILER_LIB_PREFIX=RCP

# Lib paths
COMMON_LIB_PATHS = -L$(FRAMEWORK_OUTPUT_DIR) -L$(OUTPUT_LIB_DIR)
AMD_LIB_PATH = Bin/Linx64/
COMMON_DEVICE_INFO_LIB = -Wl,--whole-archive -l$(GPU_PROFILER_LIB_PREFIX)DeviceInfo$(TARGET_SUFFIX) -Wl,--no-whole-archive
COMMON_LIBS = -l$(GPU_PROFILER_LIB_PREFIX)Common$(TARGET_SUFFIX) $(COMMON_DEVICE_INFO_LIB)
CLCOMMON_LIBS = -l$(GPU_PROFILER_LIB_PREFIX)CLCommon$(TARGET_SUFFIX)
HSAFDNCOMMON_LIBS = -l$(GPU_PROFILER_LIB_PREFIX)HSACommon$(TARGET_SUFFIX)
HSAUTILS_LIBS = -l$(GPU_PROFILER_LIB_PREFIX)HSAUtils$(TARGET_SUFFIX)
FRAMEWORK_LIBS = -lCXLOSWrappers -lCXLBaseTools
STANDARD_LIBS = -lrt -ldl -lpthread
HSA_LIBS = -L$(HSA_LIB_DIR) -lhsaild -l:libhsa-runtime$(HSA_PLATFORM_SUFFIX).so.1 -l:libhsa-runtime-tools$(HSA_PLATFORM_SUFFIX).so.1

# Build target overrides
EXTRA_X86_OVERRIDES=
X86_OVERRIDES = "PLATFORM_CFLAG = -m32 -msse2" "PLATFORM_LFLAG = -m32" "PLATFORM_DEFINES = -DX86 -DAMDT_PLATFORM_SUFFIX=\\\"32\\\"" "FRAMEWORK_OUTPUT_BASE_DIR = Output_x86" "PLATFORM_DIR = x86" "HSA_PLATFORM_DIR = x86" "HSA_PLATFORM_SUFFIX =" "HSA_PLATFORM_SUFFIX_COMPILER_LIB = 32" "BOOST_LIB_DIR = $(BOOST_LIB_DIR32)"  $(EXTRA_X86_OVERRIDES)
INTERNAL_OVERRIDES = "BUILD_DEFINES = -DAMDT_INTERNAL -DAMDT_BUILD_SUFFIX=\\\"-Internal\\\"" "INTERNAL_PUBLIC = _Internal"
DEBUG_OVERRIDES = "OPTIMIZE = $(DEBUG_CFLAGS)" "DEBUG_RELEASE = debug" "DEBUG_DEFINES = -DAMDT_DEBUG_SUFFIX=\\\"-d\\\""

BUILD_X86_OVERRIDES = "TARGET_SUFFIX = 32" "AMD_LIB_PATH = Bin/Linx86/" "AMD_LIB_SUFFIX = 32" $(X86_OVERRIDES)
BUILD_INTERNAL_OVERRIDES = "TARGET_SUFFIX = -Internal" "AMD_LIB_PATH = Bin-Internal/Linx64/" "AMD_LIB_SUFFIX = -Internal" $(INTERNAL_OVERRIDES)
BUILD_INTERNAL_X86_OVERRIDES = "TARGET_SUFFIX = 32-Internal" "AMD_LIB_PATH = Bin-Internal/Linx86/" "AMD_LIB_SUFFIX = 32-Internal" $(X86_OVERRIDES) $(INTERNAL_OVERRIDES)
BUILD_DEBUG_OVERRIDES = "TARGET_SUFFIX = -d" $(DEBUG_OVERRIDES)
BUILD_DEBUG_X86_OVERRIDES = "TARGET_SUFFIX = 32-d" "AMD_LIB_PATH = Bin/Linx86/" "AMD_LIB_SUFFIX = 32" $(DEBUG_OVERRIDES) $(X86_OVERRIDES)
BUILD_DEBUG_INTERNAL_OVERRIDES = "TARGET_SUFFIX = -d-Internal" "AMD_LIB_PATH = Bin-Internal/Linx64/" "AMD_LIB_SUFFIX = -Internal" $(INTERNAL_OVERRIDES) $(DEBUG_OVERRIDES)
BUILD_DEBUG_INTERNAL_X86_OVERRIDES = "TARGET_SUFFIX = 32-d-Internal" "AMD_LIB_PATH = Bin-Internal/Linx86/" "AMD_LIB_SUFFIX = 32-Internal" $(X86_OVERRIDES) $(INTERNAL_OVERRIDES) $(DEBUG_OVERRIDES)

