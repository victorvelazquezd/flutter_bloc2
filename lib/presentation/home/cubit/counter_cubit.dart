import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc2/presentation/home/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(): super( const CounterState());

  void increment() {
    emit(state.copyWith(counter: state.counter +1));
  }
}
