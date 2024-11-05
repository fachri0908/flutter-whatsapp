import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/color.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const ChatAppBar({
    required this.title,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leadingWidth: 90,
      toolbarHeight: 75,
      backgroundColor: AppColors.backgroundPrimary,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Icon(
                Icons.arrow_back,
                size: 32,
                color: AppColors.textSecondary,
              ),
            ),
            const Icon(
              Icons.supervised_user_circle_outlined,
              size: 40,
              color: AppColors.textSecondary,
            ),
          ],
        )
      ),
      title: Text(
        title,
        style: const TextStyle(color: AppColors.textPrimary),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.camera_outlined,
            color: AppColors.textPrimary,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
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
