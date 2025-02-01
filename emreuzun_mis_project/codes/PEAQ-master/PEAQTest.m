clear; clc; 

ref = "sample.wav"           % original file
test = "sample_128k_ogg.wav" % You can observe the ODG value for different bit rate values by replacing 128k with 192k, 256k, or 96k.
                             %for different codecs by replacing ogg with mp3, m4a, or opus
                             

[odg, movb] = PQevalAudio_fn(ref, test)