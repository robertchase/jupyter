.PHONY: minimal scipy plotly ipython build

ifeq ($(GIT),)
  GIT := $(HOME)/git
endif

MINIMAL := jupyter/minimal-notebook
SCIPY := jupyter/scipy-notebook
PLOTLY := jupyter-plotly

DOCKER := docker run -p 8888:8888 -v $(GIT):/opt/git -w /opt/git/jupyter/notebooks

minimal:
	$(DOCKER) $(MINIMAL)

scipy:
	$(DOCKER) $(SCIPY)

plotly:
	$(DOCKER) $(PLOTLY)

build:
	docker build -t $(PLOTLY) -f Dockerfile .
