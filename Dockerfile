FROM openfoam/openfoam9-paraview56:9

USER root

# Install any extra things we might need
RUN apt-get update \
	&& apt-get install -y \
		vim \
		ssh \
		sudo \
		wget \
		git \
		software-properties-common ;\
		rm -rf /var/lib/apt/lists/*
# Create a new user called foam
RUN useradd --user-group --create-home --shell /bin/bash foam ;\
	echo "foam ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir -p /newfolder
RUN chown foam /newfolder
RUN git clone https://github.com/barbagroup/pipe_verification.git /home/foam/pipe_verification
# set the default container user to foam
USER foam