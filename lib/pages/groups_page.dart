import 'package:expense_splitting_app/components/new_group_form.dart';
import 'package:expense_splitting_app/data/group_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> with AutomaticKeepAliveClientMixin{

  final GroupDatabase gdb = GroupDatabase();

  @override
  void initState() {
    super.initState();
    _loadGroups();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadGroups(); // Ensure data refresh when page is revisited
  }

  void _loadGroups() {
    print(gdb.groups);
    gdb.loadGroupData();
    print(gdb);
    setState(() {}); // Trigger UI update
  }

  void createNewGroup() {
    showDialog(
      context: context,
      builder: (context) {
        return NewGroupForm(
          onGroupsUpdated: (newGroups) {
            setState(() {
              gdb.groups = newGroups;
            });
            gdb.updateGroupDatabase();
          },
        );
      },
    );
  }

  void deleteGroup(int index) {
    setState(() {
      gdb.groups.removeAt(index);
    });
    gdb.updateGroupDatabase();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: createNewGroup,
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        label: Row(
          children: [
            Icon(Icons.add, color: Colors.white),
            Text("Add Group", style: TextStyle(color: Colors.white))
          ],
        ),
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.center,
          child: Text(
              "My Groups",
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: gdb.groups.length,
        itemBuilder: (context, index) {
          final group = gdb.groups[index];
          return Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => deleteGroup(index),
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.teal
                ),
                color: Colors.teal,
              ),
              child: ExpansionTile(
                title: Align(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/people.png",
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        group.groupName.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Total Expense: Rs. ${group.totalExpense.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 12
                    ),
                  ),
                ),
                trailing: Text(
                    (group.members.length==1?"${group.members.length} member":"${group.members.length} members").toUpperCase(),
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[700],
                      fontSize: 10
                    ),
                ),
                children: group.members.map((friend) {
                  return ListTile(
                    title: Text(
                      friend.name.toUpperCase(),
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 14
                      ),
                    ),
                    subtitle: Text(
                        "Owes: Rs. ${friend.owedToUser.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontStyle: FontStyle.italic
                    ),
                    ),
                    leading: Image.asset(
                        "assets/images/man.png",
                      height: 25,
                      width: 25
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
