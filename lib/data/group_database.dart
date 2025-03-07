import 'package:expense_splitting_app/models/group.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GroupDatabase {

  static final GroupDatabase _instance = GroupDatabase._internal();
  factory GroupDatabase() => _instance; // Global access point

  GroupDatabase._internal();

  List<Group> groups = [];
  final _myGroupBox = Hive.box("groupbox");

  void initialData() {
    _myGroupBox.put("GROUPS", []); // Initialize with an empty list
  }

  void loadGroupData() {
    if (!Hive.isBoxOpen("groupbox")) return;
    var box = Hive.box("groupbox");

    var storedGroups = box.get("GROUPS", defaultValue: []);

    if (storedGroups is List) {
      groups = storedGroups.map((g) => Group.fromMap(Map<String, dynamic>.from(g))).toList();
    }
  }

  void updateGroupDatabase() {
    _myGroupBox.put("GROUPS", groups.map((g) => g.toMap()).toList());
  }
}
