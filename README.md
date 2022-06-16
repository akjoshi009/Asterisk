# Asterisk Monitor stereo-example Mono(2 files) to Stereo (Centos 7)
The following example will show how the Monitor application can be used to record phone conversations in stereo, 
ie. each party of the phone call represents one channel of a stereo recording. The recording will be convert to wave.
This example requires the support of options within the Monitor application, version 1.0.7 and above is ok, but also earlier versions might work.

Requirments:
ffmpeg <br>
asterisk<br>

Just install ffmpeg use following link:<br>
https://linuxize.com/post/how-to-install-ffmpeg-on-centos-7/<br><br>

update extension.conf with following code 

exten => 2586,n,Answer() <br>
exten => 2586,n,Set(MONITOR_EXEC_ARGS=filepath/monotstr.sh  file-in.wav  file-out.wav  output.wav)<br>




