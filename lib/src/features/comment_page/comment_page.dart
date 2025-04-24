import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/mood_enrty_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/back_next_section.dart';
import 'package:mood_tracking_app/src/core/widgets/custom_scaffold.dart';
import 'package:mood_tracking_app/src/core/widgets/custom_text_field.dart';
import 'package:mood_tracking_app/src/core/widgets/step_indicator.dart';
import 'package:mood_tracking_app/src/core/widgets/vertical_gap_widget.dart';

class CommentPage extends ConsumerStatefulWidget {
  const CommentPage({super.key});

  @override
  ConsumerState createState() => _MoodCommentPageState();
}

class _MoodCommentPageState extends ConsumerState<CommentPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      title: const Text('Mood'),
      body: Column(
        children: [
          const VerticalGapWidget(),
          const StepIndicator(numSteps: 2, pageIndex: 1),
          const VerticalGapWidget(),
          Text(
            'Do you want to enter a comment?',
            style: textTheme.bodyLarge,
          ),
          const VerticalGapWidget(),
          Card(
            child: CustomTextField(
              maxLines: 8,
              onChange: (final value) {
                ref.read(moodEntryProvider.notifier).updateNote(value);
              },
              controller: _controller,
            ),
          ),
          const VerticalGapWidget(),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF2FCD9),
                  Color(0xFFE1F8B7),
                  Color(0xFFD4F29E),
                  Color(0xFFC6EC85),
                ],
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  foregroundImage: AssetImage('assets/images/image.png'),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tell me how you were doing!',
                      ),
                      Text(
                        'Use this field to record your feelings, special moments, or progress.',
                        style: textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const BackNextSection(pageIndex: 1),
        ],
      ),
    );
  }
}
