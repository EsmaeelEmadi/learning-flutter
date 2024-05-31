import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class MainFooter extends StatelessWidget {
  const MainFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.white.withOpacity(0.1),
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.grey.withOpacity(0.2),
          //   blurRadius: 10,
          //   spreadRadius: 1

          // ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 30,
          )
        ],
      ),
      // constraints:
      //     BoxConstraints(minWidth: MediaQuery.of(context).size.width),
      // decoration: BoxDecoration(
      //   color: Colors.red.withOpacity(0.1), // Optional: Container color
      // ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.copyright_sharp,
                  size: 20,
                  color: Colors.blue.shade800,
                ),
                const SizedBox(width: 5),
                Text(
                  "HOME",
                  style: GoogleFonts.roboto(
                      color: Colors.blue.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "some other text",
              style: GoogleFonts.roboto(
                  color: Colors.black54,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
