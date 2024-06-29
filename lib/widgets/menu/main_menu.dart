import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/routes/app_router.dart';
import 'package:home/store/application_state.dart';
import 'package:home/store/auth/action.dart';
import 'package:home/store/theme/actions.dart';
import 'package:home/utils/storage.dart';
import 'package:home/widgets/dialog/settings.dart';

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

List<ExampleDestination> destinations(AppState state) {
  var dist = <ExampleDestination>[
    if (!state.auth.isAuthenticated)
      ExampleDestination(
          'Login',
          Icon(Icons.login_outlined, color: Colors.blue[800]),
          const Icon(Icons.login_outlined)),
    if (state.auth.isAuthenticated)
      ExampleDestination(
          'Profile',
          Icon(Icons.account_circle_outlined, color: Colors.blue[800]),
          const Icon(Icons.account_circle_outlined)),
    ExampleDestination(
        'Settings',
        Icon(Icons.settings_outlined, color: Colors.blue[800]),
        const Icon(Icons.settings_outlined)),
    ExampleDestination(
        'About Us',
        Icon(Icons.info_outline, color: Colors.blue[800]),
        const Icon(Icons.info_outline)),
    if (state.auth.isAuthenticated)
      ExampleDestination(
          'Logout',
          Icon(Icons.logout_outlined, color: Colors.blue[800]),
          const Icon(Icons.logout_outlined)),
  ];

  return dist;
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          final store = StoreProvider.of<AppState>(context);

          return NavigationDrawer(
            selectedIndex: -1,
            onDestinationSelected: (selectedItem) {
              if (selectedItem == 0) {
                if (!state.auth.isAuthenticated) {
                  router.push(LoginRoute());
                } else {
                  router.push(const ProfileRoute());
                }
                Navigator.pop(context);
              } else if (selectedItem == 1) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => const SettingsDialog());
              } else if (selectedItem == 2) {
                router.push(const AboutUsRoute());

                Navigator.pop(context);
              } else if (selectedItem == 3) {
                TokenStorage.clearTokens();
                store.dispatch(SetLoginIsAuthenticated(false));
                if (router.currentPath == "/search") {
                  store.dispatch(SetIsSearch(false));
                }
                if (router.currentPath != "/home") { 
                  router.replaceAll([RootWrapperRoute()]);
                }
                Navigator.pop(context);
              }
            },
            children: <Widget>[
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    // color: Colors.grey[100],
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.4),
                    //     blurRadius: 10,
                    //   ),
                    // ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.blue.shade800,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Settings",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue[800],
                          ),
                        ),
                        // SvgPicture.asset(
                        //   'lib/assets/svg/logo.svg',
                        //   width: 100,
                        //   fit: BoxFit.contain,
                        //   colorFilter: ColorFilter.mode(
                        //     Colors.blue.shade800,
                        //     BlendMode.srcIn,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ...destinations(state).map(
                (ExampleDestination destination) {
                  return NavigationDrawerDestination(
                    label: Text(
                      destination.label,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    icon: destination.icon,
                    selectedIcon: destination.selectedIcon,
                  );
                },
              ),
              const Divider(indent: 40, endIndent: 40),
            ],
          );
        });
  }
}
