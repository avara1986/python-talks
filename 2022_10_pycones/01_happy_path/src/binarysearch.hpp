#include <iostream>
#include <vector>

using namespace std;
int COUNTER = 0;

int binsearch(vector<int> my_list, int value, int low, int high) {
    COUNTER += 1;
    if (high >= low) {
        int mid = (low + high) / 2;
        if (my_list[mid] == value) {
            return mid;
        } else if (my_list[mid] > value){
            return binsearch(my_list, value, low, mid - 1);
        } else {
            return binsearch(my_list, value, mid + 1, high);
        }
    } else{
        return -1;
    }
}