import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState()){
    _init();
  }
   void _init(){
    Future.delayed(const Duration(seconds: 3), (){
      emit(state.copyWith(status: SplashStatus.success));
    });
  }
}
