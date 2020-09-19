FROM ubuntu:16.04
RUN apt update
RUN apt install wget -y
SHELL [ "/bin/bash", "--login", "-c" ]
COPY entrypoint.sh /usr/local/bin/
ARG username=airnh
ARG uid=1000
ARG gid=100
ENV USER $username
ENV UID $uid
ENV GID $gid
ENV HOME /home/$USER
RUN adduser --disabled-password \
    --gecos "Non-root user" \
    --uid $UID \
    --gid $GID \
    --home $HOME \
    $USER


USER $USER
# install miniconda
ENV MINICONDA_VERSION latest
ENV CONDA_DIR $HOME/miniconda3
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-$MINICONDA_VERSION-Linux-x86_64.sh -O ~/miniconda.sh && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p $CONDA_DIR && \
    rm ~/miniconda.sh
# make non-activate conda commands available
ENV PATH=$CONDA_DIR/bin:$PATH
# make conda activate command available from /bin/bash --login shells
RUN echo ". $CONDA_DIR/etc/profile.d/conda.sh" >> ~/.profile
# make conda activate command available from /bin/bash --interative shells
RUN conda init bash


# create a project directory inside user home
ENV PROJECT_DIR $HOME/workspace
RUN mkdir $PROJECT_DIR
WORKDIR $PROJECT_DIR



# build the conda environment
ENV ENV_PREFIX avb_imu
RUN conda update --name base --channel defaults conda && \
    conda create --name $ENV_PREFIX --force && \
    conda clean --all --yes

# run the postBuild script to install any JupyterLab extensions
RUN conda activate $ENV_PREFIX
RUN conda install jupyter jupyterlab ipympl numpy matplotlib

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "jupyter", "lab", "--no-browser", "--ip", "0.0.0.0" ]




