// home_app_bar.dart
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/color.dart';

class ChatCategories extends StatelessWidget implements PreferredSizeWidget {
  const ChatCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      
      const SizedBox(height: 10),
      Row(
        children: [
          const SizedBox(width: 10),
          FilledButton(
            onPressed: () {},
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(AppColors.ribbonPrimary)),
            child: const Text(
              'All',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          const SizedBox(width: 10),
          FilledButton(
            onPressed: () {},
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(AppColors.ribbonSecondary)),
            child: const Text(
              'Unread',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          const SizedBox(width: 10),
          FilledButton(
            onPressed: () {},
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(AppColors.ribbonSecondary)),
            child: const Text(
              'Favorites',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          const SizedBox(width: 10),
          FilledButton(
            onPressed: () {},
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(AppColors.ribbonSecondary)),
            child: const Text(
              'Groups',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
    ]);
  }

  // Required override for PreferredSizeWidget to define AppBar's size
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
