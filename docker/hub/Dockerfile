FROM jupyterhub/jupyterhub:3.1.1

# install git, python3-dev and gcc-aarch64-linux-gnu for ngshare_exchange installation
RUN apt-get update && apt-get install -y git python3-dev gcc-aarch64-linux-gnu

# install ngshare and ngshare_exchange
RUN python3 -m pip install ngshare ngshare_exchange

# install dockerspawner and authenticators
RUN pip install --no-cache dockerspawner oauthenticator jupyterhub-nativeauthenticator

# run jupyterhub with config file
CMD jupyterhub -f /etc/jupyterhub/jupyterhub_config.py