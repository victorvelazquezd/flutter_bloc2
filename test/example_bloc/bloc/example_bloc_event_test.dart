// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc2/presentation/example_bloc/bloc/bloc.dart';

void main() {
  group('ExampleBlocEvent', () {  
    group('CustomExampleBlocEvent', () {
      test('supports value equality', () {
        expect(
          CustomExampleBlocEvent(),
          equals(const CustomExampleBlocEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomExampleBlocEvent(),
          isNotNull
        );
      });
    });
  });
}
