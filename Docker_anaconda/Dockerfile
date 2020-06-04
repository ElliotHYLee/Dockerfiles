from ubuntu:16.04
run apt-get update
copy Anaconda3-2020.02-Linux-x86_64.sh /home/
workdir /home/
run sh Anaconda3-2020.02-Linux-x86_64.sh -b
ENV PATH "$PATH:~/anaconda3/bin"
SHELL ["/bin/bash", "-c"]
run source ~/.bashrc
run conda config --set auto_activate_base False
run conda init bash
