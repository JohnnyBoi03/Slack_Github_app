// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:slack_github_app/github_webview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Slack profile picture
                Container(
                   height: 180,
                   width: 180,
                  decoration: BoxDecoration(
                    //placeholder
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                   ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      'https://ca.slack-edge.com/T05FFAA91JP-U05R9BVM9FV-b44f447886e5-512',
                      height: 180,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                //Slack name
                Text(
                  'John Oluwatosin',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),

                //button to github
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GithubWebView()),
                );
                  },
                  color: Colors.deepPurple.shade400,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Open Github',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
