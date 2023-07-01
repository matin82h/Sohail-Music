import 'package:flutter/material.dart';

import '../music/all_music.dart';



class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: const [
            Material(
              color: Colors.white,
              child: TabBar(
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                    ),
                  ),
                ),
                tabs: [
                  Tab(text: "Songs"),
                  Tab(text: "Artist"),
                  Tab(text: "Album"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AllMusic(),
                  Center(
                    child: Text(
                      "Artist",
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Album",
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
