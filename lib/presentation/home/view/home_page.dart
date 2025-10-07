import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc2/presentation/home/cubit/counter_cubit.dart';
import 'package:flutter_bloc2/presentation/home/cubit/counter_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterCubit()..getFakeData(), child: const MyHomeView ());
  }
}

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});


  @override
  Widget build(BuildContext context) {
    final counter = context.read<CounterCubit>();

    void incrementCounter() {
      counter.increment();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bloc/Cubit'),
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.status == CounterStatus.success) {
            print("Success");
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case CounterStatus.initial:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CounterStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CounterStatus.success:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${counter.state.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
              );
            case CounterStatus.error:
              return const Center(
                child: Text('Error'),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
