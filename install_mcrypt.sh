#!/usr/bin/env bash

wd=~/
pd=/usr/local/php/
pmd=${wd}php-5.5.19-ex/ext/mcrypt

cd ${wd}

tar xjvf libmcrypt-2.5.8.tar.bz2
cd libmcrypt-2.5.8
./configure && make && make install

echo $?
echo libmcrypt install

cd ${wd}

tar xzvf mhash-0.9.9.9.tar.gz
cd mhash-0.9.9.9
./configure && make && make install

echo $?
echo mhash install

cd ${wd}

tar xzvf mcrypt-2.6.8.tar.gz
cd mcrypt-2.6.8
LD_LIBRARY_PATH=/usr/local/lib ./configure && make && make install

echo $?
echo mcrypt install

cd ${wd}
cd ${pmd}
${pd}bin/phpize
./configure --with-php-config=${pd}bin/php-config && make && make install

echo $?
echo php-mcrypt install