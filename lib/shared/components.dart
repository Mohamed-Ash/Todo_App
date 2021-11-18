import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTaskItem(){
  return Padding(padding: const EdgeInsets.all(15),
    child:  Row(
      children:  [
        const CircleAvatar(
          backgroundColor:Colors.blue ,
          child: Text('1',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white
            ),),
          radius: 40.0,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(child: Column(
          mainAxisSize:MainAxisSize.min ,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: const [
            Text(
              'Title ',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),
            ),
            Text(
              '2/11/1999',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ), ),

      ],
    ),
  );
}
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
   Function? onSubmit,
   Function? onChange,
   Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
   IconData? suffix,
   Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
     // onFieldSubmitted: onSubmit(),
      //onChanged: onChange(),
      onTap: onTap!(),
      validator: validate(),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null ?IconButton(
          onPressed: suffixPressed!(),
          icon: Icon(
            suffix,
          ),
        ) : null,
        border: const OutlineInputBorder(),
      ),
    );
