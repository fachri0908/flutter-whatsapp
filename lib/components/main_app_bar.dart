import 'package:flutter/material.dart';
import 'package:whatsapp_clone/routes.dart';
import 'package:whatsapp_clone/ui/color.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int selectedMenu;
  const MainAppBar({
    required this.selectedMenu,
    super.key
  });

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MainAppBarState extends State<MainAppBar> {
  bool showSearch = false;

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getAppbarTitle() {
      switch (widget.selectedMenu) {
        case 0:
          return 'Whatsapp';
        case 1:
          return 'Status';
        case 2:
          return 'Communities';
        case 3:
          return 'Call';
        default:
          return 'Whatsapp';
      }
    }

    void selectOptionMenu(String selectedMenu) {
      if(selectedMenu == 'Logout') {
        Navigator.pushNamed(context, AppRoutes.login);
      }
    }

    return !showSearch
        ? AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: AppColors.backgroundPrimary,
            leadingWidth: 0,
            title: Text(
              getAppbarTitle(),
              style: const TextStyle(color: AppColors.textPrimary),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    showSearch = true;
                  });
                },
                icon: const Icon(
                  Icons.search,
                  color: AppColors.textPrimary,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_outlined,
                  color: AppColors.textPrimary,
                ),
              ),
              PopupMenuButton<String>(
                position: PopupMenuPosition.under,
                color: AppColors.backgroundBlack,
                onSelected: selectOptionMenu,
                itemBuilder: (BuildContext context) {
                  return {
                    'New Group',
                    'New Broadcast',
                    'Linked Device',
                    'Starred Messages',
                    'Settings',
                    'Logout'
                  }.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: const TextStyle(color: AppColors.textPrimary),
                      ),
                    );
                  }).toList();
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          )
        : AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: AppColors.backgroundPrimary,
            leadingWidth: 0,
            title: Container(
              height: 56,
              color: AppColors.backgroundPrimary,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundSecondary,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                showSearch = false;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 28,
                            ),
                            color: AppColors.textPrimary,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              cursorColor: AppColors.textPrimary,
                              decoration: const InputDecoration(
                                hintText: 'Search...',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.transparent,
                                hintStyle: TextStyle(
                                  color: AppColors.textSecondary
                                ),
                              ),
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      )
                    )
                  ),
                ],
              ),
            )
          );
  }
}
