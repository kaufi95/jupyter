FROM jupyter/minimal-notebook

# to unshow (base) in terminal
RUN conda config --set changeps1 false

# install nbgrader from conda-forge
RUN conda install -y -c conda-forge nbgrader

# install xeus-cling from conda-forge
RUN conda install -y -c conda-forge xeus-cling 

# uninstall not necessery kernels
RUN jupyter kernelspec uninstall xcpp14 -y
RUN jupyter kernelspec uninstall xcpp17 -y

# make the exchage directory for nbgrader if it doesn't exist
RUN mkdir -p /home/jovyan/exchange

# remove the work directory
RUN rm -rf /home/jovyan/work

# set the workdir
WORKDIR /home/jovyan

# run the app
CMD jupyter-lab --allow-root --ip=* --no-browser --ServerApp.token=''