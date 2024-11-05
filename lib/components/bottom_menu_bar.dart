import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/color.dart';

class BottomMenuBar extends StatelessWidget {
  final Function(int selectedMenu) onMenuTap;
  final int selectedMenu;

  const BottomMenuBar({
    super.key, 
    required this.onMenuTap, 
    required this.selectedMenu
  });

  @override
  Widget build(BuildContext context) {
    getMenuColor(int menu)  {
      if(selectedMenu == menu) {
        return const WidgetStatePropertyAll(AppColors.ribbonPrimary);
      } else {
        return WidgetStateColor.transparent;
      }
    }
    return Container(
      color: AppColors.backgroundPrimary,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: getMenuColor(0),
                ),
                onPressed: (){
                  onMenuTap(0);
                }, 
                child: const Icon(
                  Icons.message_outlined,
                  color: AppColors.textPrimary,
                ),
              ),
              const Text(
                'Chats',
                style: TextStyle(color: AppColors.textPrimary),
              )
            ],
          ),
          Column(
            children: [
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: getMenuColor(1),
                ),
                onPressed: (){
                  onMenuTap(1);
                }, 
                child: const Icon(
                  Icons.donut_large_outlined,
                  color: AppColors.textPrimary,
                ),
              ),
              
              const Text(
                'Updates',
                style: TextStyle(color: AppColors.textPrimary),
              )
            ],
          ),
          Column(
            children: [
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: getMenuColor(2),
                ),
                onPressed: (){
                  onMenuTap(2);
                }, 
                child: const Icon(
                  Icons.people_alt_outlined,
                  color: AppColors.textPrimary,
                ),
              ),
              const Text(
                'Communities',
                style: TextStyle(color: AppColors.textPrimary),
              )
            ],
          ),
          Column(
            children: [
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: getMenuColor(3),
                ),
                onPressed: (){
                  onMenuTap(3);
                },
                child: const Icon(
                  Icons.phone,
                  color: AppColors.textPrimary,
                ),
              ),
              const Text(
                'Calls',
                style: TextStyle(color: AppColors.textPrimary),
              )
            ],
          )
        ],
      ),
    );
  }

}
