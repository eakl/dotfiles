
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

## Additional setup

- Size of the Terminal window: `110x36`
- Bash Theme: [FlatUI](https://github.com/ahmetsulek/flat-terminal)
- Bash Prompt: `Username @ Hostname (short) : directory $ `
  - [Bashrc Generator](http://bashrcgenerator.com/)
