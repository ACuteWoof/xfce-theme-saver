# Xfce-theme-saver

This is a bash script that allows you to save your current xfce configuration as a tar archive. And then you can copy this tarball on a different system/fresh xfce install, and load it so that you get your previous xfce config back in no time! You won't have to go through the hassle of setting up your keybinds/panel, etc. all over again.

It's the equivalent of copying dotfiles on a standalone window manager.

---

### Limitations

Sadly, as of now it cannot entirely replicate your previous desktop. It can't copy over your wallpaper so you'll have to set that up on your own. It also seems to have problems with copying the GTK theme.

You're more than welcome to contribute to the project if you feel like it 😁

---

### Demo
https://user-images.githubusercontent.com/70441461/141766034-d9a26033-0660-4c14-8318-3ea6cb3d35e7.mp4

In the video, we first make a sample config (put some widgets on the panel and change Thunar icon size), save that as a tarball (`garbage_config.tar.gz`), then on a new system, we do a fresh xfce install, load that config, boot into xfce for the first time and voila! The panel and Thunar icons are configured just the way we wanted them to :)
And it wasn't shown in the video, but all your keybinds/workspaces and other settings are carried over as well.

