import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteydho/config/router.dart';
import 'package:noteydho/features/my_notes/models/note_category.model.dart';
import 'package:noteydho/features/my_notes/widgets/note_category_card.dart';
import 'package:noteydho/utils/consts/consts.dart';

class MyNotesView extends StatefulWidget {
  const MyNotesView({super.key});

  @override
  State<MyNotesView> createState() => _MyNotesViewState();
}

class _MyNotesViewState extends State<MyNotesView> {
  List<NoteCategoryModel> subjects = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: Consts.padding10),
              child: Text(
                "My Notes",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      letterSpacing: Consts.letterSpacing05,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Create Note +"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Consts.padding10,
            top: Consts.padding10,
          ),
          child: Wrap(
            children: subjects.map((subject) {
              return GestureDetector(
                onTap: () => context.push(AppRouter.noteList),
                child: NoteCategoryCard(
                  subject: subject,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
