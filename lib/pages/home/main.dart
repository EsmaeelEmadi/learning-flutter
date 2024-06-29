import 'package:flutter/material.dart';
import 'package:home/pages/home/body.dart';
import 'package:home/pages/home/search.dart';

class HomePageMain extends StatefulWidget {
  const HomePageMain({super.key});

  @override
  State<HomePageMain> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  bool _isSearch = false;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: Expanded(
        child: Column(
          children: [
            Container(
              color: Colors.blue.shade50.withOpacity(0.1),
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration:
                        const Duration(milliseconds: 500), // Animation duration
                    child: _isSearch
                        ? Search()
                        : HomePageBody(),
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
