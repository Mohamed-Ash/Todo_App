import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_todo_todo_todo/modules/screens/bottomNavigat/archived_task.dart';
import 'package:todo_todo_todo_todo/modules/screens/bottomNavigat/done_task_screen.dart';
import 'package:todo_todo_todo_todo/modules/screens/bottomNavigat/new_tasc_screen.dart';

part 'todo_app_state.dart';

class TodoAppCubit extends Cubit<TodoAppState> {
  TodoAppCubit() : super(TodoAppInitial());
  static TodoAppCubit get(context)=>BlocProvider.of(context);
   Database? database;
  int currentIndex = 0 ;
  bool isBottomSheetShown = false ;
  IconData fabIcon = Icons.edit;
  void changeFabIcon(){
    // IconData fabIcon = Icon as IconData;
    // emit(TodoAppChangeFabIconInitial());
  }
  void changeIndex (int index){
     currentIndex = index ;
     emit(TodoAppCurrentIndexInitial());
  }
  void bottomNavBar(){

  }
  List<String> titles = [
    'new task',
    'done task',
    'archived task',
  ];
  List<Widget> screens =[
    const NewTaskScreen(),
    const DoneTaskScreen(),
    const ArchivedTaskScreen()
  ];
  void createDatabase()async{
     database = await openDatabase(
      'newdata.db',
      version: 2,
      onCreate: (database,version)
      {
        // id integer
        // title String
        // time String
        // date String
        // status String
        print('database created');
        database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,time TEXT,date TEXT,status TEXT)').then((value) {
          print('table created');

        }).catchError((e){
          print('error when creating table ${e.toString()}');

        });
      },
      onOpen: (database){
        print('database opened');

      },
    );
  }
  void insertDatabase(){
    database!.transaction((txn)async{
     await txn.rawInsert('INSERT INTO tasks(title,time,date,status) VALUES("newTasks","20011","01155","new")')
         .then((value) {
           emit(TodoAppInsertToDatabaseInitial());
               print('$value inserted successfully');
             }).catchError((e){
       print('error when inserting record ${e.toString()}');

     });

    });
  }


  // void createDatabase(){
  //     openDatabase(
  //     'Todo.db',
  //     version: 1,
  //     onCreate:(database,version){
  //       database.execute('CREATE TABLE Test(id INTEGER PRIMARY KEY,title TEXT,time TEXT,date TEXT,status NEW)').then((value) =>
  //               {
  //
  //               print(' table created'),
  //               }).catchError((error){
  //                 print('Error When Inserting New Record ${error.toString()}');
  //
  //       });
  //
  //       } ,
  //     onOpen:(database){
  //       getDataFromDatabase(database);
  //       print('database opened');
  //     },
  //   ).then((value) {
  //     database = value ;
  //     emit(TodoAppDatabaseInitial());
  //     }) ;
  // }
  //
  // void getDataFromDatabase(database){
  //
  //      database!.rawQuery('SELECT * FROM Test');
  //      emit(TodoAppGetDataFromDatabaseInitial());
  // }
}
//       database!.rawQuery('SELECT COUNT(*) FROM Test');
