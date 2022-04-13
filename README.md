### Dotfiles for phyOS
(Screenshots)
<img src="https://github.com/PhyTech-R0/dwm-phyOS/blob/screenshots/screenshots/s4.png">
<img src="https://github.com/PhyTech-R0/dwm-phyOS/blob/screenshots/screenshots/s5.png">
phyOS arch iso users doesn't need to do anything, all of them will be preinstalled in their system.
If you are using dwm & dwmblocks from phyOS or installed them seperately from repositories in this account, please extract **all of these dotfiles** to your home directory. \
All of the scripts and most of the shortcuts which leads to these scripts are located in this repo.
#### Bookmark support (bm script is in ~/.local/bin/scripts)
To add a bookmark:

	bm add 'source' 'aliasname'

To remove bookmark:

	bm remove 'aliasname'
To cd to alias:

	jmp 'aliasname'

#### Status bar
- All scripts are in ~/.local/bin/statusbar
#### General scripts
- ~/.local/bin/scripts
#### All lua vim configurations can be found in classical nvim folder, if you are looking for vim only.
- ~/.config/nvim
