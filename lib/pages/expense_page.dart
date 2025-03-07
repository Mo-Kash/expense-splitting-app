import 'package:flutter/material.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

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
            "Expenses",
            style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
                "assets/images/pie-chart.png",
              width: 250,
              height: 250,
            ),
          ),

          SizedBox(
            height: 224,
            child: ListView(
              padding: const EdgeInsets.all(5.0),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.square,
                      color: Colors.purple[200],
                    ),
                    title: Text(
                      "Bangalore Trip",
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.square,
                      color: Colors.teal[200],
                    ),
                    title: Text(
                      "Concert Ticket",
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.square,
                      color: Colors.grey[600],
                    ),
                    title: Text(
                      "Birthday Dinner",
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.square,
                      color: Colors.orange[400],
                    ),
                    title: Text(
                      "Flight Ticket",
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.square,
                      color: Colors.red[300],
                    ),
                    title: Text(
                      "Hotel Stay",
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.square,
                      color: Colors.red[400],
                    ),
                    title: Text(
                      "Miscellaneous",
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

        ],
      )
    );
  }
}