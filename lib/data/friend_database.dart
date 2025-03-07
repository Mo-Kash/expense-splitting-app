import 'package:expense_splitting_app/models/friend.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FriendDatabase {

  static final FriendDatabase _instance = FriendDatabase._internal();
  factory FriendDatabase() => _instance; // Global access

  FriendDatabase._internal();

  List<Friend> members = [];
  final _myFriendBox = Hive.box("friendbox");

  void initialData() {
    members = [];
  }

  void loadFriendData() {
    var storedFriends = _myFriendBox.get("FRIENDS", defaultValue: []);

    if (storedFriends is List) {
      members = storedFriends.map((m) => Friend.fromMap(Map<String, dynamic>.from(m))).toList();
    }
  }

  void updateFriendDatabase() {
    _myFriendBox.put("FRIENDS", members.map((m) => m.toMap()).toList());
    }
}