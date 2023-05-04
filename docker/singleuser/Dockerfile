FROM jupyter/base-notebook

RUN pip3 install jupyterhub==3.1.1

# to unshow (base) in terminal
RUN conda config --set changeps1 false

# install nbgrader from conda-forge
RUN conda install -y -c conda-forge nbgrader

# install xeus-cling from conda-forge
RUN conda install -y -c conda-forge xeus-cling 

# uninstall not necessery kernels
RUN jupyter kernelspec uninstall xcpp14 -y
RUN jupyter kernelspec uninstall xcpp17 -y

COPY ./nbgrader_config.py /etc/jupyter/nbgrader_config.py