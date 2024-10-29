import 'package:go_router/go_router.dart';
import 'package:noteydho/features/auth/views/auth.view.dart';
import 'package:noteydho/features/home/views/home.view.dart';
import 'package:noteydho/features/note/views/note.view.dart';
import 'package:noteydho/features/note_list/views/note_list.view.dart';

class AppRouter {
  static const String initial = '/auth';
  static const String home = '/home';
  static const String noteList = '/noteList';
  static const String note = '/note';

  static final GoRouter router = GoRouter(
    initialLocation: initial,
    routes: [
      GoRoute(
        path: initial,
        builder: (context, state) => const AuthenticationView(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: noteList,
        builder: (context, state) => const NoteListView(),
      ),
      GoRoute(
        path: note,
        builder: (context, state) => const NoteView(),
      ),
    ],
  );
}
