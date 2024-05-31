import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:home/pages/home/body.dart';
import 'package:home/pages/home/search.dart';
import 'package:home/widgets/button/chip.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearch = false;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.blue.shade50.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(25),
                    ),
                    boxShadow: !_isSearch
                        ? [
                            BoxShadow(
                              color: Colors.blue.shade900.withOpacity(0.1),
                              blurRadius: 10,
                            ),
                            BoxShadow(
                              color: Colors.blue.shade900.withOpacity(0.1),
                              blurRadius: 30,
                            )
                          ]
                        : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      decoration: const BoxDecoration(
                        // color: Colors.grey[50],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  "500 of items",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: const Offset(0, 3),
                                  blurRadius: 10,
                                  spreadRadius: 3,
                                ),
                                // BoxShadow(
                                //   color: Colors.grey.withOpacity(0.1),
                                //   offset: const Offset(0, 2),
                                //   blurRadius: 3,
                                //   spreadRadius: 0,
                                // ),
                              ],
                            ),
                            child: TextFormField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: "Search",
                                suffixIcon: IconButton(
                                  icon: _isSearch
                                      ? const Icon(Icons.cancel_outlined)
                                      : const Icon(Icons.search),
                                  onPressed: () {
                                    setState(() {
                                      _isSearch = !_isSearch;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            children: [
                              CustomChip(label: "first cat"),
                              SizedBox(width: 10),
                              CustomChip(label: "second cat"),
                              SizedBox(width: 10),
                              CustomChip(label: "third cat"),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration:
                      const Duration(milliseconds: 500), // Animation duration

                  child: _isSearch
                      ? Search(searchController: searchController)
                      : const HomePageBody(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


          // const Divider(),
          // Container(
          //   // decoration: BoxDecoration(color: Colors.blueGrey.shade50),
          //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //         children: [
          //           const Icon(Icons.copyright_outlined),
          //           const SizedBox(width: 10),
          //           Text("HOME", style: GoogleFonts.roboto(fontSize: 12)),
          //         ],
          //       ),
          //       Text("some other text",
          //           style: GoogleFonts.roboto(fontSize: 12)),
          //     ],
          //   ),
          // )