sudo wget http://ftp.gnu.org/gnu/glibc/glibc-2.18.tar.gz
sudo tar zxf glibc-2.18.tar.gz 
sudo cd glibc-2.18/
sudo mkdir build
sudo cd build/
sudo ../configure --prefix=/usr
sudo make -j2
sudo make install

