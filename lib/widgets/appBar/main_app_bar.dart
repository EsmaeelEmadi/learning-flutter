import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/routes/app_router.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      leadingWidth: 150,
      leading: Row(
        children: [
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {
              router.push(const HomeRoute());
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
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
