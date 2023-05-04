FROM jupyterhub/jupyterhub:3.1.1

# install ngshare and ngshare_exchange and add user
RUN python3 -m pip install ngshare

# install dockerspawner and authenticators
RUN pip install --no-cache dockerspawner oauthenticator jupyterhub-nativeauthenticator

# run jupyterhub with config file
CMD jupyterhub -f /etc/jupyterhub/jupyterhub_config.py