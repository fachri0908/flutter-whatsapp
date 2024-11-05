import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/home/widget/call/call_item.dart';
import 'package:whatsapp_clone/ui/color.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundPrimary,
      child: Column(children: <Widget>[
        const Divider(
          color: AppColors.backgroundSecondary,
          height: 1,
        ),
        Expanded(
          child: CallItem()
        )
      ]),
    );
  }
}
