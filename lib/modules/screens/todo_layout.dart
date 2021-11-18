import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_todo_todo_todo/cubit/todo_app_cubit.dart';
import 'package:todo_todo_todo_todo/shared/components.dart';
// 1. create database
// 2. create tables
// 3. open database
// 4. insert to database
// 5. get data from database
// 6. update in database
// 7. delete from database

class TodoAppLayOut extends StatelessWidget {
   TodoAppLayOut({Key? key}) : super(key: key);
var scaffoldKye = GlobalKey<ScaffoldState>();
var formKye = GlobalKey<FormState>();
var titleController = TextEditingController();
var timeController = TextEditingController();
var dateController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoAppCubit()..createDatabase(),
      child: BlocConsumer<TodoAppCubit, TodoAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          TodoAppCubit cubit = TodoAppCubit.get(context);
          return Scaffold(
            key: scaffoldKye,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body:cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(

              onPressed: () {
               if(cubit.isBottomSheetShown)
                 {
                   Navigator.pop(context);
                   cubit.isBottomSheetShown= false;
                   cubit.fabIcon= Icons.edit;
                 }else{
                 scaffoldKye.currentState!.showBottomSheet((context) => Column(
                   children: [
                     defaultFormField(
                         prefix: Icons.title,
                         validate: null,
                         controller: titleController.text,
                         label: 'Title',
                         type: null
                     )
                   ],
                 ));
                 cubit.isBottomSheetShown = true;
                 cubit.fabIcon=Icons.add;
               }
              },
              child: Icon(cubit.fabIcon),
            ),
          );
        },
      ),
    );
  }
  // void createDatabase()async{
  //  var database = await openDatabase(
  //    'newData.db',
  //    version: 1,
  //    onCreate: (database,version)
  //    {
  //      // id integer
  //      // title String
  //      // time String
  //      // date String
  //      // status String
  //      print('database created');
  //      database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,time TEXT,date TEXT,status TEXT)').then((value) {
  //        print('table created');
  //
  //      }).catchError((e){
  //        print('error when creating table ${e.toString()}');
  //
  //      });
  //    },
  //    onOpen: (database){
  //      print('database opened');
  //
  //    },
  //  );
  // }
  // void insertDatabase(){}

}
// floatingActionButton: FloatingActionButton(
// onPressed: (){
// if(cubit.isBottomSheetShown){
// if(formKye.currentState!.validate()){
// cubit.insertToDatabase(
// title: titleController.text,
// time: timeController.text,
// date: dateController.text
// );
// }
//
// }else{
// scaffoldKye.currentState!.showBottomSheet((context) {
// return Form(
// key: formKye,
// child: Column(
// children: [
// defaultFormField(label: 'Title',
// controller: titleController,
// prefix:Icons.title,
//
// type: TextInputType.text,
// validate: (String value){
// if (value.isEmpty) {
// return 'title must not be empty';
// }else{
// return null ;
// }},
//
//
// ),
// defaultFormField(label: 'time',
// controller: timeController,
// prefix:Icons.title,
// onTap: (){
// showTimePicker(context: context,
// initialTime:TimeOfDay.now() ).then((value) {
// timeController.text=value!.format(context).toString();
// });
// },
// type: TextInputType.text,
// validate: (String value){
// if (value.isEmpty) {
// return 'title must not be empty';
// }else{
// return null ;
// }},
//
//
// ),
// defaultFormField(label: 'date',
// controller: dateController,
// prefix:Icons.title,
// onTap: (){
// showDatePicker(
// context: context,
// initialDate: DateTime.now(),
// lastDate: DateTime.parse('2022-05-05'),
// firstDate: DateTime.now(),
//
// ).then((value) {
// dateController.text=  DateFormat.yMMMd().format(value!);
// });
// },
// type: TextInputType.text,
// validate: (String value){
// if (value.isEmpty) {
// return 'title must not be empty';
// }else{
// return null ;
// }},
//
//
// ),
// ],
// ));
// });
// }
// },
// child: const Icon(Icons.add),
// ),