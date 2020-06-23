#!/bin/bash
cd /speech/batch2/sharan/NPTEL-Challenge/NPTEL_ASR_Challenge
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
utils/filter_scp.pl exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_subset_uttlist exp_hindi_model/chain40hour/tdnn1g_sp/egs/lat_special.scp | lattice-align-phones --replace-output-symbols=true exp_hindi_model/chain40hour/tri3_2000_32000_train_sp_lats/final.mdl scp:- ark:- | chain-get-supervision --lattice-input=true --frame-subsampling-factor=3 --right-tolerance=5 --left-tolerance=5 exp_hindi_model/chain40hour/tdnn1g_sp/tree exp_hindi_model/chain40hour/tdnn1g_sp/0.trans_mdl ark:- ark:- | nnet3-chain-get-egs --online-ivectors=scp:exp_hindi_model/nnet340hour/ivectors_train_sp_hires/ivector_online.scp --online-ivector-period=10 --srand=0 --left-context=29 --right-context=29 --num-frames=140,100,160 --frame-subsampling-factor=3 --compress=true --normalization-fst-scale=1.0 exp_hindi_model/chain40hour/tdnn1g_sp/normalization.fst "ark,s,cs:utils/filter_scp.pl exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_subset_uttlist data_hindi/train_sp_hires/feats.scp | apply-cmvn --norm-means=false --norm-vars=false --utt2spk=ark:data_hindi/train_sp_hires/utt2spk scp:data_hindi/train_sp_hires/cmvn.scp scp:- ark:- |" ark,s,cs:- ark:exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_subset_all.cegs 
EOF
) >exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_train_subset.log
time1=`date +"%s"`
 ( utils/filter_scp.pl exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_subset_uttlist exp_hindi_model/chain40hour/tdnn1g_sp/egs/lat_special.scp | lattice-align-phones --replace-output-symbols=true exp_hindi_model/chain40hour/tri3_2000_32000_train_sp_lats/final.mdl scp:- ark:- | chain-get-supervision --lattice-input=true --frame-subsampling-factor=3 --right-tolerance=5 --left-tolerance=5 exp_hindi_model/chain40hour/tdnn1g_sp/tree exp_hindi_model/chain40hour/tdnn1g_sp/0.trans_mdl ark:- ark:- | nnet3-chain-get-egs --online-ivectors=scp:exp_hindi_model/nnet340hour/ivectors_train_sp_hires/ivector_online.scp --online-ivector-period=10 --srand=0 --left-context=29 --right-context=29 --num-frames=140,100,160 --frame-subsampling-factor=3 --compress=true --normalization-fst-scale=1.0 exp_hindi_model/chain40hour/tdnn1g_sp/normalization.fst "ark,s,cs:utils/filter_scp.pl exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_subset_uttlist data_hindi/train_sp_hires/feats.scp | apply-cmvn --norm-means=false --norm-vars=false --utt2spk=ark:data_hindi/train_sp_hires/utt2spk scp:data_hindi/train_sp_hires/cmvn.scp scp:- ark:- |" ark,s,cs:- ark:exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_subset_all.cegs  ) 2>>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_train_subset.log >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_train_subset.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_train_subset.log
echo '#' Finished at `date` with status $ret >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_train_subset.log
[ $ret -eq 137 ] && exit 100;
touch exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/sync/done.32674
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/create_train_subset.log    /speech/batch2/sharan/NPTEL-Challenge/NPTEL_ASR_Challenge/exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/create_train_subset.sh >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/create_train_subset.log 2>&1
