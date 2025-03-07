import 'package:expense_splitting_app/models/friend.dart';

class Group{
  late final String groupName;
  late final double totalExpense;
  late final List<Friend> members;

  Group({
    required this.groupName,
    required this.totalExpense,
    required this.members
  });

  Map<String, dynamic> toMap() {
    return {
      'groupName': groupName,
      'totalExpense': totalExpense,
      'members': members.map((m) => m.toMap()).toList(),
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      groupName: map['groupName'],
      totalExpense: map['totalExpense'],
      members: List<Friend>.from(map['members'].map((m) => Friend.fromMap(Map<String, dynamic>.from(m)))),
    );
  }
}