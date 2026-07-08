class BankAccount {
  final String id;
  final String name;
  final String type;
  final double balance;
  final double initBalance;

  const BankAccount({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
    required this.initBalance,
  });

  BankAccount copyWith({
    String? id,
    String? name,
    String? type,
    double? balance,
    double? initBalance,
  }) {
    return BankAccount(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      balance: balance ?? this.balance,
      initBalance: initBalance ?? this.initBalance,
    );
  }
}