import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:random_number_generator/bloc/_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = GetIt.I<RandomNumberBloc>();
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.state,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            /// TODO
          }
          final state = snapshot.data;

          final children = state is! RandomNumberState
              ? CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                )
              : Text(
                  state.number.number.toString(),
                  style: theme.textTheme.headlineLarge,
                );

          return Center(child: children);
        },
      ),
    );
  }
}
