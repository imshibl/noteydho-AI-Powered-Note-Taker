import 'package:flutter/material.dart';
import 'package:noteydho/features/home/widgets/main_app_bar.dart';
import 'package:noteydho/features/home/widgets/main_drawer.dart';
import 'package:noteydho/features/my_notes/views/my_notes.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainDrawer(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainAppBar(),
                  MyNotesView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
