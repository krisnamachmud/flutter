enum LoginStatus { initial, loading, success, failure }

class LoginState {
  const LoginState({
    this.status = LoginStatus.initial,
    this.errorMessage,
    this.token,
  });

  final LoginStatus status;
  final String? errorMessage;
  final String? token;

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
    String? token,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      token: token ?? this.token,
    );
  }
}
