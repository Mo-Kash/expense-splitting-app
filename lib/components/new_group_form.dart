import 'package:flutter/material.dart';
import 'package:expense_splitting_app/models/friend.dart';
import 'package:expense_splitting_app/models/group.dart';
import '../data/group_database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/friend_database.dart';

class NewGroupForm extends StatefulWidget {
  final Function(List<Group>) onGroupsUpdated;

  const NewGroupForm({super.key, required this.onGroupsUpdated});

  @override
  _NewGroupFormState createState() => _NewGroupFormState();
}

class _NewGroupFormState extends State<NewGroupForm> {

  final _myGroupBox = Hive.box("groupbox");
  GroupDatabase gdb = GroupDatabase();

  final _myFriendBox = Hive.box("friendbox");
  FriendDatabase fdb = FriendDatabase();

  @override
  void initState(){
    if (_myGroupBox.get("GROUPS") == null){
      gdb.initialData();
    }else{
      gdb.loadGroupData();
    }
    if (_myFriendBox.get("FRIENDS") == null){
      fdb.initialData();
    }else{
      fdb.loadFriendData();
    }
  }

  final TextEditingController groupNameController = TextEditingController();
  final TextEditingController totalExpenseController = TextEditingController();
  final TextEditingController memberNameController = TextEditingController();
  final TextEditingController owedAmountController = TextEditingController();

  void splitEvenly() {
    if (fdb.members.isNotEmpty && totalExpenseController.text.isNotEmpty) {
      double? totalExpense = double.tryParse(totalExpenseController.text);
      if (totalExpense != null) {
        double splitAmount = totalExpense / fdb.members.length;
        setState(() {
          fdb.members = fdb.members.map((friend) => Friend(name: friend.name, owedToUser: splitAmount)).toList();
        });
      }
    }
  }

  void addGroup() {
    if (groupNameController.text.isNotEmpty && totalExpenseController.text.isNotEmpty && fdb.members.isNotEmpty) {
      double? totalExpense = double.tryParse(totalExpenseController.text);
      if (totalExpense != null) {
        Group newGroup = Group(
          groupName: groupNameController.text,
          totalExpense: totalExpense,
          members: List.from(fdb.members),
        );

        setState(() {
          gdb.groups.add(newGroup); // Append instead of replacing
        });

        gdb.loadGroupData();  // Load previous groups first
        gdb.groups.add(newGroup);  // Append the new group
        gdb.updateGroupDatabase(); // Save to Hive

        widget.onGroupsUpdated(gdb.groups);  // Pass the full updated list
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: SingleChildScrollView(
        child: SizedBox(
          height: 450,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: groupNameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: "Group Name",
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontStyle: FontStyle.italic,
                    fontSize: 12
                  )
                ),
                style: TextStyle(color: Colors.teal),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: totalExpenseController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  hintText: "Total Expense",
                  hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontStyle: FontStyle.italic,
                      fontSize: 12
                  )
                ),
                style: TextStyle(color: Colors.teal),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: memberNameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        hintText: "Member Name",
                        hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                        )
                      ),
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: owedAmountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        hintText: "Owed",
                        hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontStyle: FontStyle.italic,
                            fontSize: 12
                        )
                      ),
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.teal),
                    onPressed: () {
                      if (memberNameController.text.isNotEmpty && owedAmountController.text.isNotEmpty) {
                        double? owedAmount = double.tryParse(owedAmountController.text);
                        if (owedAmount != null) {
                          setState(() {
                            fdb.members.add(Friend(name: memberNameController.text, owedToUser: owedAmount));
                            memberNameController.clear();
                            owedAmountController.clear();
                          });
                        }
                      }
                      fdb.updateFriendDatabase();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                onPressed: splitEvenly,
                child: Text(
                    "Split Evenly",
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
              Text(
                "Click 'Split Evenly' after entering all members. You can enter any random value till then",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontStyle: FontStyle.italic,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: fdb.members.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          fdb.members[index].name.toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                      ),
                      subtitle: Text(
                          "Owes: Rs. ${fdb.members[index].owedToUser.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontStyle: FontStyle.italic
                          )
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            fdb.members.removeAt(index);
                          });
                          fdb.updateFriendDatabase();
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                onPressed: () {
                  addGroup();
                  Navigator.pop(context);
                },
                child: Text(
                    "Submit",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
