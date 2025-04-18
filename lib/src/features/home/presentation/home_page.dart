import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_tracking_app/src/core/providers/mood_image_path_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final svgImagesPathList = ref.read(moodImagesPathListProvider);
    final textTheme = Theme.of(context).textTheme;
    const moodColors = [
      Color(0xFFEB7E5A), // Sad
      Color(0xFFF3C75A), // Angry
      Color(0xFF84A4E8), // Neutral
      Color(0xFFDAE592), // Happy
      Color(0xFFA3C565), // Very Happy
    ];
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsetsDirectional.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.green, Colors.lightGreen],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.diamond,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '300',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.message_outlined,
                  size: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.date_range,
                  size: 40,
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color.fromRGBO(215, 211, 207, 1),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 18,
                          height: 18,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Admin',
                        style: textTheme.labelLarge,
                      ),
                      Text(
                        'How are you feeling today?',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 75,
                child: ListView.builder(
                  itemCount: svgImagesPathList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (final context, final index) {
                    const imagesBaseDirectory = 'assets/images';

                    return Container(
                      width: 75,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: moodColors[index],
                      ),
                      child: SvgPicture.asset(
                        '$imagesBaseDirectory/${svgImagesPathList[index]}',
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
