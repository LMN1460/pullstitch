# pullstitch
Pulls .ts files from a CDN and stitches them together. Requires [ffmpeg](https://ffmpeg.org/download.html) to work; download the .exe and put it in the same folder as your script(s).

Literally just a one-off that I knocked together in a couple hours to get the clue 3 video for Legion22. Piplup, this is all your fault.

Might update it to be more flexible on the off chance that Legion encodes more/longer videos, but don't expect this to have any use other than the ARG; it makes assumptions based off Legion's naming scheme and will almost definitely break trying to hit other sites.

You can press enter without typing anything in the prompts if you just want `three.mp4`, but if you want to download any other files or pull from any other sources you'll need to go into your browser console and determine the naming scheme of the .ts files being served to your device. If you need more than 999 files, this might break. If they're zero padded already, this _will_ break. At a certain point you should probably just fork this yourself and mod it. I am not a Batch person. Sue me.

Also don't use `pullstitch_old`, it sucks and you'll need to input the name and how many files to pull or else you'll get half/none of a video. I really just defined `hostCDN` and then did absolutely nothing with it and hardcoded the CDN anyway huh


I do not have the braincells to document any of this prettily I am so sorry
