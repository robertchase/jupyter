FROM jupyter/scipy-notebook

# versions from: https://towardsdatascience.com/its-2019-make-your-data-visualizations-interactive-with-plotly-b361e7d45dc6
# plotly 4.0 is out, so should check for cufflinks to settle out with the new stuff (and see what 4.0 brings)
RUN pip install cufflinks==0.15 plotly==3.8.1
