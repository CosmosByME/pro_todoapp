import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todoapp/core/main_widgets/on_tap.dart';
import 'package:pro_todoapp/core/services/hive_service.dart';
import 'package:pro_todoapp/core/theme/app_theme.dart';
import 'package:pro_todoapp/presentation/home_page/bloc/home_bloc.dart';
import 'package:pro_todoapp/presentation/home_page/home_page.dart';
import 'package:pro_todoapp/presentation/todo_page/bloc/todo_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await HiveService().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocProvider(
        create: (context) => TodoBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pro ToDo',
          theme: appTheme,
          home: OnTap(child: const HomePage()),
        ),
      ),
    );
  }
}

class CustomBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('Transition: $transition');
  }
}
