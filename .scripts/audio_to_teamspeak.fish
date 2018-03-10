#!/bin/fish

function new_null_sink
    pacmd load-module module-null-sink sink_name=$argv[1] sink_properties=device.description="$argv[1]";
end

function new_loopback
    pacmd load-module module-loopback source=$argv[1] sink=$argv[2]
end

set MICROPHONE "alsa_input.usb-Focusrite_Scarlett_Solo_USB-00.iec958-stereo"
set SPEAKERS "alsa_output.usb-Focusrite_Scarlett_Solo_USB-00.iec958-stereo"

new_null_sink "PreTeamspeakSink";
new_null_sink "ApplicationSink";

new_loopback $MICROPHONE "PreTeamspeakSink";
new_loopback "ApplicationSink.monitor" "PreTeamspeakSink";
new_loopback "ApplicationSink.monitor" $SPEAKERS;
