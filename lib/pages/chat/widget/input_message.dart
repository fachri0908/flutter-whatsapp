import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:whatsapp_clone/ui/color.dart';

class InputMessage extends StatefulWidget {
  final Function(String) onSendMessage;
  
  const InputMessage({
    required this.onSendMessage,
    super.key
  });
  
  @override
  State<InputMessage> createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  final TextEditingController _messageController = TextEditingController();

  onChangeMessage () {
    if(_messageController.value.text.isNotEmpty) {
      widget.onSendMessage(_messageController.value.text);
      _messageController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundPrimary,
      height: 80,
      padding: const EdgeInsets.only(left: 8, bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
              color: AppColors.backgroundSecondary,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){}, 
                    icon: const Icon(
                      Icons.emoji_emotions_outlined
                    ),
                    color: AppColors.textPrimary,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      cursorColor: AppColors.textPrimary,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        hintStyle: const TextStyle(
                          color: AppColors.textSecondary
                        ),
                      ),
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  CustomPopup(
                    contentPadding: const EdgeInsets.all(20),
                    backgroundColor: AppColors.backgroundBlack,
                    arrowColor: AppColors.backgroundBlack,
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 30,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.backgroundSecondary,
                              border: Border.all(color: Colors.white24)

                            ),
                            child: const Center(
                              child: Icon(
                              Icons.file_copy,
                              color: Colors.blue,
                            ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.backgroundSecondary,
                              border: Border.all(color: Colors.white24)

                            ),
                            child: const Center(
                              child: Icon(
                              Icons.camera_alt,
                              color: Colors.red,
                            ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.backgroundSecondary,
                              border: Border.all(color: Colors.white24)

                            ),
                            child: const Center(
                              child: Icon(
                              Icons.location_pin,
                              color: Colors.green,
                            ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.backgroundSecondary,
                              border: Border.all(color: Colors.white24)

                            ),
                            child: const Center(
                              child: Icon(
                              Icons.people,
                              color: Colors.cyan,
                            ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.backgroundSecondary,
                              border: Border.all(color: Colors.white24)

                            ),
                            child: const Center(
                              child: Icon(
                              Icons.file_copy,
                              color: Colors.purple,
                            ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.backgroundSecondary,
                              border: Border.all(color: Colors.white24)

                            ),
                            child: const Center(
                              child: Icon(
                              Icons.headphones,
                              color: Colors.orange,
                            ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.backgroundSecondary,
                              border: Border.all(color: Colors.white24)
                            ),
                            child: const Center(
                              child: Icon(
                              Icons.bar_chart,
                              color: Colors.yellow,
                            ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.backgroundSecondary,
                              border: Border.all(color: Colors.white24)

                            ),
                            child: const Center(
                              child: Icon(
                              Icons.video_call,
                              color: Colors.lightGreen,
                            ),
                            ),
                          ),
                        ],
                      ),
                    ), 
                    child: const Icon(
                        Icons.attach_file_outlined,
                        color: AppColors.textPrimary,
                    ), 
                  ),

                  
                  IconButton(
                    onPressed: (){}, 
                    icon: const Icon(
                      Icons.camera_alt_outlined
                    ),
                    color: AppColors.textPrimary,
                  ),
                ],
              )
            )
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: onChangeMessage,
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.textHighlighted,
                ),
                child: const Icon(
                  Icons.send, 
                  color: AppColors.black
                ),
              ),
            )
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}