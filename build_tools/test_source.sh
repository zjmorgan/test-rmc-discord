#!/bin/bash

set -e
set -x

cd ../../

python -m venv test_env
source test_env/bin/activate

python -m pip install test-rmc-discord/test-rmc-discord/dist/*.tar.gz
python -m pip install pytest

# Run the tests on the installed source distribution
mkdir tmp_for_test
cd tmp_for_test

python -m pytest --pyargs disorder
