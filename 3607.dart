class Solution {
  List<int> parent = [];
  List<int> minOnline = [];
  List<bool> online = [];

  int find(int x) {
    if (parent[x] != x) parent[x] = find(parent[x]);
    return parent[x];
  }

  void union(int a, int b) {
    int pa = find(a);
    int pb = find(b);
    if (pa == pb) return;
    if (pa < pb) {
      parent[pb] = pa;
      minOnline[pa] = minOnline[pa] < minOnline[pb] ? minOnline[pa] : minOnline[pb];
    } else {
      parent[pa] = pb;
      minOnline[pb] = minOnline[pa] < minOnline[pb] ? minOnline[pa] : minOnline[pb];
    }
  }

  List<int> processQueries(int c, List<List<int>> connections, List<List<int>> queries) {
    parent = List.generate(c + 1, (i) => i);
    minOnline = List.generate(c + 1, (i) => i);
    online = List.generate(c + 1, (i) => true);

    for (var conn in connections) {
      union(conn[0], conn[1]);
    }

    List<int> result = [];

    for (var q in queries) {
      int type = q[0];
      int x = q[1];

      if (type == 1) {
        if (online[x]) {
          result.add(x);
        } else {
          int root = find(x);
          int candidate = -1;
          for (int i = 1; i <= c; i++) {
            if (find(i) == root && online[i]) {
              candidate = i;
              break;
            }
          }
          result.add(candidate);
          if (candidate != -1) minOnline[root] = candidate;
        }
      } else {
        online[x] = false;
      }
    }

    return result;
  }
}
