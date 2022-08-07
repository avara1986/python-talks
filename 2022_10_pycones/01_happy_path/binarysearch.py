from typing import List
import time

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


if __name__ == "__main__":
    search_list = [i for i in range(1000000)]
    start = time.perf_counter()
    for i in range(0, 100):
        binary_search(search_list, 66666, 0, len(search_list))
        # print(f"FINISH {i}")
    print(f"Completed Execution in {(time.perf_counter() - start)*1000} miliseconds")