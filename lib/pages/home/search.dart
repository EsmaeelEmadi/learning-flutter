import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import 'package:home/widgets/footer/main_footer.dart';

class Search extends StatefulWidget {
  final TextEditingController searchController;

  const Search({super.key, required this.searchController});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _searchTerm = '';
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
    widget.searchController.addListener(_updateSearchTerm);
  }

  @override
  void dispose() {
    widget.searchController.removeListener(_updateSearchTerm);
    super.dispose();
  }

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('lib/assets/mock.json');
    final data = await json.decode(response);
    print(data);
    setState(() {
      _data = data;
    });
  }

  void _updateSearchTerm() {
    setState(() {
      _searchTerm = widget.searchController.text;
    });
  }

// Text(_searchTerm);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // decoration: BoxDecoration(color: Colors.red.shade100),
        alignment: Alignment.center,
        child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 260,
            ),
            // height: MediaQuery.of(context).size.height ,
            child: Column(
              children: [
                Expanded(
                  child: _data.isEmpty
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: _data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 20,
                              ),
                              child: Card.filled(
                                color: Colors.grey.shade200,
                                elevation: 0,
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(10),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                top: Radius.circular(15),
                                              ),
                                              child: Image.asset(
                                                'lib/assets/jpg/h2.jpg',
                                                height: 250,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            // Container(
                                            //   width: double.infinity,
                                            //   height: 5,
                                            //   color: Colors.grey.shade50,
                                            // ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                20,
                                                10,
                                                20,
                                                0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    _data[index]['name'],
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 20,
                                                      // fontWeight:
                                                      //     FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 20),
                                              child: Text(
                                                _data[index]['description'],
                                                style: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade700,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.end,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          size: 20,
                                                          color: Colors
                                                              .blue.shade800,
                                                          shadows: [
                                                            Shadow(
                                                              color: Colors
                                                                  .blue.shade800
                                                                  .withOpacity(
                                                                0.5,
                                                              ),
                                                              blurRadius: 15,
                                                            ),
                                                          ],
                                                          Icons
                                                              .share_arrival_time_outlined,
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                            size: 20,
                                                            color: Colors
                                                                .blue.shade800,
                                                            shadows: [
                                                              Shadow(
                                                                color: Colors
                                                                    .blue
                                                                    .shade800
                                                                    .withOpacity(
                                                                  0.5,
                                                                ),
                                                                blurRadius: 15,
                                                              ),
                                                            ],
                                                            Icons.share),
                                                      ),
                                                    ],
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      "button",
                                                      style: GoogleFonts.roboto(
                                                        color: Colors
                                                            .blue.shade800,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
                const MainFooter()
              ],
            )
            //  Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           _data.isEmpty
            //               ? const CircularProgressIndicator()
            //               : ListView.builder(
            //                   itemCount: _data.length,
            //                   itemBuilder: (context, index) {
            //                     return Container(
            //                       decoration: BoxDecoration(color: Colors.red),
            //                       child: ListTile(
            //                         title: Text(_data[index]['name']),
            //                         subtitle: Text(_data[index]['description']),
            //                       ),
            //                     );
            //                   },
            //                 ),
            //         ],
            //       ),
            //     ),
            //     const MainFooter(),
            //   ],
            // ),
            ),
      ),
    );
  }
}

// Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Center(child: Text("ssss")),
//             // growable childrens
//           ],
//         ),


            // SizedBox(height: 60),

// Container(
//     constraints: BoxConstraints(
//       maxHeight: MediaQuery.of(context).size.height * .30
//     ),
//     child: SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
  
//         children: const [
//           // growable childrens
//         ],
//       ),
//     ),
// );

  //   _data.isEmpty
  //       ? const Center(child: CircularProgressIndicator())
  //       : ListView.builder(
  //           itemCount: _data.length,
  //           itemBuilder: (context, index) {
  //             return ListTile(
  //               title: Text(_data[index]['name']),
  //               subtitle: Text(_data[index]['description']),
  //             );
  //           },
  //         );

