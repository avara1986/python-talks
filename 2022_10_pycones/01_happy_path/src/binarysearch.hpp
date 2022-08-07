#include <iostream>
#include <vector>

using namespace std;
int COUNTER = 0;

int binsearch(vector<int> my_list, int value, int low, int high) {
    COUNTER += 1;
    if (high >= low) {
        int mid = (low + high) / 2;
        //cout << COUNTER << " Search mid: " << mid << " \n";
        if (my_list[mid] == value) {
            return mid;
        } else if (my_list[mid] > value){
            //cout << COUNTER << " Search lower: " << mid - 1 << " \n";
            return binsearch(my_list, value, low, mid - 1);
        } else {
            // cout << COUNTER << " Search uppder: " << mid + 1 << " \n";
            return binsearch(my_list, value, mid + 1, high);
        }
    } else{
        return -1;
    }
}