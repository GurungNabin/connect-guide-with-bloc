import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar(
      {super.key, this.title,this.subtitle, this.hideBack = false, this.action});

  final Widget? title;
  final Widget? subtitle;
  final bool hideBack;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      // title: title ?? const Text(''),
      title: Column(
        children: [
          title ?? const Text(''),
          subtitle ?? const Text(''),
        ],
      ),
      actions: [
        action ?? Container(),
      ],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color:Colors.black.withOpacity(0.04),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color:  Colors.black,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}