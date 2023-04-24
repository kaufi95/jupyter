FROM continuumio/miniconda3

RUN conda install -y -c conda-forge jupyter xeus-cling

RUN pip install nbgrader

RUN conda update --all
RUN pip install pip-review
RUN pip-review --auto

RUN rm -rf /opt/exchange
RUN mkdir /opt/exchange
RUN chmod ugo+rw /opt/exchange

RUN mkdir -p /opt/notebooks
WORKDIR /opt

EXPOSE 8888

# RUN jupyter-lab --allow-root --ip=* --no-browser