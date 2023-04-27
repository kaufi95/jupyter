FROM continuumio/miniconda3

RUN conda install -y jupyterlab nbgrader xeus-cling -c conda-forge

RUN mkdir -p /opt/exchange
RUN chmod ugo+rw /opt/exchange

WORKDIR /opt

EXPOSE 8888

CMD ["jupyter-lab", "--allow-root", "--ip=*", "--no-browser", "--notebook-dir=/opt", "--ServerApp.token=''"]