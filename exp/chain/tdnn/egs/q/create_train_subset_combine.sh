#!/bin/bash
cd /speech/batch2/sharan/NPTEL-Challenge/NPTEL_ASR_Challenge
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet3-chain-subset-egs --n=1000 ark:exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_subset_all.cegs ark:exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_combine.cegs 
EOF
) >exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_train_subset_combine.log
time1=`date +"%s"`
 ( nnet3-chain-subset-egs --n=1000 ark:exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_subset_all.cegs ark:exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_combine.cegs  ) 2>>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_train_subset_combine.log >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_train_subset_combine.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_train_subset_combine.log
echo '#' Finished at `date` with status $ret >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_train_subset_combine.log
[ $ret -eq 137 ] && exit 100;
touch exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/sync/done.32754
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/create_train_subset_combine.log    /speech/batch2/sharan/NPTEL-Challenge/NPTEL_ASR_Challenge/exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/create_train_subset_combine.sh >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/create_train_subset_combine.log 2>&1
