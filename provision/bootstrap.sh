#!/bin/sh

# ==============================================================================
# = author        :- sameh kamal
# = description   :- provisioning a machine with unimrcp server
# = preconditions :- runs on ubuntu 14.4.x
# ==============================================================================
printf "> update ubuntu repositories\n\n"
sudo apt-get clean
sudo mv       /var/lib/apt/lists /tmp
sudo mkdir -p /var/lib/apt/lists/partial
sudo apt-get clean
sudo apt-get update
printf "> install build packages [build-essential libtool]\n\n"
sudo apt-get install -y build-essential libtool pkg-config autoconf automake

# create a temporary directory and enter it.
printf "> create [tmp] directory\n\n"
mkdir -p tmp
printf "# enter [tmp] directory\n\n"
cd tmp

# remove default apr if existing then download and install apr v1.5.2
printf "> remove [apr] package using apt-get\n\n"
sudo apt-get purge apr

# download and install unimrcp dependencies v1.3.0
printf "download [unimrcp-dependencies] v1.3.0] from <www.unimrcp.org>\n\n"
wget http://www.unimrcp.org/project/component-view/unimrcp-deps-1-3-0-tar-gz/download -O unimrcp-deps-1.3.0.tar.gz
printf "> extract [unimrcp-dependencies] package tar ball\n\n"
tar -zxf unimrcp-deps-1.3.0.tar.gz
printf "# enter [unimrcp-deps-1.3.0] directory\n\n"
cd unimrcp-deps-1.3.0
printf "> build dependencies libraries\n\n"
./build-dep-libs.sh -s
printf "# leave [unimrcp-deps-1.3.0] directory\n\n"
cd ..

# download and install unimrcp server v1.3.0
printf "> download [unimrcp v1.3.0] from <www.unimrcp.org>\n\n"
wget http://www.unimrcp.org/project/featured-view/unimrcp-1-3-0-tar-gz/download -O unimrcp-1.3.0.tar.gz
printf "> extract [unimrcp] package tar ball\n\n"
tar -zxf unimrcp-1.3.0.tar.gz
printf "# enter [unimrcp-1.3.0] directory\n\n"
cd unimrcp-1.3.0
printf "> bootstrap & configure [unimrcp] build files\n\n"
./bootstrap
./configure
printf "> build [unimrcp]\n\n"
make
printf "> install [unimrcp] to default path\n\n"
sudo make install
printf "# leave [unimrcp-1.3.0] directory\n\n"
cd ..
printf "# leave [tmp] directory\n\n"
cd ..
printf "> remove tmp directory\n\n"
