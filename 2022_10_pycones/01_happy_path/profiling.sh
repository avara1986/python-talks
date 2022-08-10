python -m cProfile -o flamegraphs/binarysearch.prof binarysearch.py
python -m cProfile -o flamegraphs/binarysearch_native.prof binarysearch_native.py
snakeviz flamegraphs/binarysearch_native.prof

py-spy record --native -o flamegraphs/binarysearch_native.svg -- python binarysearch_native.py

# PERF
# sudo perf record -o flamegraphs/binarysearch.data --call-graph dwarf ./binarysearch.py
# sudo chmod 777 flamegraphs/binarysearch.data