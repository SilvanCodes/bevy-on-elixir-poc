# does user setup and gives 'install-packages' script, see https://github.com/gitpod-io/workspace-images
FROM gitpod/workspace-base@sha256:334d23d915611243b130aff8af6127dc360d0ea5f54cc7c4b0be6ccdfd0f56a3

ENV ASDF_VERSION=v0.10.0

# setup asdf-vm: https://asdf-vm.com/guide/getting-started.html
RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch ${ASDF_VERSION} \
    && echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc

# setup asdf plugins
COPY .devcontainer/bin/install-asdf-plugins /usr/bin/
RUN install-asdf-plugins

COPY .tool-versions $HOME/
RUN bash -ic 'asdf install'

# get inotify-tools for live reload from phoenix, see: https://hexdocs.pm/phoenix/installation.html#inotify-tools-for-linux-users
RUN sudo install-packages inotify-tools

# standard tooling
RUN sudo install-packages \
    iputils-ping \
    postgresql-client \
    netcat

# install flyctl, see: https://fly.io/docs/flyctl/installing/
RUN curl -L https://fly.io/install.sh | sh

#################
### Utilities ###
#################

COPY .devcontainer/bin/install-mix-tooling /usr/bin/