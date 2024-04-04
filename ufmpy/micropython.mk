UFMPY_DIR := $(TOP)/micropython-fmu/ufmpy
FMU_DIR := $(TOP)/fmu

FMU_NAMES := $(shell find $(FMU_DIR) -name *.fmu -printf "%f ")
FMU_FILES := $(addprefix $(FMU_DIR)/,$(FMU_NAMES))
FMU_FOLDER := $(FMU_FILES:%.fmu=%)

unzip: $(FMU_FOLDER)

$(FMU_FOLDER): %: %.fmu
	mkdir -p $@
	unzip -nq $< -d $@

all: $(FMU_FOLDER)
	SRC_THIRDPARTY_C += $(foreach folder,$(FMU_FOLDER),$(shell xmllint --xpath "//File/@name" $(folder)/modelDescription.xml | grep -v ">" | cut -f 2 -d "=" | tr -d \" | sed "s|^|$(folder)/|" ))


CFLAGS_USERMOD += -I$(UFMPY_DIR)
UFMPY_MOD_DIR := $(USERMOD_DIR)