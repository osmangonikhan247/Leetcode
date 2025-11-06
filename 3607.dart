import 'dart:collection';

class Solution {
  late List<int> parent;
  late List<int> rank;
  late List<SplayTreeSet<int>> groupOnline; // fast min + remove
  late List<bool> online;

  int find(int x) {
    if (parent[x] != x) parent[x] = find(parent[x]);
    return parent[x];
  }

  void union(int a, int b) {
    int pa = find(a);
    int pb = find(b);
    if (pa == pb) return;

    // Union by rank
    if (rank[pa] < rank[pb]) {
      parent[pa] = pb;
      groupOnline[pb].addAll(groupOnline[pa]);
      groupOnline[pa].clear();
    } else if (rank[pb] < rank[pa]) {
      parent[pb] = pa;
      groupOnline[pa].addAll(groupOnline[pb]);
      groupOnline[pb].clear();
    } else {
      parent[pb] = pa;
      rank[pa]++;
      groupOnline[pa].addAll(groupOnline[pb]);
      groupOnline[pb].clear();
    }
  }

  List<int> processQueries(
      int c, List<List<int>> connections, List<List<int>> queries) {
    parent = List.generate(c + 1, (i) => i);
    rank = List.filled(c + 1, 0);
    online = List.filled(c + 1, true);
    groupOnline = List.generate(c + 1, (_) => SplayTreeSet<int>());

    for (int i = 1; i <= c; i++) {
      groupOnline[i].add(i);
    }

    // Union all connections
    for (var conn in connections) {
      union(conn[0], conn[1]);
    }

    List<int> res = [];

    for (var q in queries) {
      int type = q[0];
      int x = q[1];
      int root = find(x);

      if (type == 1) {
        if (online[x]) {
          res.add(x);
        } else {
          if (groupOnline[root].isEmpty) {
            res.add(-1);
          } else {
            res.add(groupOnline[root].first);
          }
        }
      } else {
        if (online[x]) {
          online[x] = false;
          groupOnline[root].remove(x);
        }
      }
    }

    return res;
  }
}
