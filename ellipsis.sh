#!/usr/bin/env bash
##############################################################################
# @file ellipsis.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

pkg.install(){
    :
}

##############################################################################

pkg.link() {
    # Link package into ~/.i3
    fs.link_file "$PKG_PATH"

# ! Temporary fix !
# This will/must move to the install hook in the future
    # compile the i3 config file from config.d
    "$PKG_PATH/compile.sh"
# ! Temporary fix !
}

##############################################################################

pkg.pull(){

    # Update dot-i3 repo
    git.pull

    # Update the config file
    ~/.i3/compile.sh
}

##############################################################################
