import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/call/widget/call_app_bar.dart';
import 'package:whatsapp_clone/ui/color.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CallAppBar(),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10
                ),
                color: AppColors.backgroundPrimary,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      thickness: 0.05,
                    ),
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.supervised_user_circle_outlined,
                                  color: AppColors.textSecondary,
                                  size: 64,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text(
                                      'Username',
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 18
                                      ),
                                    ),
                                    Text(
                                      'Username',
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 18
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              
                              children: [
                                Icon(
                                  Icons.phone_outlined,
                                  color: AppColors.textPrimary,
                                  size: 32,
                                ),
                                SizedBox(width: 20),
                                Icon(
                                  Icons.video_call_outlined,
                                  color: AppColors.textPrimary,
                                  size: 32,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ),
                    Divider(
                      thickness: 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                      'Yesterday',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textSecondary
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.white,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
                        leading: Icon(
                          Icons.arrow_outward_outlined,
                          size: 32,
                          color: AppColors.textHighlighted,
                        ),
                        title: Text(
                          'Username',
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.video_call_outlined,
                              size: 24,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '8:26 PM',
                              style: TextStyle(color: Color(0xff9FA2A7)),
                            ),
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '4:39',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff9FA2A7)
                              ),
                            ),
                            Text(
                              '24.5 MB',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff9FA2A7)
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}