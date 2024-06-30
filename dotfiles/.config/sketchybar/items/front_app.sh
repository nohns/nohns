#!/bin/bash

sketchybar --add item front_app left \
           --set front_app       background.color="$BG_COLOR" \
                                 icon.color="$FRONT_APP_COLOR" \
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 label.color="$FRONT_APP_COLOR" \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
