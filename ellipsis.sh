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

    ellipsis-compiler "$PKG_PATH/config.i3" "$PKG_PATH/config"
}

##############################################################################

pkg.link() {
    # Link package into ~/.i3
    fs.link_file "$PKG_PATH"
}

##############################################################################

pkg.pull(){
    # Update dot-i3 repo
    git.pull

    # Update the config file
    ellipsis-compiler "$PKG_PATH/config.i3" "$PKG_PATH/config"
}

##############################################################################
