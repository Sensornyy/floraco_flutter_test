import 'package:floraco_flutter_test/core/navigation/navigation_bloc.dart';
import 'package:floraco_flutter_test/src/features/choice/presentation/page/choice_page.dart';
import 'package:flutter/material.dart';

import 'package:floraco_flutter_test/src/features/date_of_birth/presentation/page/date_of_birth_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return state.when(
              choice: () => const ChoicePage(),
              dateOfBirth: () => const DateOfBirth(),
              summary: () => const Scaffold(),
            );
          },
        ),
      ),
    );
  }
}
