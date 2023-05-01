FROM continuumio/miniconda3

# to unshow (base) in terminal
RUN conda config --set changeps1 false

# install jupyterlab, nbgrader and xeus-cling from conda-forge
RUN conda install -y jupyterlab nbgrader xeus-cling -c conda-forge

# make the exchage directory
RUN mkdir -p /opt/exchange

# add persmissons for the exchange directory
RUN chmod ugo+rw /opt/exchange

# uninstall not necessery kernels
RUN jupyter kernelspec uninstall xcpp14 -y
RUN jupyter kernelspec uninstall xcpp17 -y

# change workdir
WORKDIR /opt

# run the app
CMD jupyter-lab --allow-root --ip=* --no-browser --notebook-dir=/opt --ServerApp.token=''