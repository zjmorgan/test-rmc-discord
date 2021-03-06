#!/bin/bash

set -e
set -x

cd ../../

python -m venv build_env
source build_env/bin/activate

python -m pip install numpy scipy cython
python -m pip install twine

cd test-rmc-discord/test-rmc-discord
python setup.py sdist

# Check whether the source distribution will render correctly
twine check dist/*.tar.gz
