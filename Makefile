DOC			:= docker
DOCC		:= $(DOC) compose

TAG			?= edge
TARGET_PATH ?= .
DOCK_USER	?= pixailz
DOCK_NAME	?= postgresql

DOCB		:= $(DOC) buildx build $(TARGET_PATH) \
				--build-arg TAG=$(TAG) \
				--tag $(DOCK_USER)/$(DOCK_NAME):$(TAG)
DOCR		:= $(DOC) run --detach --rm $(DOCK_USER)/$(DOCK_NAME):$(TAG)

DOCCU		:= $(DOCC) up --build -d --wait
DOCCD		:= $(DOCC) down --remove-orphans --volumes

.DEFAULT:	build

build:
	$(DOCB)

run:		build
	$(DOCR)

# CI
test:
	TAG=$(TAG) $(DOCCD)
	TAG=$(TAG) $(DOCCU) pg_isready port_check
	TAG=$(TAG) $(DOCCD)
