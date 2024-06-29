import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/models/auth/residentials.dart';
import 'package:home/pages/search/search_head.dart';
import 'package:home/store/application_state.dart';
import 'package:home/widgets/footer/main_footer.dart';

class SearchResult extends StatelessWidget {
  final ResidentialList residentialList;
  final AppState vm;

  const SearchResult(
      {super.key, required this.residentialList, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: residentialList.items.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Column(children: [SearchHead(), SizedBox(height: 30)]);
        } else if (residentialList.items.length + 1 == index) {
          return Column(
            children: [const SizedBox(height: 20), MainFooter(state: vm)],
          );
        } else {
          index -= 1;
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            child: Card.filled(
              elevation: 0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: vm.theme.brightness == Brightness.light
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
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.asset(
                              'lib/assets/jpg/h2.jpg',
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              10,
                              5,
                              10,
                              0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Chip(
                                  backgroundColor: Colors.red.withOpacity(0.15),
                                  padding: const EdgeInsets.all(5),
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0,
                                        color: Colors.red,
                                        style: BorderStyle.none),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  label: Row(
                                    children: [
                                      const Icon(Icons.attach_money),
                                      Text(
                                        residentialList.items[index].rentPrice
                                            .toString(),
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // ,
                                ),
                                Row(
                                  children: [
                                    if (residentialList.items[index].hasBalcony)
                                      Row(
                                        children: [
                                          const SizedBox(width: 5),
                                          Chip(
                                            backgroundColor:
                                                Colors.green.withOpacity(0.15),
                                            padding: const EdgeInsets.all(5),
                                            shape: const RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 0,
                                                  color: Colors.red,
                                                  style: BorderStyle.none),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            label: Row(
                                              children: [
                                                Text(
                                                  "Has Balcony",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // ,
                                          ),
                                        ],
                                      ),
                                    if (residentialList.items[index].hasParking)
                                      Row(
                                        children: [
                                          const SizedBox(width: 5),
                                          Chip(
                                            backgroundColor:
                                                Colors.blue.withOpacity(0.15),
                                            padding: const EdgeInsets.all(5),
                                            shape: const RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 0,
                                                  color: Colors.red,
                                                  style: BorderStyle.none),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            label: Row(
                                              children: [
                                                Text(
                                                  "Has Parking",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 12,
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.place_outlined),
                                    const SizedBox(width: 5),
                                    Text(
                                      residentialList.items[index].address,
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Text(
                                      "Number of Rooms : ",
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      residentialList.items[index].numberOfRoom
                                          .toString(),
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        size: 20,
                                        color: Colors.blue.shade800,
                                        shadows: [
                                          Shadow(
                                            color: Colors.blue.shade800
                                                .withOpacity(
                                              0.5,
                                            ),
                                            blurRadius: 15,
                                          ),
                                        ],
                                        Icons.share_arrival_time_outlined,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          size: 20,
                                          color: Colors.blue.shade800,
                                          shadows: [
                                            Shadow(
                                              color: Colors.blue.shade800
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
                                      color: Colors.blue.shade800,
                                      fontWeight: FontWeight.bold,
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
    );
  }
}
