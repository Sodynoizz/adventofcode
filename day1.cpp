#include <bits/stdc++.h>
using namespace std;

int main(int argc, char *argv[]) {
    string infile = (argc >= 2) ? argv[1] : "input/1.in";
    ifstream inputFile(infile);

    if (!inputFile) {
        cerr << "Could not open the file!" << endl;
        return 1;
    }

    string line;
    vector<int> LEFT, RIGHT;
    unordered_map<int, int> RC;

    while (getline(inputFile, line)) {
        stringstream ss(line);
        int l, r;
        ss >> l >> r;
        LEFT.push_back(l);
        RIGHT.push_back(r);
        RC[r]++;
    }

    inputFile.close();

    sort(LEFT.begin(), LEFT.end());
    sort(RIGHT.begin(), RIGHT.end());
    int p1 = 0;
    for (size_t i = 0; i < LEFT.size(); ++i) {
        p1 += abs(RIGHT[i] - LEFT[i]);
    }
    cout << p1 << endl;

    int p2 = 0;
    for (int l : LEFT) {
        p2 += l * RC[l];
    }
    cout << p2 << endl;

    return 0;
}
