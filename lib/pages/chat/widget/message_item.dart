import 'package:flutter/material.dart';
import 'package:whatsapp_clone/helpers/date_helper.dart';
import 'package:whatsapp_clone/ui/color.dart';

class MessageItem extends StatelessWidget {
  final String text;
  final int time;
  final int isSentByMe;

  MessageItem({
    super.key,
    required this.text,
    required this.time,
    required this.isSentByMe,
  });

  final List<String> items =
      List<String>.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      alignment: isSentByMe == 1 ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSentByMe == 1 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSentByMe == 1
                    ? AppColors.ribbonPrimary
                    : AppColors.ribbonSecondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: (isSentByMe == 1) ? 61 : 45,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              DateHelper.formatIntDateToHourOnly(time),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            if(isSentByMe == 1) const SizedBox(width: 2),
                            if(isSentByMe == 1) const Icon(
                                Icons.done_all,
                                color: AppColors.textSecondary,
                                size: 14,
                              )
                          ],
                        ),
                      ),
                      
                    ],
                  )
                ],
              )),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
