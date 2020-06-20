./path.sh
sox data/speech.wav -c 1 -r 16000 data/speech_1.wav

steps/online/nnet3/prepare_online_decoding.sh --mfcc-config conf/mfcc_hires.conf data/lang_chain exp/nnet3/extractor exp/chain/tdnn exp/chain/tdnn_online

steps/online/nnet3/decode.sh --acwt 1.0 --post-decode-acwt 10.0 --nj 1 --cmd run.pl exp/chain/tree_a_sp/graph_tg data/test exp/chain/tdnn_online/decode

cat exp/chain/tdnn_online/decode/log/decode.1.log | grep -m 1 "text_1" | cut -d ' ' -f 2- | sed  's/!SIL//g' | sed 's/SIL//g' > decoded_text

#rm -rf exp/chain/tdnn_online/decode
#rm speech.wav speech1.wav
