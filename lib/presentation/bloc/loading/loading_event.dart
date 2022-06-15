part of 'loading_bloc.dart';

@immutable
abstract class LoadingEvent {}

class StartLoading extends LoadingEvent {}

class FinishLoading extends LoadingEvent {}
