FROM jupyter/base-notebook

RUN pip3 install jupyterhub==3.0.0

# to unshow (base) in terminal
RUN conda config --set changeps1 false

# install nbgrader from conda-forge
RUN conda install -y -c conda-forge nbgrader

# install xeus-cling from conda-forge
RUN conda install -y -c conda-forge xeus-cling 

# uninstall not necessery kernels
RUN jupyter kernelspec uninstall xcpp14 -y
RUN jupyter kernelspec uninstall xcpp17 -y

# install ngshare_exchange
RUN python3 -m pip install ngshare_exchange

# remove work folder and create symlink for ngshare-course-management -> cm
USER root
RUN rm -rf /home/jovyan/work
RUN ln -s /opt/conda/bin/ngshare-course-management /usr/local/bin/cm

# copy nbgrader_config.py
COPY ./nbgrader_config.py /etc/jupyter/nbgrader_config.py