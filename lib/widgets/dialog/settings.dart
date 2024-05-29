import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:home/store/application_state.dart';
import 'package:home/store/theme/actions.dart';
// import 'package:home/widgets/button/custom_button.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Dialog(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                            mainAxisSize: MainAxisSize.min,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Theme",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.nightlight),
                            color: state.theme.brightness == Brightness.dark
                                ? Colors.green
                                : null,
                            onPressed: () {
                              StoreProvider.of<AppState>(context)
                                  .dispatch(SetTheme(Brightness.dark));
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: IconButton(
                            color: state.theme.brightness == Brightness.light
                                ? Colors.green[600]
                                : null,
                            onPressed: () {
                              StoreProvider.of<AppState>(context)
                                  .dispatch(SetTheme(Brightness.light));
                            },
                            icon: const Icon(Icons.sunny),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const Text("some other settings"),
                    const SizedBox(height: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close",
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                )),
          );
        });
  }
}
