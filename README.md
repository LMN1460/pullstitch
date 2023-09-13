# pullstitch
Pulls .ts files from a CDN and stitches them together. Requires [ffmpeg](https://ffmpeg.org/download.html) to work; download the .exe and put it in the same folder as your script(s).

Literally just a one-off that I knocked together in a couple hours to get the clue 3 video for Legion22. Piplup, this is all your fault.

**To run:** Run `pullstitch.bat`. Press enter without typing anything in the `Host CDN url` field if you just want to pull from cdn.legion22.world; otherwise enter the CDN url in that first prompt. Enter the code word you used to access the video in the second `Common name` field, and sit back and wait. Your output will appear in a folder for you to do as you see fit.

**Alternative:** If the download finishes and you only get part of the video then try `pullstitch_old.bat`. It has more reliability, but you'll have to know how many .ts files you'll want to get instead of letting the program determine automatically. Go into your browser's Inspect console, fast forward the video to the end, then see what the number for the last .ts file is (it's under the Network tab in Chrome and Firefox). It may benefit you to overshoot; you'll just get a few unopenable files that ffmpeg will know to ignore.

Be aware that this was thrown together without much thought for edge cases. I might update it to be more flexible if Legion encodes an hour-long stream or something, but don't expect this to have any use other than the ARG. _Theoretically_ it can work on other sites, but it makes assumptions based off Legion's naming scheme and will almost definitely break trying to pull from others. If you need more than 999 files, this might break. If they're zero padded already, this _will_ break. At a certain point you should probably just fork this yourself and mod it. I am not a Batch person. Sue me.

I do not have the spoons to format any of this prettily right now I am so sorry. Create an issue if something's bugging you and I'll fix it
