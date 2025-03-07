class Friend{
  late final String name;
  late final double owedToUser;

  Friend({
    required this.name,
    required this.owedToUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'owedToUser': owedToUser,
    };
  }

  factory Friend.fromMap(Map<String, dynamic> map) {
    return Friend(
      name: map['name'],
      owedToUser: (map['owedToUser'] as num).toDouble(), // Ensure proper type
    );
  }
}