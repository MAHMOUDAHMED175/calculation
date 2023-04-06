import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function()? suffixPressd,
  Function()? taped,
  String? Function(String?)? validate,
  bool isPassword=false,
  String? Function(String?)? submit,
  IconData? suffixIcon,
   String? hintText,labelText,
   IconData? prefix,
  Color? fillsColor,
  bool? readOnly,
})=>TextFormField(
  textAlign: TextAlign.center,
  keyboardType:type,
  controller: controller,
  obscureText: isPassword,
  onFieldSubmitted: (s){
    submit!(s);
  },
  validator: validate,
  onTap: taped,
  readOnly: readOnly??false,
  decoration: InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),

    hintStyle: TextStyle(
      color: Colors.black, // تغيير لون الـ hint إلى اللون الأزرق
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.black),
    ),
    enabledBorder: OutlineInputBorder(

      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          bottomLeft: Radius.circular(35),

      ),
      borderSide: const BorderSide(color: Colors.black),
    ),
    filled: true,
    fillColor: fillsColor??Colors.grey[200],
      prefixIcon: prefix != null
          ? Icon(prefix)
          : null,
    hintText: hintText,
    suffixIcon: suffixIcon != null
        ? IconButton(
      onPressed: () {
        suffixPressd!();
      },
      icon: Icon(suffixIcon),
    )
        : null,
    labelText: labelText,
    border: const OutlineInputBorder(),
  ),
);





