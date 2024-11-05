// home_app_bar.dart
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/color.dart';

class CallAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CallAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leadingWidth: 36,
      toolbarHeight: 75,
      backgroundColor: AppColors.backgroundPrimary,
      leading: InkWell(
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: const Icon(
            Icons.arrow_back,
            size: 32,
            color: AppColors.textSecondary,
          ),
        ),
      title: const Text(
        'Call Info',
        style: TextStyle(color: AppColors.textPrimary),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.message_outlined,
            color: AppColors.textPrimary,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  // Required override for PreferredSizeWidget to define AppBar's size
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
