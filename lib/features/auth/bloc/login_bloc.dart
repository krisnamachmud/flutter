import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/auth_api_service.dart';
import '../data/session_storage.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthApiService authApiService,
    required SessionStorage sessionStorage,
  })
    : _authApiService = authApiService,
      _sessionStorage = sessionStorage,
      super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  final AuthApiService _authApiService;
  final SessionStorage _sessionStorage;

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState(status: LoginStatus.loading));
    try {
      final token = await _authApiService.login(
        email: event.email,
        password: event.password,
      );
      await _sessionStorage.saveToken(token);

      emit(LoginState(status: LoginStatus.success, token: token));
    } catch (error) {
      emit(
        LoginState(
          status: LoginStatus.failure,
          errorMessage: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}
