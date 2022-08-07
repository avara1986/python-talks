

```bash
cd 01_happy_path
python benchmark.py -f native_binary_search -o results/native_binary_search.json
python benchmark.py -f cython_binary_search -o results/cython_binary_search.json
python benchmark.py -f binary_search -o results/binary_search.json

python -m pyperf compare_to --table results/binary_search.json results/cython_binary_search.json results/native_binary_search.json
```

```
./run.sh
+------------+---------------+-----------------------+---------------------------+
| Benchmark  | binary_search | cython_binary_search  | native_binary_search      |
+============+===============+=======================+===========================+
| happy_path | 5.20 us       | 4.17 us: 1.25x faster | 86.7 ms: 16681.07x slower |
+------------+---------------+-----------------------+---------------------------+

```

```
make
cmake .
./binarysearch 
Elapsed time: 2994[ms]
Elapsed time: 2994433[µs][microseconds]
Elapsed time: 2994433429[ns][nanoseconds]
```

```
python binarysearch.py
Completed Execution in 0.5653389998769853[ms]
```

Add 

```
- int binsearch(vector<int> my_list, int value, int low, int high) {
+ int binsearch(vector<int>& my_list, int value, int low, int high) {
```

```
make
cmake .
./binarysearch 
Elapsed time: 0[ms]
Elapsed time: 2[µs][microseconds]  -> 0.002 miliseconds
Elapsed time: 2827[ns][nanoseconds]

```

```
python binarysearch.py
Completed Execution in 0.5653389998769853[ms]
```

```
./run.sh
.....................
happy_path: Mean +- std dev: 79.6 ms +- 3.9 ms
.....................
happy_path: Mean +- std dev: 4.08 us +- 0.04 us
.....................
happy_path: Mean +- std dev: 3.86 us +- 0.04 us
+------------+---------------+-----------------------+---------------------------+
| Benchmark  | binary_search | cython_binary_search  | native_binary_search      |
+============+===============+=======================+===========================+
| happy_path | 3.86 us       | 4.08 us: 1.06x slower | 79.6 ms: 20584.44x slower |
+------------+---------------+-----------------------+---------------------------+
```

