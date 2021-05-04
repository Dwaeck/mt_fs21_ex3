# Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/Dwaeck/mt_fs21_ex3
    cd mt_fs21_ex3

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:
For this task, I've chosen a text of Charles Dickens. The link in download_data.sh has been changed.

    ./scripts/download_data.sh
    
Train a model:
This model will use the text of Charles Dickens to train a new model called model_new.pt. An additional folder for the texts will be created, called new. Dropout is set to 0.5 in this script, but I have trained the model five times for five different dropout settings (0, 0.25, 0.5, 0.75, 1).

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from the trained model with:
The script now works with model_new.pt rather than model.pt. It also contains an (--input) sample command, that, within generate.sh, is given to generate.py. This script also works with another generate.py, not from pytorch. It is required that the examples folder, containing the script generate.py, is a folder of mt_fs21_ex3.

    ./scripts/generate.sh
