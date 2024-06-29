import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_redux/flutter_redux.dart";
import "package:home/store/application_state.dart";
import "package:text_divider/text_divider.dart";

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: ((store) => store.state),
        builder: (ctx, vm) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: vm.theme.brightness == Brightness.light
                      ? Colors.white
                      : Colors.grey.shade900),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 40),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    CircleAvatar(
                      radius: 67,
                      child: SizedBox(
                        child: ClipOval(
                          child: Image.asset(
                            "lib/assets/jpg/avatar.jpg",
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // const CustomTextField(labelText: "Firstname"),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter First Name',
                        labelText: 'First Name',
                      ),
                    ),
                    const SizedBox(height: 20),
                    // const CustomTextField(labelText: "Lastname"),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Last Name',
                        labelText: 'Last Name',
                      ),
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                        ),
                        //const
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Submit Changes",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    const TextDivider(
                      text: Text("Other Profile Values"),
                    ),
                    const SizedBox(height: 20),
                    // const Row(
                    //   children: [
                    //     Text("Others",
                    //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    //   ],
                    // ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.email),
                                SizedBox(width: 10),
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("mohesem@gmail.com"),
                                TextButton.icon(
                                  onPressed: () {},
                                  label: const Text("change"),
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            const Row(
                              children: [
                                Icon(Icons.password),
                                SizedBox(width: 10),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("************"),
                                TextButton.icon(
                                  onPressed: () {},
                                  label: const Text("change"),
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
