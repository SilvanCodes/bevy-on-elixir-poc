# does user setup and gives 'install-packages' script, see https://github.com/gitpod-io/workspace-images
FROM gitpod/workspace-base@sha256:334d23d915611243b130aff8af6127dc360d0ea5f54cc7c4b0be6ccdfd0f56a3

ENV ASDF_VERSION=v0.10.0

# setup asdf-vm: https://asdf-vm.com/guide/getting-started.html
RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch ${ASDF_VERSION} \
    && echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc

# setup asdf plugins
COPY .devcontainer/bin/install-asdf-plugins /usr/bin/
RUN install-asdf-plugins

# install tolls from .tool-versions
COPY .tool-versions $HOME/
RUN bash -ic 'asdf install'

# install hex and rebar for Elixir's version manager mix
COPY .devcontainer/bin/install-mix-tooling /usr/bin/
RUN install-mix-tooling

# install Phoenix project generator
RUN bash -ic 'mix archive.install hex phx_new --force'

# get inotify-tools for live reload from phoenix, see: https://hexdocs.pm/phoenix/installation.html#inotify-tools-for-linux-users
RUN sudo install-packages inotify-tools

# install rustup, see: https://www.rust-lang.org/tools/install
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# add rustup and binaries installed via cargo to PATH
ENV PATH=$HOME/.cargo/bin:$PATH

ENV RUST_VERSION=1.66.0

RUN rustup install $RUST_VERSION

# install wasm as a compilation target for rustc
RUN rustup target add wasm32-unknown-unknown

# install wasm-bindgen-cli, see: https://rustwasm.github.io/docs/wasm-bindgen/introduction.html
RUN bash -ic 'cargo install wasm-bindgen-cli'

# required tooling for some crates
RUN sudo install-packages \
    # required for alsa-sys crate
    libasound2-dev \
    # required for libudev-sys crate
    libudev-dev

# standard tooling
RUN sudo install-packages \
    iputils-ping \
    postgresql-client \
    netcat

# install flyctl, see: https://fly.io/docs/flyctl/installing/
RUN curl -L https://fly.io/install.sh | sh
