import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/widgets/footer/main_footer.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 40, 40, 5),
          child: Text(
            "Latest Options",
            style: GoogleFonts.roboto(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
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
                      // BoxShadow(
                      //   color: Colors.grey.withOpacity(0.5),
                      //   blurRadius: 4,
                      // ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 8,
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
                          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                          child: Container(
                            width: 200,
                            // height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                  0.4), // Optional: Container color
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
                                        color: Colors.black.withOpacity(0.9),
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
                                      child: const Text("go to"),
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
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
          child: Container(
            decoration: const BoxDecoration(
              // color: Colors.grey[50],
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.amber.shade100,
              //     spreadRadius: 6,
              //     blurRadius: 0,
              //   ),
              // ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Text(
            "Services",
            style: GoogleFonts.roboto(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
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
                    width: 5, color: Colors.lightGreen[100]!.withOpacity(0.7)),
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
                  style: GoogleFonts.roboto(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right_alt),
                      label: const Row(
                        children: [
                          Text(
                            "Go to page",
                            style: TextStyle(
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
                        color: Colors.lightBlue[100]!.withOpacity(0.7)))),
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
                  style: GoogleFonts.roboto(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right_alt),
                      label: const Row(
                        children: [
                          Text(
                            "Go to page",
                            style: TextStyle(
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
        const MainFooter()
      ],
    );
  }
}
