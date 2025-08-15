import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<AppStarted>((event, emit) async {
      emit(SplashLoading());
      // تم تعديل المدة إلى دقيقتين (120 ثانية)
      await Future.delayed(const Duration(minutes: 1));
      emit(SplashLoaded());
    });
  }
}