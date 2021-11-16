#!/bin/bash

# RELEVANT FOLDERS/FILES
folders=(~/.config/xfce4 ~/.local/share/xfce4 /etc/xdg/xfce4 ~/.config/Thunar /etc/xdg/Thunar /etc/xdg/menus)
folders2=(config-xfce4 local-xfce4 etc-xfce4 config-Thunar etc-Thunar etc-menus)

# FUNCTIONS
function check_folders(){
    echo "Checking folders..."
    [ -d $1 ] && echo "$1/ already exists... please backup the contents of the folder and delete it so that it can be used as a temp folder" && return 1

    for i in ${folders[@]}; do
        [ ! -d $i ] && echo "$i/ does not exist..." && return 1
    done

    echo "Done"
    return 0;
}

function save(){
    check_folders $1; [ $? -eq 1 ] && exit
    mkdir $1

    echo "Copying folders..."
    for i in {0..5}; do
        cp -r ${folders[i]} $1/${folders2[i]}
    done

    echo "Copying GTK config file..."
    cp '~/.gtkrc-2.0' "$1/gtkrc-2.0"

    echo "Archiving..."
    tar czf $1.tar.gz $1

    echo "Done... Removing temp folder"
    rm -rf $1
}

function load(){
    check_folders $1; [ $? -eq 1 ] && exit
    [ ! -f $1.tar.gz ] && echo "Config tarball doesn't exist in the folder, check it's location..." && exit

    echo "Extracting..."
    tar xf $1.tar.gz
    cd $1

    echo "Granting Permissions..."
    sudo chown -R $USERNAME:users ./*

    echo "Placing folders and files in their location..."
    for i in {0..5}; do
        sudo cp -r ${folders2[i]}/* ${folders[i]}
        sudo cp "gtkrc-2.0" "~/.gtkrc-2.0"
    done

    echo "Done... Removing temp folder"
    cd ..
    rm -rf $1
    killall -q xfconfd
}

# DRIVER CODE
read -p "Do you want to (s)ave or (l)oad a configuration: " choice
choice=${choice,,}

if [ $choice != 's' ] && [ $choice != 'l' ]; then
    echo "Invalid choice... write either s or l"
else
    read -p "Enter the name of config: " name
    if [ $choice == 's' ]; then
        save $name
    else
        load $name
    fi
fi
