#! /bin/bash
# srs控制后台端口
# sudo ufw allow from any to any port 8080 proto tcp
sudo ufw allow from any to any port 8085 proto tcp
sudo ufw allow from any to any port 8088 proto tcp
# RTMP端口
sudo ufw allow from any to any port 1935 proto tcp
# RTMPS端口
sudo ufw allow from any to any port 19350 proto tcp

# RTMPT和RTMPS端口
sudo ufw allow from any to any port 843 proto tcp
sudo ufw allow from any to any port 443 proto tcp
# Http API端口
sudo ufw allow from any to any port 1985 proto tcp
sudo ufw allow from any to any port 1988 proto tcp
# RTC端口
sudo ufw allow from any to any port 8000 proto tcp
sudo ufw allow from any to any port 8000 proto udp
sudo ufw allow from any to any port 5000:6000 proto tcp
sudo ufw allow from any to any port 5000:6000 proto udp
# SRT端口
sudo ufw allow from any to any port 9000 proto udp
sudo ufw allow from any to any port 10080 proto udp


sudo sysctl -w net.core.rmem_max = 16777216
sudo sysctl -w net.core.rmem_default = 16777216
sudo sysctl -w net.core.wmem_max = 16777216
sudo sysctl -w net.core.wmem_default = 1677721

sudo apt-get install libx264-dev
sudo apt-get install libx265-dev

sudo apt-get update && sudo apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libass-dev \
  libfreetype6-dev \
  libgnutls28-dev \
  libmp3lame-dev \
  libsdl2-dev \
  libtool \
  libva-dev \
  libvdpau-dev \
  libvorbis-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  meson \
  ninja-build \
  pkg-config \
  texinfo \
  wget \
  yasm \
  zlib1g-dev \
  libunistring-dev
  
#仅配置路径
./configure --enable-shared  --prefix=/usr/local/ffmpeg
 
#配置某些选项
./configure --prefix=/usr/local/ffmpeg --enable-shared --disable-static --disable-doc  --enable-gpl --enable-libx264
 
#配置项查看
./configure --help

make
sudo make install

sudo ln -s /usr/local/ffmpeg/bin/ffmpeg /usr/bin/ffmpeg
sudo ln -s /usr/local/ffmpeg/bin/ffprobe /usr/bin/ffprobe
sudo ln -s /usr/local/ffmpeg/bin/ffplay /usr/bin/ffplay


#打开.bashrc文件
sudo gedit ~/.bashrc
 
#在文件中添加
export PATH="/usr/local/ffmpeg/bin:$PATH"
 
#使修改生效
source ~/.bashrc

sudo vi /etc/ld.so.conf
在其中添加路径：/usr/local/ffmpeg/lib
 
sudo ldconfig#更新环境变量

ffmpeg -version


# 编译安装 ZLMediaKit 
wget https://github.com/cisco/libsrtp/archive/refs/tags/v2.6.0.tar.gz libsrtp-v2.6.0.tar.gz
tar -xvf libsrtp-v2.6.0.tar.gz
cd libsrtp-2.6.0/



