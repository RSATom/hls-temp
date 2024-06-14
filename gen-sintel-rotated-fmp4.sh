OUT_SEGMENT_TYPE=fmp4
IN_FILE_NAME=sintel-rotated
OUT_FILE_NAME=$IN_FILE_NAME-$OUT_SEGMENT_TYPE

rm -f $OUT_FILE_NAME-*.m4s $OUT_FILE_NAME-init.mp4 $OUT_FILE_NAME.m3u8

#ffmpeg -y -i $IN_FILE_NAME.mp4 -hls_segment_type $OUT_SEGMENT_TYPE -hls_time 5 \
#	-force_key_frames "expr:gte(t,n_forced*2)" -sc_threshold 0 -s 1280x720 -c:v libx264 -b:v 1500k -c:a copy \
#	-start_number 0 -hls_list_size 0 \
#	-hls_fmp4_init_filename $OUT_FILE_NAME-init.mp4 -hls_segment_filename $OUT_FILE_NAME-%d.m4s -f hls $OUT_FILE_NAME.m3u8

ffmpeg -y -i $IN_FILE_NAME.mp4 -hls_segment_type $OUT_SEGMENT_TYPE -hls_time 5 \
	-codec: copy \
	-start_number 0 -hls_list_size 0 \
	-hls_fmp4_init_filename $OUT_FILE_NAME-init.mp4 -hls_segment_filename $OUT_FILE_NAME-%d.m4s -f hls $OUT_FILE_NAME.m3u8
