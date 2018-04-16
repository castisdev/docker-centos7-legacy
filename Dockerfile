# Pull base image
FROM centos:7

# Install EPEL repo
RUN yum install -y epel-release; yum -y clean all

# Install
RUN yum install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl-devel \
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
  gperftools-devel; \
  yum -y clean all

ADD install_xercesc280.sh /script/
RUN /script/install_xercesc280.sh

ADD install_cmake3110.sh /script/
RUN /script/install_cmake3110.sh

ADD install_cryptopp700.sh /script/
RUN /script/install_cryptopp700.sh

ADD install_googletest180.sh /script/
RUN /script/install_googletest180.sh

ADD install_python365.sh /script/
RUN /script/install_python365.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck183.sh /script/
RUN /script/install_cppcheck183.sh

ADD install_zsh550.sh /script/
RUN /script/install_zsh550.sh

ADD install_ninja182.sh /script/
RUN /script/install_ninja182.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD .bashrc /root/.bashrc

# Set environment variables
ENV HOME /root

# Define default command
CMD ["zsh"]
