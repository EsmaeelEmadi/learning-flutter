import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/store/application_state.dart';

class HomeHead extends StatelessWidget {
  const HomeHead({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: ((store) => store.state),
        builder: (ctx, vm) {
          return Container(
            decoration: BoxDecoration(
              color: vm.theme.brightness == Brightness.light
                  ? Colors.white
                  : const Color.fromRGBO(33, 33, 33, 1),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  color: vm.theme.brightness == Brightness.light
                      ? Colors.grey.shade900.withOpacity(0.2)
                      : Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: vm.theme.brightness == Brightness.light
                      ? Colors.grey.shade900.withOpacity(0.2)
                      : Colors.black.withOpacity(0.5),
                  blurRadius: 30,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
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
        });
  }
}
