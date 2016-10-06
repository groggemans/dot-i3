#!/usr/bin/env bash
##############################################################################
# @file ellipsis.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

pkg.install(){
    # Install Ellipsis-Compiler if not already installed
    if ! utils.cmd_exists ellipsis-compiler; then
        ellipsis install ellipsis-compiler
    fi

    ellipsis-compiler "$PKG_PATH/config.econf" "$PKG_PATH/config"
}

##############################################################################

pkg.link() {
    # Link package into ~/.i3(blocks)
    mkdir -p "$ELLIPSIS_HOME/.config"
    fs.link_file "$PKG_PATH" "$ELLIPSIS_HOME/.config/i3"
    fs.link_file "$PKG_PATH/i3blocks" "$ELLIPSIS_HOME/.config/i3blocks"
}

##############################################################################

pkg.pull(){
    # Update dot-i3 repo
    git.pull

    # Update the config file
    ellipsis-compiler "$PKG_PATH/config.econf" "$PKG_PATH/config"
}

##############################################################################

# Unlink package
pkg.unlink() {
    # Remove config dir
    rm "$ELLIPSIS_HOME/.config/i3"
    rm "$ELLIPSIS_HOME/.config/i3blocks"

    # Remove all links in the home folder
    hooks.unlink
}

##############################################################################
