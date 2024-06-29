import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:home/api/client.dart';
import 'package:home/models/auth/residentials.dart';
import 'package:home/pages/home/search_bar.dart' as sb;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/store/application_state.dart';
import 'dart:convert';

import 'package:home/widgets/footer/main_footer.dart';

class Search extends StatefulWidget {
  // TextEditingController searchController = TextEditingController();

  // const Search({super.key, required this.searchController});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _searchTerm = '';

  // List<dynamic> _data = [];
  bool _isSearch = false;
  TextEditingController searchController = TextEditingController();
  int? _getResidentialErrorCode;
  ResidentialList? _residentialList;

  int _page = 0;

  void setPage(page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    req();

    // loadJsonData();
    searchController.addListener(_updateSearchTerm);
  }

  @override
  void dispose() {
    searchController.removeListener(_updateSearchTerm);
    super.dispose();
  }
  // "username": usernameController.text,
  // "password": passwordController.text,

  void req() async {
    final client = DioClient();
    try {
      final response = await client.get("residential/rent");
      final newData = ResidentialList.fromJson(response);

      setState(() {
        _residentialList = newData;
      });

    } on DioException catch (e) {

      final errorData = e.response?.data;

      setState(() {
        _getResidentialErrorCode = e.response?.statusCode;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "${e.response?.statusCode}: ${errorData['error']}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Unable to connect to server",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ));
      }
    }
  }

  // Future<void> loadJsonData() async {
  //   final String response = await rootBundle.loadString('lib/assets/mock.json');
  //   // final data = await json.decode(response);
  //   // setState(() {
  //   //   _data = data;
  //   // });
  // }

  void _updateSearchTerm() {
    setState(() {
      _searchTerm = searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: ((store) => store.state),
      builder: (context, state) {
        // if (state.theme.isSearch) {
        //   return Container(child: Search());
        // }

        return
            // decoration: BoxDecoration(
            // color: state.theme.brightness == Brightness.light
            //     ? Colors.white
            //     : Colors.grey.shade900),

            Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: _getResidentialErrorCode == 401
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.error, color: Colors.red),
                                  SizedBox(width: 10),
                                  Text(
                                    "Only users can use search",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100)
                  ],
                )
              : _residentialList == null
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [CircularProgressIndicator()],
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            // padding: const EdgeInsets.only(bottom: 10),
                            itemCount: _residentialList!.items.length + 2,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                // return the header

                                return Column(children: [
                                  sb.SearchBar(
                                    isSearch: _isSearch,
                                    toggleSearch: () {
                                      setState(() {
                                        _isSearch = !_isSearch;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 30)
                                ]);
                              } else if (_residentialList!.items.length + 1 ==
                                  index) {
                                return Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    MainFooter(state: state)
                                  ],
                                );
                              } else {
                                index -= 1;
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 20,
                                  ),
                                  child: Card.filled(
                                    // color: Colors.grey.shade200,
                                    elevation: 0,
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: state.theme.brightness ==
                                                Brightness.light
                                            ? Colors.grey.shade100
                                            : Colors.grey.shade900,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(10),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius
                                                          .vertical(
                                                    top: Radius.circular(10),
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
                                                    10,
                                                    5,
                                                    10,
                                                    0,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Chip(
                                                        backgroundColor: Colors
                                                            .red
                                                            .withOpacity(0.15),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              width: 0,
                                                              color: Colors.red,
                                                              style: BorderStyle
                                                                  .none),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        label: Row(
                                                          children: [
                                                            const Icon(Icons
                                                                .attach_money),
                                                            Text(
                                                              _residentialList!
                                                                  .items[index]
                                                                  .rentPrice
                                                                  .toString(),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // ,
                                                      ),
                                                      Row(
                                                        children: [
                                                          if (_residentialList!
                                                              .items[index]
                                                              .hasBalcony)
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                    width: 5),
                                                                Chip(
                                                                  backgroundColor: Colors
                                                                      .green
                                                                      .withOpacity(
                                                                          0.15),
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          5),
                                                                  shape:
                                                                      const RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        width:
                                                                            0,
                                                                        color: Colors
                                                                            .red,
                                                                        style: BorderStyle
                                                                            .none),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          10),
                                                                    ),
                                                                  ),
                                                                  label: Row(
                                                                    children: [
                                                                      Text(
                                                                        "Has Balcony",
                                                                        style: GoogleFonts
                                                                            .roboto(
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // ,
                                                                ),
                                                              ],
                                                            ),
                                                          if (_residentialList!
                                                              .items[index]
                                                              .hasParking)
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                    width: 5),
                                                                Chip(
                                                                  backgroundColor: Colors
                                                                      .blue
                                                                      .withOpacity(
                                                                          0.15),
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          5),
                                                                  shape:
                                                                      const RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        width:
                                                                            0,
                                                                        color: Colors
                                                                            .red,
                                                                        style: BorderStyle
                                                                            .none),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          10),
                                                                    ),
                                                                  ),
                                                                  label: Row(
                                                                    children: [
                                                                      Text(
                                                                        "Has Parking",
                                                                        style: GoogleFonts
                                                                            .roboto(
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // ,
                                                                ),
                                                              ],
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                                  child: Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Icon(Icons
                                                              .place_outlined),
                                                          const SizedBox(
                                                              width: 5),
                                                          Text(
                                                            _residentialList!
                                                                .items[index]
                                                                .address,
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 0),
                                                  child: Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(width: 10),
                                                          Text(
                                                            "Number of Rooms : ",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 5),
                                                          Text(
                                                            _residentialList!
                                                                .items[index]
                                                                .numberOfRoom
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
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
                                                              color: Colors.blue
                                                                  .shade800,
                                                              shadows: [
                                                                Shadow(
                                                                  color: Colors
                                                                      .blue
                                                                      .shade800
                                                                      .withOpacity(
                                                                    0.5,
                                                                  ),
                                                                  blurRadius:
                                                                      15,
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
                                                                    .blue
                                                                    .shade800,
                                                                shadows: [
                                                                  Shadow(
                                                                    color: Colors
                                                                        .blue
                                                                        .shade800
                                                                        .withOpacity(
                                                                      0.5,
                                                                    ),
                                                                    blurRadius:
                                                                        15,
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
                                                          style: GoogleFonts
                                                              .roboto(
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
                              }
                            },
                          ),
                        ),
                      ],
                    ),
          //  Column(
          //   children: [
          //   ],
          // ),
          // ),
          // const SizedBox(height: 20),
          // MainFooter(state: state)
          // ],
        );
      },
    );
  }
