import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.menu),

      title: SvgPicture.asset("assets/images/logo-79.svg"),
      actions: [
        //Icon(Icons.notifications_none_outlined),
        SvgPicture.asset("assets/images/bell.svg"),
        SvgPicture.asset("assets/images/cart.svg"),
      ],
    );
  }
}
