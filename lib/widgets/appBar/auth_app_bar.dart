import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
    //   actions: [
    //     Padding(padding: const EdgeInsets.only(right: 20),
    //
    //   child: 
    //    SvgPicture.asset(
    //     'lib/assets/svg/logo.svg',
    //     width: 100,
    //     fit: BoxFit.contain,
    //     colorFilter: ColorFilter.mode(Colors.blue.shade800, BlendMode.srcIn),
    //   ),
    // )
    //
    //   ],
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
