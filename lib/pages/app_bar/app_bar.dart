import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  Icon customIcon = const Icon(Icons.search, color: Colors.black,);
  Widget customSearchBar = const Text('Music Player',style: TextStyle(color: Colors.black),);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: customSearchBar,
      leading: const Icon(
        Icons.settings,
        color: Colors.black,
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              if (customIcon.icon == Icons.search) {
                customIcon = const Icon(
                  Icons.cancel,
                  color: Colors.black,
                );

                customSearchBar = const ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 28,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Music',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                customIcon = const Icon(
                  Icons.search,
                  color: Colors.black,
                );
                customSearchBar = const Text(
                  'Music Player',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                );
              }
            });
          },
          icon: customIcon,
        )
      ],
    );
  }
}
