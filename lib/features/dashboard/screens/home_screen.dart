import 'package:demo_crypto_checker/features/dashboard/bloc/todo/todo_bloc.dart';
import 'package:demo_crypto_checker/features/dashboard/bloc/todo/todo_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //     create: (context) => getIt<TodoBloc>(),
    //     child: HomeScreenWidget(),
    // );
    return HomeScreenWidget();
  }
}

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Provider<TodoBloc>(
      create: (context) => GetIt.I<TodoBloc>(),
      child: Consumer<TodoBloc>(
        builder: (context, bloc, child) {
          return Text(bloc.state.toString());
        },
      )
    );
  }
}
