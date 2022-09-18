rm results/*
rm _binarysearch.cpp
rm _binarysearch.cpython-310-x86_64-linux-gnu.so
python setup.py build_ext --inplace
python benchmark.py -f native_binary_search  -i 10 -o results/native_binary_search.json
python benchmark.py -f cython_binary_search  -i 10 -o results/cython_binary_search.json
python benchmark.py -f binary_search  -i 10 -o results/binary_search.json

python -m pyperf compare_to --table results/binary_search.json results/cython_binary_search.json results/native_binary_search.json