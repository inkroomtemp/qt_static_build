FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive && apt update -y && apt-get install -y tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata  && apt upgrade -y 
RUN apt install -y \
 libc-dev-bin \
 libc-dev \
 g++ \
 dpkg-dev \
 build-essential \
 clang \
 cmake \
 apt-utils \
 tar \
 python \
 automake \
 pkg-config \
 libxml2-dev \
 libsqlite3-dev \
 unzip \
 wget 
RUN apt install -y clang-format clang-tidy clang-tools clang clangd libc++-dev libc++abi-dev libc++abi1 libclang-dev libclang1 libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev llvm-runtime llvm python-clang 
RUN apt install -y libgl-dev libglu-dev    libfontconfig1-dev  libfreetype6-dev  libx11-dev  libx11-xcb-dev  libxext-dev  libxfixes-dev    libxi-dev    libxrender-dev    libxcb1-dev    libxcb-glx0-dev    libxcb-keysyms1-dev    libxcb-image0-dev    libxcb-shm0-dev    libxcb-icccm4-dev    libxcb-sync-dev    libxcb-xfixes0-dev    libxcb-shape0-dev    libxcb-randr0-dev    libxcb-render-util0-dev    libxcb-util-dev    libxcb-xinerama0-dev    libxcb-xkb-dev    libxkbcommon-dev    libxkbcommon-x11-dev 
RUN wget -q https://download.qt.io/official_releases/qt/6.4/6.4.2/single/qt-everywhere-src-6.4.2.tar.xz \
 && tar -xf qt-everywhere-src-6.4.2.tar.xz && cd qt-everywhere-src-6.4.2 && ./configure --help && ./configure -prefix ./static-build -release -confirm-license -opensource -c++std c++11 -static  -platform linux-g++-64  -qt-zlib -qt-libpng -qt-libjpeg -no-journald  -openssl -opengl -xcb -skip qtquickcontrols -skip qtquickcontrols2 -skip qtsensors -skip qtdoc -skip examples \
 && make && echo "make成功" && make install && echo "install成功" && tree

