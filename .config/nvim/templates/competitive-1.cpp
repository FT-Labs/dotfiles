#include <iostream>
#include <bits/stdc++.h>

#define endl '\n'
#define SIZE(arr) sizeof(arr)/sizeof(arr[0])
using namespace std;

template<typename T>
T fast()
{
	bool minus= false;
	T result = 0;
	char ch;
	ch = getchar();

	while (true) {
		if (ch == '-') break;
		if (ch >= '0' && ch <= '9') break;
		ch = getchar();
	}
	if (ch == '-') minus = true; else result = ch - '0';
	while (true) {
		ch = getchar();
		if (ch < '0' || ch > '9') break;
		result = result*10 + (ch - '0');
	}
	if (minus) return -result; else return result;
}


int main()
{
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);


	return 0;
}
