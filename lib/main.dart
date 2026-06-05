import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pro_todoapp/core/main_widgets/on_tap.dart';
import 'package:pro_todoapp/core/services/hive_service.dart';
import 'package:pro_todoapp/core/services/internet_connection_service.dart';
import 'package:pro_todoapp/core/theme/app_theme.dart';
import 'package:pro_todoapp/core/toasts/error_toast.dart';
import 'package:pro_todoapp/core/toasts/success_toast.dart';
import 'package:pro_todoapp/core/toasts/warning_toast.dart';
import 'package:pro_todoapp/presentation/home_page/bloc/home_bloc.dart';
import 'package:pro_todoapp/presentation/home_page/home_page.dart';
import 'package:pro_todoapp/presentation/todo_page/bloc/todo_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().initialize();
  connectionService.onStatusChange.listen((status) {
    if (status == InternetConnectionStatus.connected) {
      showSuccessToast('Connected to the internet');
    } else if (status == InternetConnectionStatus.disconnected) {
      showErrorToast('No internet connection');
    } else if (status == InternetConnectionStatus.slow) {
      showWarningToast('Slow internet connection');
    }
  });
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
