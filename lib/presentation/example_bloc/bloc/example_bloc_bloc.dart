import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc2/presentation/data/models/pokemon_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'example_bloc_event.dart';
part 'example_bloc_state.dart';

class ExampleBlocBloc extends Bloc<ExampleBlocEvent, ExampleBlocState> {
  ExampleBlocBloc() : super( ExampleBlocInitial()) {
    on<CustomExampleBlocEvent>(_onCustomExampleBlocEvent);
  }

  FutureOr<void> _onCustomExampleBlocEvent(
    CustomExampleBlocEvent event,
    Emitter<ExampleBlocState> emit,
  ) {
    // TODO: Add Logic
  }
}
