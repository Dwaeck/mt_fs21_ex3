#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# download a different interesting data set!

mkdir -p $data/new

mkdir -p $data/new/raw

wget textfiles.com/etext/AUTHORS/TWAIN/hfinn10.txt
mv hfinn10.txt $data/new/raw

# preprocess slightly

cat $data/new/raw/hfinn10.txt | python $base/scripts/preprocess_raw.py > $data/new/raw/hfinn10.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/new/raw/hfinn10.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 7000 --tokenize --lang "en" > \
    $data/new/raw/hfinn10.preprocessed.txt

# split into train, valid and test

head -n 700 $data/new/raw/hfinn10.preprocessed.txt > $data/new/valid.txt
head -n 700 $data/new/raw/hfinn10.preprocessed.txt | tail -n 700 > $data/new/test.txt
tail -n 7000 $data/new/raw/hfinn10.preprocessed.txt > $data/new/train.txt
