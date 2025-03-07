import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[900],
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: ()=>Navigator.pushNamed(context, '/homepage'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/revsplitLogo.png",
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.5),
              child: Text(
                "Welcome to RevSplit!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.lightBlueAccent[700],
                  fontStyle: FontStyle.italic
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Split expenses with groups or individuals.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.teal[600],
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "Tap to continue",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
