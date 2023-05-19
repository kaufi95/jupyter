FROM jupyterhub/jupyterhub:3.1.1

# install ngshare_exchange
RUN python3 -m pip install ngshare

# install dockerspawner and authenticators
RUN pip install --no-cache dockerspawner oauthenticator jupyterhub-nativeauthenticator

# run jupyterhub with config file
CMD jupyterhub -f /etc/jupyterhub/jupyterhub_config.py