import 'dart:developer';

import 'package:chatme/ui/widgets/my_appbar_action_button.dart';
import 'package:chatme/ui/widgets/my_button.dart';
import 'package:chatme/ui/widgets/my_rounded_body_container.dart';
import 'package:chatme/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ChatRoomPage extends StatefulWidget {
  static const routeName = '/chatroom';

  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final _customGrey = const Color(0xFFEFEFEF);
  final _messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        title: Builder(
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'John',
                  style: Get.textTheme.headline6!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'online',
                  style: Get.textTheme.caption!.copyWith(
                    color: Colors.white,
                  ),
                )
              ],
            );
          },
        ),
        leading: MyAppBarActionButton(
          onPressed: () {},
          icon: FontAwesomeIcons.arrowLeft,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: InkWell(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Image.network(
                    'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: MyRoundedBodyContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: index % 2 == 0
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? const Color(0xFF5676E7)
                              : _customGrey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(index % 2 == 0 ? 16 : 0),
                            topRight: Radius.circular(index % 2 == 0 ? 0 : 16),
                            bottomLeft: const Radius.circular(16),
                            bottomRight: const Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          index % 2 == 0 ? 'Have a good day! 😘' : 'You too! 😊',
                          style: Get.textTheme.bodyText1!.copyWith(
                            color: index % 2 == 0 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '10:45 AM',
                        style: Get.textTheme.overline!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemCount: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: MyTextField(
                        controller: _messageController,
                        fillColor: _customGrey,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 16,
                        ),
                        hintText: 'Type a message',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: IconButton(
                            onPressed: () {
                              log('images clicked!');
                            },
                            icon: const Icon(
                              FontAwesomeIcons.solidImages,
                              color: Color(0xFFADADAD),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: MyButton(
                      onTap: () {},
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.solidPaperPlane,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
