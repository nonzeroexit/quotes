#!/bin/bash

if [ -L "/usr/local/bin/quotes" ]; then
    sudo rm "/usr/local/bin/quotes"
fi

if [ -d "/usr/local/bin/quotes_files" ]; then
    sudo rm -r "/usr/local/bin/quotes_files"
fi

if [ -z "$quotes_path" ];then
    while : ; do
        echo -n "path to your quotes dir: "
        read pathToQuotes
        if [ -d "$pathToQuotes" ]; then
            echo "export quotes_path=$pathToQuotes" >> $HOME/.bashrc
            break
        else
            echo "$pathToQuotes doesn't exists, try again."
        fi
    done
fi

if [ "$1" == "local" ];then
    sudo cp -r src /usr/local/bin/quotes_files
    cd /usr/local/bin
    sudo ln -s /usr/local/bin/quotes_files/quotes.py quotes
    sudo chmod a+rx quotes
else
    wget http://github.com/nonzeroexit/quotes/archive/master.zip -O /tmp/quotes.zip
    unzip -o /tmp/quotes.zip -d /tmp
    sudo cp -r /tmp/quotes-main/src /usr/local/bin/quotes_files
    cd /usr/local/bin
    sudo ln -s /usr/local/bin/quotes_files/quotes.py quotes
    sudo chmod a+rx quotes
fi
bash
