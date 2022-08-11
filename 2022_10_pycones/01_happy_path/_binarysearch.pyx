from typing import List

from libcpp.vector cimport vector

from constants import LOOPS, SEARCH_LIST

cdef extern from "src/binarysearch.hpp":
    int binsearch(vector[int]& l, int value, int low, int high)


cpdef native_binary_search(vector[int] l, int value, int low=0, int high=-1):
    return binsearch(l, value, low, high)


def cython_binary_search(l: List[int], value: int, low: int = 0, high: int = -1):
    if high >= low:
        mid = (high + low) // 2
        if l[mid] == value:
            return mid
        elif l[mid] > value:
            return cython_binary_search(l, value, low, mid - 1)
        else:
            return cython_binary_search(l, value, mid + 1, high)
    else:
        return -1

def benchmark_native_binary_search(loops=10):
    for i in range(0, loops):
        print(native_binary_search(SEARCH_LIST, 66666, 0, len(SEARCH_LIST)))

def benchmark_cython_binary_search(loops=10):
    for i in range(0, loops):
        cython_binary_search(SEARCH_LIST, 66666, 0, len(SEARCH_LIST))
