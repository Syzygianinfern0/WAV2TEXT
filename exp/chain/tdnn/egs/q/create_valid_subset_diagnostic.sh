#!/bin/bash
cd /speech/batch2/sharan/NPTEL-Challenge/NPTEL_ASR_Challenge
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet3-chain-subset-egs --n=400 ark:exp_hindi_model/chain40hour/tdnn1g_sp/egs/valid_all.cegs ark:exp_hindi_model/chain40hour/tdnn1g_sp/egs/valid_diagnostic.cegs 
EOF
) >exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_valid_subset_diagnostic.log
time1=`date +"%s"`
 ( nnet3-chain-subset-egs --n=400 ark:exp_hindi_model/chain40hour/tdnn1g_sp/egs/valid_all.cegs ark:exp_hindi_model/chain40hour/tdnn1g_sp/egs/valid_diagnostic.cegs  ) 2>>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_valid_subset_diagnostic.log >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_valid_subset_diagnostic.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_valid_subset_diagnostic.log
echo '#' Finished at `date` with status $ret >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/create_valid_subset_diagnostic.log
[ $ret -eq 137 ] && exit 100;
touch exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/sync/done.32720
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/create_valid_subset_diagnostic.log    /speech/batch2/sharan/NPTEL-Challenge/NPTEL_ASR_Challenge/exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/create_valid_subset_diagnostic.sh >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/create_valid_subset_diagnostic.log 2>&1
