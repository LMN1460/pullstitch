# pullstitch
Pulls .ts files from a CDN and stitches them together. Requires [ffmpeg](https://ffmpeg.org/download.html) to work; download the .exe and put it in the same folder as your script(s).

Literally just a one-off that I knocked together in a couple hours to get the clue 3 video for Legion22. Piplup, this is all your fault.

Might update it to be more flexible on the off chance that Legion encodes more/longer videos, but don't expect this to have any use other than the ARG; it makes assumptions based off Legion's naming scheme and will almost definitely break trying to hit other sites.

You can press enter through the prompts if you just want three.mp4, but if you want to download any other files or pull from any other sources you'll need to go into your browser console and determine the naming scheme of the .ts files being served to your device. If they're zero padded already, this will break. At a certain point you should probably just fork this yourself and mod it. I am not a Batch person. Sue me.
