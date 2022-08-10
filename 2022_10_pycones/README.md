

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
| happy_path | 3.95 us       | 4.20 us: 1.06x slower | 88.4 ms: 22409.51x slower |
+------------+---------------+-----------------------+---------------------------+


```

```
make
cmake .
./binarysearch 
Elapsed time: 2.994[ms]
Elapsed time: 2.994.433[µs][microseconds]
Elapsed time: 2.994.433.429[ns][nanoseconds]
```

```
python binarysearch.py
Elapsed time: 0.5653389998769853[ms]
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
Elapsed time: 2[µs][microseconds] -> 0.002 miliseconds -> 2.827 nanoseconds
Elapsed time: 2.827[ns][nanoseconds]

```

```
python binarysearch.py
Elapsed time: 0.5653389998769853[ms] -> 0.565 miliseconds -> 565.338 nanoseconds
```

```
./run.sh
+------------+---------------+-----------------------+---------------------------+
| Benchmark  | binary_search | cython_binary_search  | native_binary_search      |
+============+===============+=======================+===========================+
| happy_path | 3.90 us       | 4.18 us: 1.07x slower | 57.0 ms: 14620.98x slower |
+------------+---------------+-----------------------+---------------------------+
```


```
./profiling.sh
```