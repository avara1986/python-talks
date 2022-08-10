#include <chrono>
#include "binarysearch.hpp"

int main(int argc, char *argv[]) {
    vector<int> arr;
    for (int i=0; i<1000000; i++) arr.push_back(i);

    std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
    for (int i=0; i<10; i++){
        binsearch(arr, 66666, 0, arr.size());
        // cout << "FINISH " << i << "\n";
        //    std::cout << "Result: " << binsearch(arr, 66666, 0, arr.size()) << '\n';
    }
    std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
    cout << "Elapsed time: " << std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count() << "[ms]\n";
    cout << "Elapsed time: " << std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count() << "[µs]\n";
    cout << "Elapsed time: " << std::chrono::duration_cast<std::chrono::nanoseconds> (end - begin).count() << "[ns]\n";
}