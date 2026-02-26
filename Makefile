
BUILD_DIR := build
PREPROC_DIR := preproc
OUT_DIR := out
SRC_DIR := src
HMACRO := hmacro
TEMPLATE := template.html

MD_FILES := index.md contact.md links.md 404.md
MD_FILES += $(shell cd src && find blogposts -type f)
RESOURCES := styles.css trans_flag.svg heptagram.svg

MD_TARGETS := $(MD_FILES:%.md=$(BUILD_DIR)/$(PREPROC_DIR)/%.html)
RESOURCE_TARGETS := $(RESOURCES:%=$(BUILD_DIR)/$(OUT_DIR)/%)

TEMPLATE_MD_TARGETS := $(MD_FILES:%.md=$(BUILD_DIR)/$(OUT_DIR)/%.html)


.PHONY: clean all
all: $(TEMPLATE_MD_TARGETS) $(RESOURCE_TARGETS)

run: all
	sh -c 'cd $(BUILD_DIR)/$(OUT_DIR) && python3 -m http.server'

clean:
	rm -rf $(BUILD_DIR)

$(MD_TARGETS): $(BUILD_DIR)/$(PREPROC_DIR)/%.html: $(SRC_DIR)/%.md $(BUILD_DIR)/$(PREPROC_DIR)
	$(HMACRO) $< | pandoc --from=markdown --to=html -o $@

$(RESOURCE_TARGETS): $(BUILD_DIR)/$(OUT_DIR)/%: $(SRC_DIR)/% $(BUILD_DIR)/$(OUT_DIR)
	cp $< $@

$(TEMPLATE_MD_TARGETS): $(BUILD_DIR)/$(OUT_DIR)/%.html: $(BUILD_DIR)/$(PREPROC_DIR)/%.html $(SRC_DIR)/%.md $(BUILD_DIR)/$(OUT_DIR) $(TEMPLATE)
	$(HMACRO) -Dfilename=$< -Dfilename_defs=$(word 2,$^) $(TEMPLATE) > $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/$(OUT_DIR):
	mkdir -p $(BUILD_DIR)/$(OUT_DIR)/blogposts

$(BUILD_DIR)/$(PREPROC_DIR):
	mkdir -p $(BUILD_DIR)/$(PREPROC_DIR)/blogposts

