import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harmo_futsal/core/failure/failure.dart';
import 'package:harmo_futsal/features/auth/domain/entity/student_entity.dart';
import 'package:harmo_futsal/features/auth/domain/use_case/auth_usecase.dart';
import 'package:harmo_futsal/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late AuthUseCase mockAuthUsecase;
  late ProviderContainer container;
  late BuildContext context;

  setUpAll(() {
    mockAuthUsecase = MockAuthUseCase();
    context = MockBuildContext();
    container = ProviderContainer(
      overrides: [
        authViewModelProvider.overrideWith(
          (ref) => AuthViewModel(mockAuthUsecase),
        )
      ],
    );
  });
  // initial state
  test('check for the initial state', () async {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
  });

  // login wiht valid user

  test('login with valid username and password', () async {
    when(mockAuthUsecase.loginUser('ManjeshSilwal', '12345678'))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container
        .read(authViewModelProvider.notifier)
        .loginUser(context, 'ManjeshSilwal', '12345678');

    final authState = container.read(authViewModelProvider);

    expect(authState.error, isNull);
  });

  // login with invalid user

  test('check for invalid username and password', () async {
    when(mockAuthUsecase.loginUser('manjesh', '123456'))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Invalid user'))));

    await container
        .read(authViewModelProvider.notifier)
        .loginUser(context, 'manjesh', '123456');

    final authState = container.read(authViewModelProvider);

    expect(authState.error, 'Invalid user');
  });
  test('register test with valid name, email and password', () async {
    UserEntity user = const UserEntity(
        fname: 'Manjesh',
        lname: "silwal",
        userName: "manjesh",
        phoneNum: "999999",
        email: 'manjesh@gmail.com',
        password: '123456');
    when(mockAuthUsecase.registerUser(user))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container.read(authViewModelProvider.notifier).registerUser(user);
    //checking the actual state
    // ignore: non_constant_identifier_names
    final AuthState = container.read(authViewModelProvider);

    expect(AuthState.error, isNotNull);
  });

  tearDownAll(() {
    container.dispose();
  });
}
