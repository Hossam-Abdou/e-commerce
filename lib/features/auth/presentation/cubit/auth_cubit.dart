import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/domain/entities/sign_up_entity.dart';
import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart';
import '../../../../core/utils/enums.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthLoginState> {
  LoginUseCase loginUseCase;

  SignUpUseCase signUpUseCase;

  AuthCubit(this.loginUseCase, this.signUpUseCase) : super(AuthLoginInit());

  login(
    String? email,
    String? password,
  ) async {
    state.copyWith(requestState: RequestState.loading);
    var data = await loginUseCase.call(email!, password!);

    data.fold(
      (l) {
        emit(state.copyWith(
          loggedIn: false,
          requestState: RequestState.error,
          errorMessage: l.message,
        ));
      },
      (r) {
        emit(state.copyWith(
          loggedIn: r,
          requestState: RequestState.success,
        ));
      },
    );
  }

  signUp(SignUpEntity? signUpEntity) async {
    var data = await signUpUseCase.call(signUpEntity!);

    data.fold(
      (l) {
        emit(state.copyWith(
          requestState: RequestState.error,
        ));
      },
      (r) {
        emit(state.copyWith(
          requestState: RequestState.success,
        ));
      },
    );
  }
}
