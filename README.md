
Install
=======

```
git clone https://github.com/eakl/dotfiles.git && cd dotfiles/bin
```

Then run `dotfiles` to get an overview of what is possible

```
./dotfiles.sh
```

- `help` - Output the usage message
- `deploy` - Deploy dot files
- `install` - Apply install scripts
  - _brew_ - Install Brew packages
  - _atom_ - Install Atom packages
- `setup` - Apply setup scripts
  - _credentials_ - Copy credentials to their respective location
  - _git_ - Setup Git
  - _eslint_ - Give permissions to the ESLint deployer
  - _mongodb_ - Symlink MongoDB configuration file to the CONFIG folder
  - _pip_ - Configure PIP
- `macos` - Apply MacOS system preferences
  - _defaults_ - Apply defaults for MacOS (**Be Carreful**)
- `update` - Update packages and package managers (brew, npm)
- `clean` - Cleanup caches (brew, npm)

## /!\

1. Don't apply those settings blindly. They reflect my workflow and should be custom according to your need
2. The recommended execution order is from top down (you should `--deploy` the dotfiles before installing anything)
3. You also need to restart your Shell (**recommended**) or at least run `source activate ~/.bash_profile`


## Mac system settings

##### General
```bash
# Enable “focus follows mouse” for Terminal.app
# i.e. hover over a window and start typing in it without clicking first
defaults write com.apple.terminal FocusFollowsMouse -bool true

# Disable the annoying line marks '['
defaults write com.apple.Terminal ShowLineMarks -int 0
```

##### UI / UX
```bash

# Change computer name
Settings > General > About

# Disable the sound effects on boot
Settings > Sound > Play sound on startup

# Review iCloud
Settings > iCloud

# Disable Gatekeeper
sudo spctl --master-disable
Settings > Privacy & Security

# Disable hot corner
Settings > Desktop & Dock > Hot Corners
```

##### Trackpad, mouse, keyboard, Bluetooth accessories, and input
```bash
# Disable autocorrect as its's annoying when typing code
Settings > Keyboard > Text Input > Input Sources > Edit > "Disable All"

# Set a blazingly fast keyboard repeat rate
Settings > Keyboard > "Key repeat rate" and "Delay until repeat"
```


##### Finder
```bash
# Show icons hard drives, servers, removable media on the desktop
# Show folder on the side bar
# Show file extensions
Finder > Settings > "Change settings in all tabs"

Open folder /
Finder > View > Show view option
- Always open in column view
- Group by None
- Sort by Date Modified

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

## Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes:
# 'Flwv': Cover flow view
# 'Nlsv': List view
# 'icnv': Icon view
# 'clmv': Column view
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
chflags nohidden ~/Library

# Expand the following File Info panes:
# “General”, “Open with”, and “Name & Extension”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Name -bool true
```

##### Apps

```bash
# TextEdit
# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Photos
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
```

<span style="color:red">Note: Restart computer</span>

## Brew
https://brew.sh/


## Terminal

#### Color
https://github.com/ahmetsulek/flat-terminal

#### Size

Size of the Terminal window: `110x36`


### Oh-My-Zsh
https://ohmyz.sh/

#### Plugins
https://github.com/zsh-users/zsh-autosuggestions
https://github.com/zsh-users/zsh-syntax-highlighting

```bash
plugins=(
  git
  zsh-autosuggestions
  sh-syntax-highlighting
)
```

#### Alias
```
alias ll="ls -AFGlhp"
```

### Powerlevel10k
https://github.com/romkatv/powerlevel10k

