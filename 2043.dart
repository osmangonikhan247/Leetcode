class Bank {
  List<int> balance;
  int n;

  Bank(List<int> balance)
      : balance = balance,
        n = balance.length;

  bool transfer(int account1, int account2, int money) {
    if (!_isValid(account1) || !_isValid(account2)) return false;
    if (balance[account1 - 1] < money) return false;
    balance[account1 - 1] -= money;
    balance[account2 - 1] += money;
    return true;
  }

  bool deposit(int account, int money) {
    if (!_isValid(account)) return false;
    balance[account - 1] += money;
    return true;
  }

  bool withdraw(int account, int money) {
    if (!_isValid(account)) return false;
    if (balance[account - 1] < money) return false;
    balance[account - 1] -= money;
    return true;
  }

  bool _isValid(int account) => account >= 1 && account <= n;
}
