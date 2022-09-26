```bash
vim 01_happy_path/binarysearch.py
vim 01_happy_path/_binarysearch.pyx
vim 01_happy_path/src/binarysearch.cpp
```

```bash
cd 01_happy_path
python benchmark.py -f native_binary_search -i 10 -o results/native_binary_search_10.json
python benchmark.py -f cython_binary_search -i 10 -o results/cython_binary_search_10.json
python benchmark.py -f binary_search -i 10 -o results/binary_search_10.json

python -m pyperf compare_to --table results/binary_search_10.json results/cython_binary_search_10.json results/native_binary_search_10.json
```

```
./run.sh
+---------------+-----------------------+--------------------------+
| binary_search | cython_binary_search  | native_binary_search     |
+===============+=======================+==========================+
| 30.9 us       | 21.2 us: 1.46x faster | 42.5 ms: 1372.82x slower |
+---------------+-----------------------+--------------------------+
```

```
cd src/
cmake . && make && ./binarysearch 

./binarysearch 
Elapsed time: 2.994[ms]
Elapsed time: 2.994.433[µs][microseconds]
Elapsed time: 2.994.433.429[ns][nanoseconds]
```


export PY_LOOPS=10
py-spy record --native --format speedscope --rate 1000 -o flamegraphs/binarysearch_native.prof -- python binarysearch_native.py
export PY_LOOPS=10000
py-spy record --native --format speedscope --rate 1000 -o flamegraphs/binarysearch_cython.prof -- python binarysearch_cython.py
./profiling.sh
google-chrome flamegraphs/binarysearch_cython.svg
google-chrome flamegraphs/binarysearch_native.svg

Add 

```
- int binsearch(vector<int> my_list, int value, int low, int high) {
+ int binsearch(vector<int>& my_list, int value, int low, int high) {
```

```
cd src/
cmake . && make && ./binarysearch 
Elapsed time: 0[ms]
Elapsed time: 2[µs][microseconds] -> 0.002 miliseconds -> 2.827 nanoseconds
Elapsed time: 2.827[ns][nanoseconds]

```

```
./run.sh
+---------------+-----------------------+-------------------------+
| binary_search | cython_binary_search  | native_binary_search    |
+===============+=======================+=========================+
| 30.6 us       | 20.8 us: 1.47x faster | 24.2 ms: 792.40x slower |
+---------------+-----------------------+-------------------------+
```

```
./profiling.sh
```

python setup.py build_ext --inplace
python segmentation.py

gdb --args python segmentation.py