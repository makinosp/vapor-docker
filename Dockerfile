FROM swift:6.1

RUN apt update && \
  apt install -y \
  git \
  curl \
  libssl-dev \
  libsqlite3-dev \
  pkg-config \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash linuxbrew
USER linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:$PATH

RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
  brew update && \
  brew install vapor
