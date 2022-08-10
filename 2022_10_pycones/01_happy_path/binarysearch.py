from typing import List
import time

from constants import LOOPS, SEARCH_LIST

COUNTER = 0


def binary_search(l: List[int], value: int, low: int = 0, high: int = -1):
    if high >= low:
        mid = (high + low) // 2
        # print(f"{COUNTER} Search mid: {mid}")
        if l[mid] == value:
            return mid
        elif l[mid] > value:
            # print(f"{COUNTER} Search lower: {mid}")
            return binary_search(l, value, low, mid - 1)
        else:
            # print(f"{COUNTER} Search upper: {mid}")
            return binary_search(l, value, mid + 1, high)
    else:
        return -1


def benchmark_binary_search(loops=10):
    for i in range(0, loops):
        binary_search(SEARCH_LIST, 66666, 0, len(SEARCH_LIST))


if __name__ == "__main__":
    start = time.perf_counter()
    benchmark_binary_search()
    # print(f"FINISH {i}")
    print(f"Completed Execution in {(time.perf_counter() - start) * 1000} miliseconds")
