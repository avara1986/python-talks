from typing import List

from constants import SEARCH_LIST


def binary_search(l: List[int], value: int, low: int = 0, high: int = -1):
    if high >= low:
        mid = (high + low) // 2
        if l[mid] == value:
            return mid
        elif l[mid] > value:
            return binary_search(l, value, low, mid - 1)
        else:
            return binary_search(l, value, mid + 1, high)
    else:
        return -1


def benchmark_binary_search(loops: int = 10) -> None:
    len_search_list = len(SEARCH_LIST)
    for i in range(0, loops):
        binary_search(SEARCH_LIST, 66666, 0, len_search_list)
