part of 'todo_app_cubit.dart';

@immutable
abstract class TodoAppState {}

class TodoAppInitial extends TodoAppState {}
class TodoAppCurrentIndexInitial extends TodoAppState {}
class TodoAppInsertToDatabaseInitial extends TodoAppState {}
class TodoAppChangeFabIconInitial extends TodoAppState {}
class TodoAppDatabaseInitial extends TodoAppState {}
