#MAKE FILE FOR CLTraceAgent
PROJECT_NAME=CLTraceAgent
DEPTH = ../..
include $(DEPTH)/Build/Linux/Common.mk

TARGETSO = $(OUTPUT_BIN_DIR)/lib$(GPU_PROFILER_LIB_PREFIX)$(PROJECT_NAME)$(TARGET_SUFFIX).so

ADDL_DEFINES = -DNON_BLOCKING_TIMEOUT

INCLUDES = \
	-I. \
	-I$(SRC_CLPROFILEAGENT_DIR) \
	-I$(SRC_COMMON_DIR) \
	-I$(SRC_CLCOMMON_DIR) \
	-I$(COMMON_PROJ_DIR) \
	-isystem$(ATI_STREAM_SDK_DIR)/include \
	-isystem$(CAL_DIR)/include \
	-I$(DYNAMICLIBRARYMODULE_DIR) \
	-I$(DEVICEINFO_DIR) \
	-I$(TSINGLETON_DIR) \
	-I$(UTF8CPP_DIR)

LIBS = \
	$(CLCOMMON_LIBS) \
	$(COMMON_LIBS) \
	$(FRAMEWORK_LIBS) \
	$(STANDARD_LIBS)

LIBPATH = $(COMMON_LIB_PATHS)

SO_OBJS =  \
	./$(OBJ_DIR)/CLAPIDefBase.o \
	./$(OBJ_DIR)/CLAPIDefs.o \
	./$(OBJ_DIR)/AtpFile.o \
	./$(OBJ_DIR)/CLAtpFile.o \
	./$(OBJ_DIR)/CLAPIInfoManager.o \
	./$(OBJ_DIR)/PMCSamplerManager.o \
	./$(OBJ_DIR)/CLAPITraceEntry.o \
	./$(OBJ_DIR)/CLEventHandler.o \
	./$(OBJ_DIR)/CLEventManager.o \
	./$(OBJ_DIR)/CLStringUtils.o \
	./$(OBJ_DIR)/CLTraceAgent.o \
	./$(OBJ_DIR)/CLEnqueueAPIDefs.o

include $(DEPTH)/Build/Linux/CommonTargets.mk

# END OF MAKE FILE
