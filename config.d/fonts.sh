#!/usr/bin/env bash
##############################################################################
# @file fonts
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

if [ -d ~/.fonts ]; then
    echo 'font pango:Ubuntu Mono derivative Powerline Regular 10'
else
    echo 'font pango:DejaVu Sans Mono 8'
fi

##############################################################################
