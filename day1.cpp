#include <bits/stdc++.h>
using namespace std;

#define endl '\n'

int main(int argc, char *argv[]) {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    string infile = (argc >= 2) ? argv[1] : "input/1.in";
    ifstream inputFile(infile);

    if (!inputFile) {
        cerr << "Could not open the file!" << endl;
        return 1;
    }

    string line;
    vector<int> l, r;
    unordered_map<int, int> mp;

    while (getline(inputFile, line)) {
        stringstream ss(line);
        int left, right;
        ss >> left >> right;
        l.push_back(left);
        r.push_back(right);
        mp[right]++;
    }

    inputFile.close();

    sort(l.begin(), l.end());
    sort(r.begin(), r.end());

    // Part 1
    int p1 = 0;
    for (int i = 0; i < l.size(); ++i) 
        p1 += abs(r[i] - l[i]);
    
    cout << "Ans 1: " << p1 << endl;

    // Part 2
    int p2 = 0;
    for (int left : l) p2 += left * mp[left];
    
    cout << "Ans 2: " << p2 << endl;

    return 0;
}
