DOC			:= docker
DOCC		:= $(DOC) compose

TARGET		?= edge
TARGET_PATH ?= .

DOCB		:= $(DOC) buildx build $(TARGET_PATH) \
				--build-arg TAG=$(TARGET) \
				--tag postgresql:$(TARGET)
DOCR		:= $(DOC) run --detach --rm postgresql:$(TARGET)

DOCCU		:= $(DOCC) up --build -d --wait
DOCCD		:= $(DOCC) down --remove-orphans --volumes

.DEFAULT:	build

build:
	$(DOCB)

run:		build
	$(DOCR)

# CI
test:
	TAG=$(TARGET) $(DOCCD)
	TAG=$(TARGET) $(DOCCU) pg_isready port_check
	TAG=$(TARGET) $(DOCCD)
