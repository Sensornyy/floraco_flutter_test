import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:floraco_flutter_test/dependencies.dart' as di;
import 'package:floraco_flutter_test/core/navigation/navigation_bloc.dart';
import 'package:floraco_flutter_test/src/features/choice/presentation/page/choice_page.dart';
import 'package:floraco_flutter_test/src/features/summary/presentation/page/summary_page.dart';
import 'package:floraco_flutter_test/src/features/date_of_birth/presentation/page/date_of_birth_page.dart';
import 'package:floraco_flutter_test/src/features/summary/presentation/bloc/summary_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(
            create: (context) => NavigationBloc(),
          ),
          BlocProvider<SummaryBloc>(
            create: (context) => SummaryBloc(),
          ),
        ],
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return state.when(
              choice: () => const ChoicePage(),
              dateOfBirth: () => const DateOfBirth(),
              summary: () => const SummaryPage(),
            );
          },
        ),
      ),
    );
  }
}
