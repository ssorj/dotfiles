# Dotfiles

## Manual steps

 - Terminal preferences
   - Don't show menu bar
   - Always hide the scroll bar
   - White on black, xterm colors
 - Install Chrome
 - Install packages
   - sudo dnf install irssi emacs emacs-goodies emacs-yaml-mode git gitk gnome-tweak-tool docker ack svn python3-sphinx asciidoctor vlgothic-fonts podman-docker gitg
 - Adjust sudo settings
 - Copy SSH keys
 - Irssi
   - "/set completion_char ,"
 - Gnome tweak tool
   - Alternatetab (window based switching)
   - Launch new instance
   - Show date in clock
   - Swap Ctrl and Caps Lock
 - Gnome keyboard settings
   - Add Chrome launcher - Ctrl+Super+B
   - Add Emacs launcher - Ctrl+Super+E
   - Add terminal launcher - Ctrl+Super+T
   - Super+N for workspaces
 - Gnome privacy settings
   - Disable screen lock
   - Auto delete trash and temp files
 - Gnome power settings
   - Suspend after 2 hours
 - Gnome sound
   - Turn off sound effects

## Fixing switch to workspace

Gnome 3.32 added a feature that broke my favorite keyboard shortcuts.
This disables the new feature and restores them to working order.

```bash
$ for i in $(seq 1 9); do
  gsettings set org.gnome.shell.keybindings switch-to-application-$i '[]'
done
```

https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/1828
