# PERF
# sudo perf record -o flamegraphs/binarysearch.data --call-graph dwarf ./binarysearch.py
# sudo chmod 777 flamegraphs/binarysearch.data

# PY-SPY. Speedscope Format
#export PY_LOOPS=10
#py-spy record --native --format speedscope --rate 1000 -o flamegraphs/binarysearch_native.prof -- python binarysearch_native.py
#export PY_LOOPS=10000
#py-spy record --native --format speedscope --rate 1000 -o flamegraphs/binarysearch_cython.prof -- python binarysearch_cython.py
#docker build -t speedscope -f Dockerfile .
#docker run -p 8080:80 speedscope
#http://localhost:8080/

# PY-SPY
export PY_LOOPS=100
py-spy record --rate 1000 --native -o flamegraphs/binarysearch_native.svg -- python binarysearch_native.py
export PY_LOOPS=100000
py-spy record --rate 1000 --native -o flamegraphs/binarysearch_cython.svg -- python binarysearch_cython.py

