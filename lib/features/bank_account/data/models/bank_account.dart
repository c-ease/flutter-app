class BankAccount {
  final String id;
  final String name;
  final String type;
  final double balance;
  final double initBalance;
  final int createdAt;

  const BankAccount({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
    required this.initBalance,
    required this.createdAt,
  });

  BankAccount copyWith({
    String? id,
    String? name,
    String? type,
    double? balance,
    double? initBalance,
    int? createdAt,
  }) {
    return BankAccount(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      balance: balance ?? this.balance,
      initBalance: initBalance ?? this.initBalance,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}