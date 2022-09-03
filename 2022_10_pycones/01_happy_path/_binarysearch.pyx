from typing import List

from libcpp.vector cimport vector
# from cython cimport view
from constants import SEARCH_LIST

cdef extern from "src/binarysearch.hpp":
    # int binsearch(int* l, int value, int low, int high)
    int binsearch(vector[int]& l, int value, int low, int high)


#cdef int native_binary_search(int* l, int value, int low=0, int high=-1):
cpdef native_binary_search(vector[int] l, int value, int low=0, int high=-1):
    return binsearch(l, value, low, high)


cdef int cython_binary_search(l: List[int], value: int, low: int = 0, high: int = -1):
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


# cpdef benchmark_native_binary_search_array(loops: int = 10):
#     cdef int size = 100000
#     cdef int[:] my_slice = view.array(shape=(size,), itemsize=sizeof(int), format="i")
#     for i in range(size):
#         my_slice[i] = i
#
#     for i in range(0, loops):
#         native_binary_search(&my_slice[0], 66666, 0, size)

def benchmark_cython_binary_search(loops: int = 10) -> None:
    cdef int len_search_list = len(SEARCH_LIST)
    for i in range(0, loops):
        cython_binary_search(SEARCH_LIST, 66666, 0, len_search_list)
