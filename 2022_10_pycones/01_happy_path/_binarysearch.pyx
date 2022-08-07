from typing import List

import cython
from libcpp.vector cimport vector

cdef extern from "src/binarysearch.hpp":
    cython.int binsearch(vector[int] l, int value, int low, int high)


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