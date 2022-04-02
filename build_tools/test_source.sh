#!/bin/bash

set -e
set -x

cd ../../

python -m venv test_env
source test_env/bin/activate

sudo apt install libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-xinerama0 libxcb-xfixes0

export QT_QPA_PLATFORM=offscreen
python -m pip install test-rmc-discord/test-rmc-discord/dist/*.tar.gz
python -m pip install pytest cython ipython

cd test-rmc-discord/test-rmc-discord

pip install -e .
python -m pytest --pyargs disorder
