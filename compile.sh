#!/usr/bin/env bash
##############################################################################
# @file compile.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

# Config
grep -v '^ *\(#.*\|\)$' < $HOME/.i3/config.d/*.i3 > $HOME/.i3/config

# Smart config
$HOME/.i3/config.d/*.sh >> $HOME/.i3/config

##############################################################################

# Local config
if [ -d ~/.local/i3/config.d ]; then
    # Local config
    grep -v '^ *\(#.*\|\)$' < $HOME/.i3/config.d/*.i3 >> $HOME/.i3/config

    # Local smart config
    $HOME/.i3/config.d/*.sh >> $HOME/.i3/config
fi

##############################################################################
