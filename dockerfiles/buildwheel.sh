#!/bin/bash
set -e -x

ARCH=`uname -p`
echo "arch=$ARCH"

for V in cp311-cp311 cp310-cp310 cp39-cp39 cp38-cp38 cp37-cp37m cp36-cp36m; do
    PYBIN=/opt/python/$V/bin
    rm -rf build src/cchardet/__pycache__ src/cchardet/*.cpp src/cchardet/*.pyc src/cchardet/*.so src/cchardet.egg-info src/tests/__pycache__ src/tests/*.pyc
    $PYBIN/pip install -r requirements-dev.txt
    $PYBIN/python setup.py bdist_wheel -p manylinux2014_${ARCH}
done
