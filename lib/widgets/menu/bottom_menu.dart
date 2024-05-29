import 'package:flutter/material.dart';
import 'package:home/widgets/dialog/settings.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const SettingsDialog());
                    }),
                const SizedBox(height: 15),
                IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const SettingsDialog());
                    })
              ],
            ),
          ),
          const SizedBox(height: double.infinity, child: VerticalDivider()
              ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListTile(
                  title: const Center(child: Text('Login')),
                  onTap: () {},
                ),
                ListTile(
                  title: const Center(child: Text('Login')),
                  onTap: () {},
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
