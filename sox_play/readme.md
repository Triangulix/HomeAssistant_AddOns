# Source
This is a forked version of Dingedan's local_audio_player add-on
https://github.com/dingedan/Hassio_addons

# Compatibility
I have adapted his version to work with

- Home Assistant Core 2022.6.7
- Home Assistant Supervisor 2022.05.3
- Home Assistant OS 8.2.

Let's see how long it will take the HA developers to break this add-on. If it happens I will adapt it as quick as possible.


# Installation
1. Copy these files into the /addons/sox_play/ folder
2. In the UI, Go to configuration > Add-ons, Backups & Supervisor > Add-On Store
3. If the add-on is not listed under 'Local add-ons', hit 'reload' from the 'more' menu. 
4. Install

OR
1. Add my repository https://github.com/Triangulix/HomeAssistant_AddOns/ and install that way

# Usage
#### Play an MP3 file from the media folder
```yaml
      - service: hassio.addon_stdin
        data:        
          addon: local_sox_play
          input: "/media/08661_SFX.mp3 vol -10dB"
```
"vol -10dB" plays the file 10dB less loud, "vol 10dB" would increae the volume by 10dB.
"vol 0.5" ist another possible notation.

#### Play a remote hosted file
```yaml
      - service: hassio.addon_stdin
        data:        
          addon: local_sox_play
          input: "http://<server>/file.mp3"
```

.

### SoX contains a powerful synthesizer that can create all kinds of sounds in real time
```yaml
      - service: hassio.addon_stdin
        data:        
          addon: local_sox_play
          input: "-n synth 0.25 sin 500 vol 0.5"
```
Creates a beep sound

### Try these other parameter combinations as input value:

#### Synthesize "A minor seventh" chord with a pipe-organ sound
```
-n -c1 synth sin %-12 sin %-9 sin %-5 sin %-2 fade h 0.1 1 0.1
```

#### Synthetic chime sound
```
-n synth -j 3 sin %3 sin %-2 sin %-5 sin %-9 sin %-14 sin %-21 fade h .01 2 1.5 delay 1.3 1 .76 .54 .27 remix - fade h 0 2.7 2.5 norm -1
```

#### Guitar chord
```
-n synth pl G2 pl B2 pl D3 pl G3 pl D4 pl G4 delay 0 .05 .1 .15 .2 .25 remix - fade 0 4 .1 norm -1
```

#### Two different vibrating beeps
```
-n synth 1 sin 3200 sin 3500 sin 3700 sin 2900 sin 3900 tremolo 10 40
-n synth 1 sin 3200 sin 3500 sin 3700 sin 2900 sin 3900 tremolo 10 90
```

.

#### More information about what SoX Play can do:
https://manpages.debian.org/jessie/sox/play.1.en.html


