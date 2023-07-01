import 'package:flutter/material.dart';

import '../app_bar/app_bar.dart';
import '../app_bar/tab_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const AppBarPage(),
      ),
      body: const TabBarPage(),
    );
  }
}
