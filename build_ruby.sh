#!/bin/sh

# tested on ec2 with ami-00615068

rubyversion=2.2.2
rubysrc=ruby-$rubyversion.tar.gz
checksum=5ffc0f317e429e6b29d4a98ac521c3ce
destdir=/tmp/install-$rubyversion

sudo apt-get update
sudo apt-get -y install libssl-dev libreadline-dev6.2-8 ruby ruby-dev rubygems

gem list -i fpm || sudo gem install fpm --no-ri --no-rdoc

if [ ! -f $rubysrc ]; then
  wget -q http://cache.ruby-lang.org/pub/ruby/2.2/$rubysrc
fi

if [ "$(sha256sum $rubysrc | cut -b1-32)" != "$checksum" ]; then
  echo "Checksum mismatch!"
  exit 1
fi

echo "Unpacking $rubysrc"
tar -zxf $rubysrc
cd ruby-$rubyversion
./configure --prefix=/usr && make && make install DESTDIR=$destdir

cd ..
fpm -s dir -t deb -n ruby-$rubyversion -v $rubyversion -C $destdir \
  -p ruby-VERSION_ARCH.deb -d "libstdc++6 (>= 4.4.3)" \
  -d "libc6 (>= 2.6)" -d "libffi6 (>= 3.0.10)" -d "libgdbm3 (>= 1.8.3)" \
  -d "libncurses5 (>= 5.9)" -d "libreadline6 (>= 6.2)" \
  -d "libssl1.0.0 (>= 1.0.1)" -d "zlib1g (>= 1:1.2.3.4)" \
  -d "libreadline6 (>= 6.0)" \
  usr/bin usr/lib usr/share/man usr/include

rm -r $destdir