// Text(_searchTerm);
}


      //   return Container(
      //     constraints: BoxConstraints(
      //       maxHeight: MediaQuery.of(context).size.height,
      //     ),
      //     // height: MediaQuery.of(context).size.height ,
      //     child: Column(
      //       children: [
      //         Expanded(
      //           child: _data.isEmpty
      //               ? const CircularProgressIndicator()
      //               : ListView.builder(
      //                   padding: const EdgeInsets.only(top: 10),
      //                   itemCount: _data.length,
      //                   itemBuilder: (context, index) {
      //                     return Padding(
      //                       padding: const EdgeInsets.symmetric(
      //                         vertical: 5,
      //                         horizontal: 20,
      //                       ),
      //                       child: Card.filled(
      //                         // color: Colors.grey.shade200,
      //                         elevation: 0,
      //                         child: Container(
      //                           padding: const EdgeInsets.only(bottom: 10),
      //                           decoration: BoxDecoration(
      //                             color:
      //                                 state.theme.brightness == Brightness.light
      //                                     ? Colors.grey.shade100
      //                                     : Colors.grey.shade900,
      //                             borderRadius: BorderRadius.all(
      //                               Radius.circular(10),
      //                             ),
      //                           ),
      //                           child: Stack(
      //                             children: [
      //                               Container(
      //                                 decoration: const BoxDecoration(
      //                                   borderRadius: BorderRadius.vertical(
      //                                     top: Radius.circular(10),
      //                                   ),
      //                                 ),
      //                                 child: Column(
      //                                   children: [
      //                                     ClipRRect(
      //                                       borderRadius:
      //                                           const BorderRadius.vertical(
      //                                         top: Radius.circular(10),
      //                                       ),
      //                                       child: Image.asset(
      //                                         'lib/assets/jpg/h2.jpg',
      //                                         height: 250,
      //                                         width: double.infinity,
      //                                         fit: BoxFit.cover,
      //                                       ),
      //                                     ),
      //                                     // Container(
      //                                     //   width: double.infinity,
      //                                     //   height: 5,
      //                                     //   color: Colors.grey.shade50,
      //                                     // ),
      //                                     const SizedBox(
      //                                       height: 5,
      //                                     ),
      //                                     Padding(
      //                                       padding: const EdgeInsets.fromLTRB(
      //                                         20,
      //                                         10,
      //                                         20,
      //                                         0,
      //                                       ),
      //                                       child: Row(
      //                                         mainAxisAlignment:
      //                                             MainAxisAlignment
      //                                                 .spaceBetween,
      //                                         children: [
      //                                           Text(
      //                                             _data[index]['name'],
      //                                             style: GoogleFonts.roboto(
      //                                               fontSize: 20,
      //                                               // fontWeight:
      //                                               //     FontWeight.bold,
      //                                             ),
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     ),
      //                                     Padding(
      //                                       padding: const EdgeInsets.symmetric(
      //                                           vertical: 5, horizontal: 20),
      //                                       child: Text(
      //                                         _data[index]['description'],
      //                                         style: GoogleFonts.roboto(
      //                                           fontSize: 14,
      //                                           // color: Colors.grey.shade700,
      //                                         ),
      //                                       ),
      //                                     ),
      //                                     const SizedBox(
      //                                       height: 10,
      //                                     ),
      //                                     Padding(
      //                                       padding: const EdgeInsets.symmetric(
      //                                           vertical: 0, horizontal: 20),
      //                                       child: Row(
      //                                         mainAxisAlignment:
      //                                             MainAxisAlignment
      //                                                 .spaceBetween,
      //                                         children: [
      //                                           Row(
      //                                             // mainAxisAlignment:
      //                                             //     MainAxisAlignment.end,
      //                                             children: [
      //                                               IconButton(
      //                                                 onPressed: () {},
      //                                                 icon: Icon(
      //                                                   size: 20,
      //                                                   color: Colors
      //                                                       .blue.shade800,
      //                                                   shadows: [
      //                                                     Shadow(
      //                                                       color: Colors
      //                                                           .blue.shade800
      //                                                           .withOpacity(
      //                                                         0.5,
      //                                                       ),
      //                                                       blurRadius: 15,
      //                                                     ),
      //                                                   ],
      //                                                   Icons
      //                                                       .share_arrival_time_outlined,
      //                                                 ),
      //                                               ),
      //                                               IconButton(
      //                                                 onPressed: () {},
      //                                                 icon: Icon(
      //                                                     size: 20,
      //                                                     color: Colors
      //                                                         .blue.shade800,
      //                                                     shadows: [
      //                                                       Shadow(
      //                                                         color: Colors
      //                                                             .blue.shade800
      //                                                             .withOpacity(
      //                                                           0.5,
      //                                                         ),
      //                                                         blurRadius: 15,
      //                                                       ),
      //                                                     ],
      //                                                     Icons.share),
      //                                               ),
      //                                             ],
      //                                           ),
      //                                           TextButton(
      //                                             onPressed: () {},
      //                                             child: Text(
      //                                               "button",
      //                                               style: GoogleFonts.roboto(
      //                                                 color:
      //                                                     Colors.blue.shade800,
      //                                                 fontWeight:
      //                                                     FontWeight.bold,
      //                                               ),
      //                                             ),
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //                     );
      //                   },
      //                 ),
      //         ),
      //         MainFooter(state: state)
      //       ],
      //     ),
      //   );
      // },