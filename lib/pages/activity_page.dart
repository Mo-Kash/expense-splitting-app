import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "Activity",
            style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),

      body: SizedBox(
        height: 500,
        child: ListView(
          padding: const EdgeInsets.all(5.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Colors.teal
                  ),
                  color: Colors.teal,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.show_chart,
                    color: Colors.grey[800],
                    size: 40
                  ),
                  title: Text(
                      "Ram paid you Rs. 22",
                    style: TextStyle(
                      color: Colors.grey[900]
                    ),
                  ),
                ),
              )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.teal
                    ),
                    color: Colors.green,
                  ),
                  child: ListTile(
                    leading: Icon(
                        Icons.check,
                        color: Colors.grey[800],
                        size: 40
                    ),
                    title: Text(
                      "Group expenses cleared: Group1",
                      style: TextStyle(
                          color: Colors.grey[900]
                      ),
                    ),
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.teal
                    ),
                    color: Colors.teal[800],
                  ),
                  child: ListTile(
                    leading: Icon(
                        Icons.arrow_forward,
                        color: Colors.grey[800],
                        size: 40
                    ),
                    title: Text(
                      "You sent Sakshi Rs. 22",
                      style: TextStyle(
                          color: Colors.grey[900]
                      ),
                    ),
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.teal
                    ),
                    color: Colors.teal[800],
                  ),
                  child: ListTile(
                    leading: Icon(
                        Icons.arrow_forward,
                        color: Colors.grey[800],
                        size: 40
                    ),
                    title: Text(
                      "You sent Aman Rs. 125",
                      style: TextStyle(
                          color: Colors.grey[900]
                      ),
                    ),
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.teal
                    ),
                    color: Colors.green,
                  ),
                  child: ListTile(
                    leading: Icon(
                        Icons.check,
                        color: Colors.grey[800],
                        size: 40
                    ),
                    title: Text(
                      "Group expenses cleared: Group0",
                      style: TextStyle(
                          color: Colors.grey[900]
                      ),
                    ),
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.teal
                    ),
                    color: Colors.teal,
                  ),
                  child: ListTile(
                    leading: Icon(
                        Icons.show_chart,
                        color: Colors.grey[800],
                        size: 40
                    ),
                    title: Text(
                      "Raj paid you Rs. 50",
                      style: TextStyle(
                          color: Colors.grey[900]
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
