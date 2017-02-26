##############################################################################
# @file ellipsis.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

# Minimal ellipsis version
ELLIPSIS_VERSION_DEP='1.9.4'

# Package dependencies (informational/not used!)
ELLIPSIS_PKG_DEPS='ellipsis/ellipsis-compiler'

##############################################################################

pkg.install(){
    # Create wallpapers directory
    mkdir -p "$PKG_PATH/wallpaper"

    # Install Ellipsis-Compiler if not already installed
    ellipsis.list_packages | grep "$ELLIPSIS_PACKAGES/ellipsis-compiler" 2>&1 > /dev/null
    if [ $? -ne 0 ]; then
        ellipsis install ellipsis-compiler
    fi

    # Compile config
    ellipsis-compiler "$PKG_PATH/config.econf" "$PKG_PATH/config"

    # Install packages with ansible (if available)
    if utils.cmd_exists 'ansible-playbook' &&
        utils.prompt 'Install i3 packages? (y/n) :' 'no'; then
        (cd ansible; ansible-playbook -K install.yml)
    fi
}

##############################################################################

pkg.link() {
    # Link package into ~/.i3(blocks)
    mkdir -p "$ELLIPSIS_HOME/.config"
    fs.link_file "$PKG_PATH" "$ELLIPSIS_HOME/.config/i3"
    fs.link_file "$PKG_PATH/i3blocks" "$ELLIPSIS_HOME/.config/i3blocks"
    fs.link_file "$PKG_PATH/wallpaper" "$ELLIPSIS_HOME/.config/wallpaper"

    # Auto link active wallpapers
    if [ -d ~/Pictures/wallpapers/active ]; then
        fs.link_file ~/Pictures/wallpapers/active "$ELLIPSIS_HOME/.config/wallpaper/Pwall_active"
    fi
    if [ -d ~/pictures/wallpapers/active ]; then
        fs.link_file ~/pictures/wallpapers/active "$ELLIPSIS_HOME/.config/wallpaper/pwall_active"
    fi
    if [ -d ~/Images/wallpapers/active ]; then
        fs.link_file ~/Images/wallpapers/active "$ELLIPSIS_HOME/.config/wallpaper/Iwall_active"
    fi
    if [ -d ~/images/wallpapers/active ]; then
        fs.link_file ~/images/wallpapers/active "$ELLIPSIS_HOME/.config/wallpaper/iwall_active"
    fi
}

##############################################################################

pkg.pull() {
    # Use improved update strategy
    git remote update 2>&1 > /dev/null
    if git.is_behind; then
        pkg.unlink
        git.pull
        pkg.link

        # Update the config file
        ellipsis-compiler "$PKG_PATH/config.econf" "$PKG_PATH/config"
    fi
}

##############################################################################

pkg.unlink() {
    # Remove config dir
    rm "$ELLIPSIS_HOME/.config/i3"
    rm "$ELLIPSIS_HOME/.config/i3blocks"
    rm "$ELLIPSIS_HOME/.config/wallpaper"

    # Remove all links in the home folder
    hooks.unlink
}

##############################################################################

pkg.uninstall() {
    # Uninstall packages with ansible (if available)
    if utils.cmd_exists 'ansible-playbook' &&
        utils.prompt 'Uninstall i3 packages? (y/n) :' 'no'; then
        (cd ansible; ansible-playbook -K uninstall.yml)
    fi
}

##############################################################################
