import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/home/widget/search/search_result_item.dart';
import 'package:whatsapp_clone/ui/color.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundPrimary,
      child: const Column(children: <Widget>[
       Divider(
          color: AppColors.backgroundSecondary,
          height: 1,
        ),
        Expanded(
          child: SearchResultItem()
        )
      ]),
    );
  }
}
