FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive && apt update -y && apt-get install -y tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata  && apt upgrade -y \
    && apt install -y \
 libc-dev-bin \
 libc-dev \
 g++ \
 dpkg-dev \
 build-essential \
 clang \
 apt-utils \
 tar \
 python \
 automake \
 pkg-config \
 libxml2-dev \
 libsqlite3-dev \
 unzip \
 openssl \
 wget \
 tree \
 && apt install -y clang-format clang-tidy clang-tools clang clangd libc++-dev libc++abi-dev libc++abi1 libclang-dev libclang1 libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev llvm-runtime llvm python-clang \
 && apt install -y libssl-dev libgl-dev libglu-dev    libfontconfig1-dev  libfreetype6-dev libxcb-cursor-dev libx11-dev  libx11-xcb-dev  libxext-dev  libxfixes-dev    libxi-dev    libxrender-dev    libxcb1-dev    libxcb-glx0-dev    libxcb-keysyms1-dev    libxcb-image0-dev    libxcb-shm0-dev    libxcb-icccm4-dev    libxcb-sync-dev    libxcb-xfixes0-dev    libxcb-shape0-dev    libxcb-randr0-dev    libxcb-render-util0-dev    libxcb-util-dev    libxcb-xinerama0-dev    libxcb-xkb-dev    libxkbcommon-dev    libxkbcommon-x11-dev \
 && pwd && ls && wget https://cmake.org/files/v3.21/cmake-3.21.7.tar.gz && tar zxvf cmake-3.21.7.tar.gz && cd cmake-3.21.7 && ./configure && make -j 2 && make install \
 && cd ../ && wget -q https://download.qt.io/official_releases/qt/6.5/6.5.1/single/qt-everywhere-src-6.5.1.tar.xz \
 && wget -q https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.xz && mkdir -p /usr/local/lib/nodejs && tar -xJvf node-v18.16.0-linux-x64.tar.xz -C /usr/local/lib/nodejs && echo "export PATH=/usr/local/lib/nodejs/node-v18.16.0-linux-x64/bin:$PATH" >> ~/.profile && . ~/.profile && node -v \
 && tar -xf qt-everywhere-src-6.5.1.tar.xz && cd qt-everywhere-src-6.5.1 && ./configure --help && ./configure -prefix /static-build -release -confirm-license -opensource -c++std c++11 -static  -platform linux-g++-64  -qt-zlib -qt-libpng -qt-libjpeg -no-journald  -skip tests -skip qtquickcontrols -skip qtquickcontrols2 -skip qtsensors -skip qtdoc -skip examples \
 && make -j 2 && echo "make成功" \
 && make install && echo "install成功" && tree \
 && cd ../ && ls && rm -rf qt-everywhere-src-6.5.1 && rm -rf qt-everywhere-src-6.5.1.tar.xz && rm -rf cmake-3.21.7.tar.gz && rm -rf cmake-3.21.7 && rm -rf node-v18.16.0-linux-x64.tar.xz

