import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        title: Text(
          'ChatMe',
          style: GoogleFonts.jua(),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Color(0xFF5676E7),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            alignment: Alignment.center,
            child: const Icon(
              FontAwesomeIcons.bars,
              size: 16,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Color(0xFF5676E7),
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              alignment: Alignment.center,
              child: const Icon(
                FontAwesomeIcons.search,
                size: 16,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(24),
                  ),
                  child: Image.network(
                    'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John',
                        style: Get.textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Hey there!',
                        style: Get.textTheme.caption!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '10:45 AM',
                      style: Get.textTheme.overline!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Get.theme.primaryColor,
                      child: Text(
                        '2',
                        style: Get.textTheme.overline!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
        ),
      ),
    );
  }
}