.PHONY: minimal scipy

ifeq ($(GIT),)
  GIT := $(HOME)/git
endif

MINIMAL := jupyter/minimal-notebook
SCIPY := jupyter/scipy-notebook

DOCKER := docker run -p 8888:8888 -v $(GIT):/opt/git -w /opt/git/jupyter/notebooks

minimal:
	$(DOCKER) $(MINIMAL)

scipy:
	$(DOCKER) $(SCIPY)

build:
	docker build -t $(IMAGE) -f Dockerfile .
