import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import 'package:flutter_map/flutter_map.dart';
import "package:flutter_svg/svg.dart";
import "package:google_fonts/google_fonts.dart";
import "package:url_launcher/url_launcher.dart";
import "package:latlong2/latlong.dart";

@RoutePage()
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String styleUrl =
        "https://tiles.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}{r}.png";
    String apiKey = "ac5d4683-ec38-459e-9261-4bf96cc95714";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About Our Company',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to OurCompany, where we specialize in creating and renting high-quality houses for our customers.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Our Mission',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Our mission is to provide comfortable and affordable housing solutions to individuals and families. We strive to create homes that meet the needs and exceed the expectations of our clients.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'For inquiries and more information, please contact us at:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Email: info@ourcompany.com\nPhone: 123-456-7890',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 50),
                SizedBox(
                    height: 200, // Adjust the height of the map container
                    child: FlutterMap(
                      options: const MapOptions(
                          initialCenter: LatLng(59.438484, 24.742595),
                          initialZoom: 14,
                          keepAlive: true, 
                                        ),
                      nonRotatedChildren: [
                        RichAttributionWidget(attributions: [
                          TextSourceAttribution("Stadia Maps",
                              onTap: () => launchUrl(
                                  Uri.parse("https://stadiamaps.com/")),
                              prependCopyright: true),
                          TextSourceAttribution("OpenMapTiles",
                              onTap: () => launchUrl(
                                  Uri.parse("https://openmaptiles.org/")),
                              prependCopyright: true),
                          TextSourceAttribution("OpenStreetMap",
                              onTap: () => launchUrl(Uri.parse(
                                  "https://www.openstreetmap.org/copyright")),
                              prependCopyright: true),
                        ]),
                      ],
                      children: [
                        TileLayer(
                          urlTemplate: "$styleUrl?api_key={api_key}",
                          additionalOptions: {"api_key": apiKey},
                          maxZoom: 20,
                          maxNativeZoom: 20,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.blueGrey.shade50),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.copyright_outlined),
                  const SizedBox(width: 10),
                  Text("HOME", style: GoogleFonts.roboto(fontSize: 12)),
                ],
              ),
              Text("some other text", style: GoogleFonts.roboto(fontSize: 12)),
            ],
          ),
        )
      ],
    );
  }
}
