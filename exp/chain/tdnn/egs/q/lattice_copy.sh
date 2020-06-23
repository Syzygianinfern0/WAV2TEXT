#!/bin/bash
cd /speech/batch2/sharan/NPTEL-Challenge/NPTEL_ASR_Challenge
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
lattice-copy "--include=cat exp_hindi_model/chain40hour/tdnn1g_sp/egs/valid_uttlist exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_subset_uttlist |" --ignore-missing "ark:gunzip -c exp_hindi_model/chain40hour/tri3_2000_32000_train_sp_lats/lat.$SGE_TASK_ID.gz |" ark,scp:exp_hindi_model/chain40hour/tdnn1g_sp/egs/lat_special.$SGE_TASK_ID.ark,exp_hindi_model/chain40hour/tdnn1g_sp/egs/lat_special.$SGE_TASK_ID.scp 
EOF
) >exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/lattice_copy.$SGE_TASK_ID.log
 ( lattice-copy "--include=cat exp_hindi_model/chain40hour/tdnn1g_sp/egs/valid_uttlist exp_hindi_model/chain40hour/tdnn1g_sp/egs/train_subset_uttlist |" --ignore-missing "ark:gunzip -c exp_hindi_model/chain40hour/tri3_2000_32000_train_sp_lats/lat.$SGE_TASK_ID.gz |" ark,scp:exp_hindi_model/chain40hour/tdnn1g_sp/egs/lat_special.$SGE_TASK_ID.ark,exp_hindi_model/chain40hour/tdnn1g_sp/egs/lat_special.$SGE_TASK_ID.scp  ) 2>>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/lattice_copy.$SGE_TASK_ID.log >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/lattice_copy.$SGE_TASK_ID.log
ret=$?
echo '#' Finished at `date` with status $ret >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/log/lattice_copy.$SGE_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/done.4365.$SGE_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -q cpu.q -l h="h1|h2|d3|d4|d5|d6|d7" -S /bin/bash -v PATH -cwd -j y -o exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/lattice_copy.log --max-jobs-run 6  -t 1:30 /speech/batch2/sharan/NPTEL-Challenge/NPTEL_ASR_Challenge/exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/lattice_copy.sh >>exp_hindi_model/chain40hour/tdnn1g_sp/egs/q/lattice_copy.log 2>&1
