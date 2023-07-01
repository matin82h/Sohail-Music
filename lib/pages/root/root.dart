import 'package:flutter/material.dart';
import 'home.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        Home(),
        Center(
          child: Text(
            "Folder",
            style: TextStyle(
              fontSize: 60,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    List items = [
      Icons.home,
      Icons.folder,
    ];

    return Container(
      height: 55,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length, (index) {
          return IconButton(
            onPressed: () {
              setState(() {
                activeTab = index;
              });
            },
            icon: Icon(
              items[index],
              size:30,
              color: activeTab == index ? Colors.red : Colors.black,
            ),
          );
        }),
      ),
    );
  }
}
