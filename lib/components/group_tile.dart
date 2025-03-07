import 'package:flutter/material.dart';
import '../models/friend.dart';

class GroupTile extends StatelessWidget {

  final String groupName;
  final double expense;
  final List<Friend> members;

  GroupTile({
    super.key,
    required this.groupName,
    required this.expense,
    required this.members
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                  groupName
              ),
              Text(
                  expense as String
              ),
            ],
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: members.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(
                    members[index].name
                ),
                trailing: Text(
                  members[index].owedToUser as String
                )
              );
            },
          )
        ],
      ),
    );
  }
}
