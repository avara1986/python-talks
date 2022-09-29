import time

from constants import LOOPS

from binarysearch import benchmark_binary_search

if __name__ == "__main__":
    start = time.perf_counter()
    benchmark_binary_search(LOOPS)
    print(f"Completed Execution in {(time.perf_counter() - start) * 1000} miliseconds")
