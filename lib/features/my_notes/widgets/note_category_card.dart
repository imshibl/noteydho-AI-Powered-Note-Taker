import 'package:flutter/material.dart';
import 'package:noteydho/features/my_notes/models/note_category.model.dart';
import 'package:noteydho/utils/consts/consts.dart';

class NoteCategoryCard extends StatelessWidget {
  const NoteCategoryCard({
    super.key,
    required this.subject,
    this.onDelete,
  });

  final NoteCategoryModel subject;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 150,
      decoration: BoxDecoration(
        color: subject.color,
        borderRadius: BorderRadius.circular(Consts.radius10),
      ),
      margin: const EdgeInsets.all(Consts.margin5),
      padding: const EdgeInsets.all(Consts.padding10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.bookmark_outline),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Consts.radius10),
                ),
                padding: const EdgeInsets.all(0),
                onSelected: (value) {
                  if (value == 'delete' && onDelete != null) {
                    onDelete!();
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Row(
                      children: [
                        const Icon(
                          Icons.delete,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Delete',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            subject.categoryName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "10 notes",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
