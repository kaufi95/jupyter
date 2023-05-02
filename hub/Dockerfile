FROM jupyterhub/jupyterhub:4.0.0

RUN pip install --no-cache dockerspawner oauthenticator jupyterhub-nativeauthenticator

CMD jupyterhub -f /etc/jupyterhub/jupyterhub_config.py