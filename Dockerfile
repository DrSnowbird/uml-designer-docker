FROM openkbs/jdk-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

## -------------------------------------------------------------------------------
## ---- USER_NAME is defined in parent image: openkbs/jdk-mvn-py3-x11 already ----
## -------------------------------------------------------------------------------
ENV USER_NAME=${USER_NAME:-developer}
ENV HOME=/home/${USER_NAME}
ARG PRODUCT_WORKSPACE=${PRODUCT_WORKSPACE:-${HOME}/workspace}
ENV PRODUCT_WORKSPACE=${PRODUCT_WORKSPACE}

## ----------------------------------------------------------------------------
## ---- To change to different UML Designer version here! ----
## ----------------------------------------------------------------------------

## -- Eclipse version: oxygen, photon, etc.: -- ##
ENV PRODUCT_VERSION=${PRODUCT_VERSION:-8.1.0}

## ----------------------------------------------------------------------------------- ##
## ----------- Don't change below unless Product download system change -------------- ##
## ----------------------------------------------------------------------------------- ##
## -- Eclipse Download Mirror site: -- ##
ARG PRODUCT_MIRROR_SITE_URL=${PRODUCT_MIRROR_SITE_URL:-https://s3-eu-west-1.amazonaws.com/obeo-umldesigner-releases}

## -- Eclipse TAR/GZ filename: -- ##
ARG PRODUCT_TAR=${PRODUCT_TAR:-UMLDesigner-linux.gtk.x86_64.zip}

## -- Eclipse Download route: -- ##
ARG PRODUCT_DOWNLOAD_ROUTE=${PRODUCT_DOWNLOAD_ROUTE:-bundles}

## -- Eclipse Download full URL: -- ##
#ARG PRODUCT_DOWNLOAD_URL=${PRODUCT_DOWNLOAD_URL:-https://s3-eu-west-1.amazonaws.com/obeo-umldesigner-releases}
ARG PRODUCT_DOWNLOAD_URL=${PRODUCT_MIRROR_SITE_URL}/${PRODUCT_VERSION}/${PRODUCT_DOWNLOAD_ROUTE}

WORKDIR /opt
RUN sudo wget -c ${PRODUCT_DOWNLOAD_URL}/${PRODUCT_TAR} && \
    sudo unzip ${PRODUCT_TAR} && \
    sudo rm ${PRODUCT_TAR} 
    
VOLUME ${PRODUCT_WORKSPACE}
VOLUME ${HOME}/.metadata 
VOLUME ${HOME}/.eclipse 

RUN sudo mkdir -p VOLUME ${HOME}/.eclipse ${HOME}/.metadata ${PRODUCT_WORKSPACE} && \
    sudo chown -R ${USER_NAME}:${USER_NAME} ${HOME}/.eclipse ${HOME}/.metadata ${PRODUCT_WORKSPACE} 
    
USER ${USER_NAME}
WORKDIR ${PRODUCT_WORKSPACE}
CMD ["/opt/UMLDesigner/UMLDesigner"]
