#include <bits/stdc++.h>
#include <ext/pb_ds/tree_policy.hpp>
#include <ext/pb_ds/assoc_container.hpp>
using namespace std;
using namespace __gnu_pbds;
#define BIT(x,i) (x&(1<<i))
#define SIZE(x) sizeof(x)/sizeof(x[0])
#define C2I(c) (c-'0')
#define ALL(c) (c).begin(),(c).end()
#define PI 3.1415926535897932384626
#define MP make_pair
#define PB push_back
#define FOREACH(i,t) for (typeof(t.begin()) i=t.begin(); i!=t.end(); i++)
#define F(i,L,R) for (int i = L; i < R; i++)
#define FE(i,L,R) for (int i = L; i <= R; i++)
#define FR(i,L,R) for (int i = L; i > R; i--)
#define FRE(i,L,R) for (int i = L; i >= R; i--)
#define REV(a) reverse((a).begin(), (a).end())
#define endl "\n"
typedef pair<int, int> pi;
typedef pair<long, long> pl;
typedef unsigned long long ull;
typedef long long ll;
typedef long double ld;
typedef vector<int> vi;
typedef vector<long> vl;
typedef vector<ll> vll;
typedef tree<int, null_type, less<int>, rb_tree_tag, tree_order_statistics_node_update> iseti;
typedef tree<long, null_type, less<long>, rb_tree_tag, tree_order_statistics_node_update> isetl;
typedef tree<ll, null_type, less<ll>, rb_tree_tag, tree_order_statistics_node_update> isetll;

template<typename T>
void fast(T &x)
{
	bool neg=false;
	int c;
	x = 0;
	c = getchar();
	while (c == ' ' || c == '\n')
		c = getchar();
	if(c=='-')
	{
		neg = true;
		c=getchar();
	}
	for(;(c>47 && c<58);c=getchar())
		x = (x<<1) + (x<<3) + c - 48;
	if(neg)
		x *= -1;
}


string* _arrRead(int n)
{
	string* _arr = new string[n];
	F(i, 0, n) cin >> _arr[i];
	return _arr;
}

template<typename A>
A* _arrRead(int n)
{
	A* _arr = new A[n];
	for (int i=0; i<n; i++) fast(_arr[i]);
	return _arr;
}

template<typename M>
M** _matRead(int n, int m)
{
	M** _mat = new M*[n];
	for (int i=0; i<n; i++) _mat[i] = new M[n];
	for (int i=0; i<n; i++) for (int j=0; j<m; j++) fast(_mat[i][j]);
}


void desync()
{
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
}


int main()
{
	desync();





	return 0;
}
