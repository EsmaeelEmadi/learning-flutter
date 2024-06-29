import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/routes/app_router.dart';
import 'package:home/store/application_state.dart';
import 'package:home/store/theme/actions.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MainAppBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return StoreConnector<AppState, AppState>(
        converter: ((store) => store.state),
        builder: (context, state) {
          final store = StoreProvider.of<AppState>(context);

          return AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            leadingWidth: 150,
            backgroundColor: state.theme.brightness == Brightness.light
                ? Colors.white
                : Colors.grey.shade900,
            shadowColor: Colors.black.withOpacity(0.2),
            elevation: 0,
            // actions: [Text("asdf")],
            actions: [
              IconButton(
                onPressed: () {
                  if (router.currentPath == '/search') {
                    store.dispatch(SetIsSearch(false));
                    router.back();
                  } else {
                    store.dispatch(SetIsSearch(true));
                    router.push(const SearchRoute());
                  }
                },
                icon: state.theme.isSearch
                    ? const Icon(Icons.close)
                    : const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
              const SizedBox(width: 30),
            ],
            leading: Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    store.dispatch(SetIsSearch(false));
                    router.push(const MainRoute());
                  },
                  icon: SvgPicture.asset(
                    'lib/assets/svg/logo.svg',
                    width: 100,
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(
                      Colors.blue.shade800,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
