FROM jupyter/minimal-notebook

# to unshow (base) in terminal
RUN conda config --set changeps1 false

# install nbgrader and xeus-cling from conda-forge
RUN conda install -y -c conda-forge nbgrader
RUN conda install -y -c conda-forge xeus-cling

# make the exchage directory for nbgrader if it doesn't exist
RUN mkdir -p /home/jovyan/exchange

# uninstall not necessery kernels
RUN jupyter kernelspec uninstall xcpp14 -y
RUN jupyter kernelspec uninstall xcpp17 -y

# run the app
CMD jupyter-lab --allow-root --ip=* --no-browser --ServerApp.token=''