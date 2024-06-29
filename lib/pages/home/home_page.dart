import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/pages/home/home_head.dart';
import 'package:home/store/application_state.dart';
import 'package:home/widgets/footer/main_footer.dart';
// import 'package:home/pages/home/_main.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:home/store/application_state.dart';
// import 'package:home/store/application_state.dart';
// import 'package:redux/redux.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
            child: Column(
              children: [
                const HomeHead(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 5),
                  child: Text(
                    "Latest Options",
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: vm.theme.brightness == Brightness.light
                          ? Colors.grey.shade900
                          : null,
                    ),
                  ),
                ),
                FlutterCarousel(
                  options: CarouselOptions(
                    height: 450.0,
                    showIndicator: false,
                    // slideIndicator: const CircularSlideIndicator(),
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: vm.theme.brightness == Brightness.light
                                    ? Colors.grey.withOpacity(0.5)
                                    : Colors.black.withOpacity(0.5),
                                blurRadius: 12,
                              )
                            ]),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'lib/assets/jpg/h$i.jpg',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                                  child: Container(
                                    width: 200,
                                    // height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(
                                          0.5), // Optional: Container color
                                      borderRadius: BorderRadius.circular(
                                          15), // Optional: Border radius
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Blurry Container',
                                              style: GoogleFonts.roboto(
                                                color: Colors.black
                                                    .withOpacity(0.9),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                'Some text is in here \nand it comntinues',
                                                softWrap: true,
                                                style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                "go to",
                                                style: TextStyle(
                                                  color: Colors.blue.shade800,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Text(
                    "Services",
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: vm.theme.brightness == Brightness.light
                          ? Colors.grey.shade900
                          : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.shade50.withOpacity(0.6),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border(
                        bottom: BorderSide(
                          width: 5,
                          color: vm.theme.brightness == Brightness.light
                              ? Colors.lightGreen[100]!.withOpacity(0.7)
                              : Colors.green.shade900.withOpacity(0.4),
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.circle_notifications,
                              color: Colors.green[900],
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Other Title",
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Some description about what this section does! Some description about what this section does!",
                          softWrap: true,
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: vm.theme.brightness == Brightness.light
                                ? null
                                : Colors.grey.shade900,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_right_alt,
                                color: Colors.blue.shade800,
                              ),
                              label: Row(
                                children: [
                                  Text(
                                    "Go to page",
                                    style: TextStyle(
                                      color: Colors.blue.shade800,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade50.withOpacity(0.6),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border(
                            bottom: BorderSide(
                          width: 5,
                          color: vm.theme.brightness == Brightness.light
                              ? Colors.lightBlue[100]!.withOpacity(0.7)
                              : Colors.blue.shade900.withOpacity(0.4),
                        ))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.cloud_circle_sharp,
                              color: Colors.blue[900],
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Some Title",
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Some description about what this section does! Some description about what this section does!",
                          softWrap: true,
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: vm.theme.brightness == Brightness.light
                                ? null
                                : Colors.grey.shade900,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                  color: Colors.blue.shade800,
                                  Icons.arrow_right_alt),
                              label: Row(
                                children: [
                                  Text(
                                    "Go to page",
                                    style: TextStyle(
                                      color: Colors.blue.shade800,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                MainFooter(state: vm)
              ],
            ),
          ),
        );
      },
    );
  }
}
