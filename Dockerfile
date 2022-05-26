# Pull base image
FROM centos:7

LABEL org.opencontainers.image.source https://github.com/castisdev/docker-centos7-legacy

# Install EPEL repo
RUN yum install -y epel-release; yum -y clean all

RUN yum install -y http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm; yum -y clean all

# Install
RUN yum install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl-devel \
  openssl-static \
  git \
  subversion \
  tar \
  boost-devel \
  boost-static \
  glibc-devel \
  libuuid-devel \
  gdb \
  valgrind \
  mysql-devel \
  postgresql93-devel \
  curl-devel \
  xz \
  file \
  vim-enhanced \
  unixODBC-devel \
  mysql-connector-odbc \
  sysstat \
  psmisc \
  sysvinit-tools \
  yum-utils \
  tbb-devel \
  gperftools-devel \
  iproute \
  net-tools \
  ccache \
  libunwind-devel \
  libasan \
  libasan-static \
  patch \
  && yum -y clean all

ADD install_xercesc280.sh /script/
RUN /script/install_xercesc280.sh

ADD install_cmake3232.sh /script/
RUN /script/install_cmake3232.sh

ADD install_cryptopp860.sh /script/
RUN /script/install_cryptopp860.sh

ADD install_googletest1100.sh /script/
RUN /script/install_googletest1100.sh

ADD install_python3913.sh /script/
RUN /script/install_python3913.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck28.sh /script/
RUN /script/install_cppcheck28.sh

ADD install_zsh59.sh /script/
RUN /script/install_zsh59.sh

ADD install_ninja1110.sh /script/
RUN /script/install_ninja1110.sh

ADD install_ffmpeg501.sh /script/
RUN /script/install_ffmpeg501.sh

ADD install_golang1182.sh /script/
RUN /script/install_golang1182.sh

ADD install_libwebp122.sh /script/
RUN /script/install_libwebp122.sh

ADD install_wrk420.sh /script/
RUN /script/install_wrk420.sh

ADD install_protobuf210.sh /script/
RUN /script/install_protobuf210.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD .bashrc /root/.bashrc

# Set environment variables
ENV HOME /root
ENV PATH="${PATH}:${HOME}/go/bin:/usr/local/go/bin"

# Define default command
CMD ["zsh"]
