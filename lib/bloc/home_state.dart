// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucces extends HomeState {
  final List<User> users;
  const HomeSucces({
    required this.users,
  });
}

class HomeError extends HomeState {}
