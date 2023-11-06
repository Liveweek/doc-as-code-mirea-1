ifeq ($(OS), Windows_NT)
	MK_BUILD = if not exist build mkdir build
	RM_BUILD = del /q build\*.*
else
	MK_BUILD = mkdir -p build
	RM_BUILD = rm -r build/
endif

all: build

build:
	$(MK_BUILD)
	pandoc --defaults=defaults.yaml -F pandoc-crossref -o build/text.docx text.md

clean:
	$(RM_BUILD)