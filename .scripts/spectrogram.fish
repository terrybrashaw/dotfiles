#!/bin/fish

sox $argv[1] -n spectrogram -x 2560 -Y 1440 -o /tmp/spectrogram.png; feh --scale-down --force-aliasing --auto-zoom /tmp/spectrogram.png &
