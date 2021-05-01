#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=3
device=""

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/new \
        --epochs 40 \
        --emsize 200 --nhid 200 --dropout 0 --tied --log-interval 124\
        --save $models/model_new.pt
)

echo "time taken:"
echo "$SECONDS seconds"
