LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): MY_STRATEGIES_STRUCTURE_FILE := $(STRATEGIES_STRUCTURE_FILE)
$(LOCAL_BUILT_MODULE): MY_AUDIO_POLICY_ENGINE_CONFIGURATION_FILE := $(AUDIO_POLICY_ENGINE_CONFIGURATION_FILE)
$(LOCAL_BUILT_MODULE): MY_PROVISION_TOOL := $(HOST_OUT)/bin/buildStrategiesStructureFile.py
$(LOCAL_BUILT_MODULE): $(LOCAL_REQUIRED_MODULES) $(LOCAL_ADDITIONAL_DEPENDENCIES) \
    buildStrategiesStructureFile.py \
    $(STRATEGIES_STRUCTURE_FILE) \
    $(AUDIO_POLICY_ENGINE_CONFIGURATION_FILE)

	"$(MY_PROVISION_TOOL)" \
		--audiopolicyengineconfigurationfile "$(MY_AUDIO_POLICY_ENGINE_CONFIGURATION_FILE)" \
		--productstrategiesstructurefile "$(MY_STRATEGIES_STRUCTURE_FILE)" \
		--outputfile "$(@)"

# Clear variables for further use
STRATEGIES_STRUCTURE_FILE :=
AUDIO_POLICY_ENGINE_CONFIGURATION_FILE :=
