.PHONY: plotly minimal scipy build

ifeq ($(GIT),)
  GIT := $(HOME)/git
endif

MINIMAL := jupyter/minimal-notebook
SCIPY := jupyter/scipy-notebook
PLOTLY := jupyter-plotly
PYTHONPATH := -e PYTHONPATH=$(PYTHONPATH)

DOCKER := docker run $(OPT) $(PYTHONPATH) -p 8888:8888 -v $(GIT):/opt/git -w /opt/git/jupyter/notebooks

minimal:
	$(DOCKER) $(MINIMAL)

manual:
	$(DOCKER) $(IMAGE)

plotly:
	$(DOCKER) $(PLOTLY)

scipy:
	$(DOCKER) $(SCIPY)

build:
	docker build -t $(PLOTLY) -f Dockerfile .
