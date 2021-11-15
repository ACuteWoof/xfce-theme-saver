# Xfce-theme-saver

This is a bash script that allows you to save your current xfce configuration as a tar archive. And then you can copy this tarball on a different system/fresh xfce install, and load it so that you get your previous xfce config back in no time! You won't have to go through the hassle of setting up your keybinds/panel, etc. all over again.

It's the equivalent of copying dotfiles on a standalone window manager.

---
### Usage
Open a terminal, go to the folder where the script is, and:
```bash
$ bash xfce_theme_saver.sh
# or you can make it an executable
$ chmod +x xfce_theme_saver.sh
$ ./xfce_theme_saver.sh
```

It will ask you whether to load or save, choose accordingly and input the name of the config, it should handle errors like existing file name, etc. and tell that to the user.

When you move the script and tarball to a new system, **MAKE SURE to give them the correct permissions**
```bash
$ sudo chown -R $USERNAME:users xfce_theme_saver.sh your_config.tar.gz
# if your usergroup is not `users`, change it accordingly
```
The script will run this command on all files of the extracted archive so you needn't worry about that


---
### Demo
https://user-images.githubusercontent.com/70441461/141766034-d9a26033-0660-4c14-8318-3ea6cb3d35e7.mp4

In the video, we first make a sample config (put some widgets on the panel and change Thunar icon size), save that as a tarball (`garbage_config.tar.gz`). Then on a new system, we do a fresh xfce install, load that config, boot into xfce for the first time and voila! The panel and Thunar icons are configured just the way we wanted them to :)

And it wasn't shown in the video, but all your keybinds/workspaces and other settings are carried over as well.

---
### Limitations

Sadly, as of now it cannot entirely replicate your previous desktop. It can't copy over your wallpaper so you'll have to set that up on your own. It also seems to have problems with copying the GTK theme.

You're more than welcome to contribute to the project if you feel like it 😁

---
