import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc2/presentation/home/view/home_page.dart';
import 'package:flutter_bloc2/splash/cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        if(state.status == SplashStatus.success ){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.airplane_ticket,
                  size: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                CircularProgressIndicator.adaptive()
              ],
            ),
          ),
        );
      },
    );
  }
}
