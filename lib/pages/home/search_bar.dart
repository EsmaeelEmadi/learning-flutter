import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/store/application_state.dart';
import 'package:home/widgets/checkbox/main.dart';
import 'package:text_divider/text_divider.dart';

class SearchBar extends StatefulWidget {
  final bool isSearch;
  final VoidCallback toggleSearch;
  // final TextEditingController searchController;

  const SearchBar({
    super.key,
    required this.isSearch,
    required this.toggleSearch,
    // required this.searchController,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _hasBalcony = false;
  bool _hasParking = false;
  TextEditingController searchController = TextEditingController();
  TextEditingController minSQF = TextEditingController();
  TextEditingController maxSQF = TextEditingController();

  @override
  void dispose() {
    minSQF.dispose();
    maxSQF.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: ((store) => store.state),
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: state.theme.brightness == Brightness.light
                ? Colors.white
                : const Color.fromRGBO(33, 33, 33, 1),
            borderRadius: BorderRadius.vertical(
              bottom: state.theme.isSearch
                  ? const Radius.circular(20)
                  : const Radius.circular(100),
            ),
            boxShadow: [
              BoxShadow(
                color: state.theme.brightness == Brightness.light
                    ? Colors.grey.shade900.withOpacity(0.2)
                    : Colors.black.withOpacity(0.5),
                blurRadius: 10,
              ),
              BoxShadow(
                color: state.theme.brightness == Brightness.light
                    ? Colors.grey.shade900.withOpacity(0.2)
                    : Colors.black.withOpacity(0.5),
                blurRadius: 30,
              )
            ],
          ),
          child: Padding(
            // padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: state.theme.isSearch
                    ? Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: searchController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                hintText: "Search",
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.blue.shade800)),
                                      icon: widget.isSearch
                                          ? const Icon(Icons.cancel_outlined,
                                              color: Colors.white)
                                          : const Icon(Icons.search,
                                              color: Colors.white),
                                      onPressed: widget.toggleSearch,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const TextDivider(
                              text: Text('Square Footage'),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ), // Add some space between the TextFields
                                SizedBox(
                                  width: 60,
                                  child: TextField(
                                    controller: minSQF,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      isDense: true,
                                      hintText: "Min",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width:
                                        10), // Add some space between the TextFields
                                SizedBox(
                                  width: 60,
                                  child: TextField(
                                    controller: maxSQF,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      isDense: true,
                                      hintText: "Max",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width:
                                        10), // Add some space between the TextFields
                              ],
                            ),
                            const SizedBox(height: 20),
                            const TextDivider(text: Text("Properties")),
                            // const Row(
                            //   children: [
                            //     SizedBox(
                            //       width: 10,
                            //     ),
                            //     Text(
                            //       "Properties",
                            //       style: TextStyle(
                            //           fontSize: 16,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //   ],
                            // ),
                            Row(
                              children: [
                                CustomCheckbox(
                                  readOnly: state.auth.isLoading,
                                  value: _hasBalcony,
                                  onChange: (v) {
                                    setState(() {
                                      _hasBalcony = v!;
                                    });
                                  },
                                  child: const Text("Has Balcony?"),
                                ),
                                const SizedBox(width: 10),
                                CustomCheckbox(
                                  readOnly: state.auth.isLoading,
                                  value: _hasParking,
                                  onChange: (v) {
                                    setState(() {
                                      _hasParking = v!;
                                    });
                                  },
                                  child: const Text("Has Parking?"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 30),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Searching for a prefect",
                                style: GoogleFonts.roboto(fontSize: 28),
                              ),
                              Text(
                                "HOME?",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: Image.asset(
                              'lib/assets/png/search.png',
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.high,
                              colorBlendMode: BlendMode.clear,
                              opacity: const AlwaysStoppedAnimation(0.9),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
