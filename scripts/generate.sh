#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
examples=$base/examples
tools=$base/tools
samples=$base/samples

mkdir -p $samples

num_threads=4
device=""

(cd $examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python3 generate.py --input "Some time ago, I used to believe in the history of our people. The history, we were told by our elders." \
        --data $data/new \
        --words 100 \
        --checkpoint $models/model_new.pt \
        --outf $samples/sample
)
