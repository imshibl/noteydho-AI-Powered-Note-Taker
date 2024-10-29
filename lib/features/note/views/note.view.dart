import 'package:flutter/material.dart';
import 'package:noteydho/utils/consts/consts.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  final QuillEditorController controller = QuillEditorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Note 2'),
          elevation: 1,
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: QuillHtmlEditor(
                hintText: "Write your note here",
                hintTextStyle: TextStyle(color: Colors.grey.shade500),
                controller: controller,
                minHeight: MediaQuery.of(context).size.height,
                hintTextAlign: TextAlign.start,
                padding: const EdgeInsets.only(left: 10, top: 5),
                hintTextPadding: EdgeInsets.zero,
                loadingBuilder: (context) {
                  return const SizedBox();
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                  horizontal: Consts.margin10, vertical: Consts.margin10),
              padding: const EdgeInsets.all(Consts.padding10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Consts.radius10,
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: ToolBar.scroll(
                toolBarColor: Colors.white,
                activeIconColor: Colors.green,
                padding: const EdgeInsets.all(8),
                direction: Axis.horizontal,
                iconSize: 20,
                controller: controller,
                customButtons: [
                  InkWell(onTap: () {}, child: const Icon(Icons.favorite)),
                  InkWell(onTap: () {}, child: const Icon(Icons.add_circle)),
                ],
              ),
            ),
          ],
        ));
  }
}
