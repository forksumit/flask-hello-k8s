#!/usr/bin/env bash
pip3 install pytest --quiet
pip3 install -r src/requirements.txt --quiet
pip3 install -r src/requirements-test.txt --quiet
python3 -m pytest src/tests/