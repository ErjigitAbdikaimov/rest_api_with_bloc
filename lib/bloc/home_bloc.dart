// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rest_api_with_bloc/models/user_model.dart';
import 'package:rest_api_with_bloc/service/home_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this.service,
  ) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
  }

  final HomeService service;

  Future<void> getUsers(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final users = await service.getUsers();
    if (users != null) {
      emit(HomeSucces(users: users));
    } else {
      emit(HomeError());
    }
  }
}
