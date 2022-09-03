#include <chrono>
#include "binarysearch.hpp"


int main(int argc, char *argv[]) {
    vector<int> arr;
    for (int i = 0; i < 1000000; i++) arr.push_back(i);
//    int size = 1000000;
//    int arr[1000000];
//    for(int i=0; i < size; i++){
//        arr[i] = i;
//    }

    std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
    for (int i = 0; i < 10; i++) {
        binsearch(arr, 66666, 0, arr.size());
//        binsearch(arr, 66666, 0, size);
    }
    std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
    cout << "Elapsed time: " << std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count() << "[ms]\n";
    cout << "Elapsed time: " << std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count() << "[µs]\n";
    cout << "Elapsed time: " << std::chrono::duration_cast<std::chrono::nanoseconds>(end - begin).count() << "[ns]\n";
}