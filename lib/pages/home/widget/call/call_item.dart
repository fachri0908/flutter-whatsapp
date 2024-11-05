import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/color.dart';

class CallItem extends StatelessWidget {
  CallItem({super.key});

  final List<String> items =
      List<String>.generate(10, (index) => 'Name ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Column(
            children: [
              SizedBox(height: 10),
              SizedBox(height: 10),
            ]
          );
        } else {
          
          return InkWell(
            key: ValueKey('call-list-$index'),
            onTap: () {
              Navigator.pushNamed(context, '/call');
            },
            splashColor: Colors.white,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
              leading: const Icon(
                Icons.supervised_user_circle_outlined,
                size: 64,
              ),
              title: Text(
                items[index-1],
                style: const TextStyle(color: AppColors.textPrimary),
              ),
              subtitle: const Text(
                'Today, 1:44 PM',
                style: TextStyle(color: Color(0xff9FA2A7)),
              ),
              trailing: const Icon(
                Icons.video_call_outlined,
                color: AppColors.textPrimary,
              )
            ),
          );
        }
      },
    );
  }
}
