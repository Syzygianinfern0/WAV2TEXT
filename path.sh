#export KALDI_ROOT=/speech1/software/kaldi_DEC2018
export KALDI_ROOT=/opt/kaldi
export PATH=$PWD/utils/:$KALDI_ROOT/tools/openfst/bin:$PWD:$PATH
[ ! -f $KALDI_ROOT/tools/config/common_path.sh ] && echo >&2 "The standard file $KALDI_ROOT/tools/config/common_path.sh is not present -> Exit!" && exit 1
. $KALDI_ROOT/tools/config/common_path.sh

export LC_ALL=C
export LD_LIBRARY_PATH=/usr/lib32/atlas:/usr/local/cuda/lib64:$LD_LIBRARY_PATH
