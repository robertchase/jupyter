.PHONY: plotly minimal plotnine scipy build

ifeq ($(GIT),)
  GIT := $(HOME)/git
endif

MINIMAL := jupyter/minimal-notebook
SCIPY := jupyter/scipy-notebook
PLOTLY := jupyter-plotly
PLOTNINE := jupyter-plotnine

PYTHONPATH := -e PYTHONPATH=$(PYTHONPATH)

DOCKER := docker run --rm $(OPT) $(PYTHONPATH) -p 8888:8888 -v $(GIT):/opt/git -v $(HOME):/opt/home -w /opt/git/jupyter/notebooks

minimal:
	$(DOCKER) $(MINIMAL)

manual:
	$(DOCKER) $(IMAGE)

plotly:
	$(DOCKER) $(PLOTLY)

plotnine:
	$(DOCKER) $(PLOTNINE)

scipy:
	$(DOCKER) $(SCIPY)

build:
	# docker build -t $(PLOTLY) -f Dockerfile .
	docker build -t $(PLOTNINE) -f Dockerfile.plotnine .
