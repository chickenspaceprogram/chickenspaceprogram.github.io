
BUILD_DIR := build
SRC_DIR := src
HMACRO := hmacro
TEMPLATE := $(SRC_DIR)/template.html

MD_FILES := blog.md index.md contact.md
RESOURCES := styles.css trans_flag.svg

HMACRO_TARGETS := $(MD_FILES:%.md=$(BUILD_DIR)/%.html)
RESOURCE_TARGETS := $(RESOURCES:%=$(BUILD_DIR)/%)

.PHONY: clean all
all: $(HMACRO_TARGETS) $(RESOURCE_TARGETS)

clean:
	rm -rf $(BUILD_DIR)

$(HMACRO_TARGETS): $(BUILD_DIR)/%.html: $(SRC_DIR)/%.md $(BUILD_DIR)
	./templatecomp.sh $(TEMPLATE) $< $@

$(RESOURCE_TARGETS): $(BUILD_DIR)/%: $(SRC_DIR)/% $(BUILD_DIR)
	cp $< $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
