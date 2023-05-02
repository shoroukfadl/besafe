import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget defaultButton({
  Color background = Colors.indigo,
  Color fontColor = Colors.white,
  double width = double.infinity,
  double height = 40,
  double radius = 0,
  double size = 20,
  Color borderColor = Colors.indigo,
  required String text,
  required Function function,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor),

      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: TextStyle(color: fontColor, fontSize: size),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required FormFieldValidator validate,
  required TextInputType type,
  required String label,
  required IconData prefix,
  IconData? suffix,
 Function? suffixPressed,
  String? hintText,
   ValueChanged<String>? onChanged,
  Function?onSubmit,
  // Function? onTap,
  bool isPassword =false,
}) =>
    TextFormField(
      controller: controller,
      validator: validate,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: () {
            suffixPressed;
          },
        )
            : null,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,

      onFieldSubmitted:(a) {
        onSubmit;
        return null;
      }
    );

Widget box({
  double width = 150,
  double height = 150,
  Color? background,
  Color? iconColor = Colors.white,
  double iconSize = 40,
  Color? textColor = Colors.white,
  double textSize = 30,
  double radius = 0,
  String? label,
  required IconData icon,
  required Function onTap,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadiusDirectional.circular(radius),
      ),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label!,
              style: TextStyle(fontSize: textSize, color: textColor),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Icon(icon, size: iconSize, color: iconColor),
          ],
        ),
      ),
    );

Widget cardMenu({
  required String title,
  required IconData icon,
  Function? onTap,
  Color color = Colors.white,
  Color fontColor = Colors.grey,
  double width = 160,
  double height = 80,
  Color iconColor = Colors.indigo,
  double? iconSize,
  double? fontSize,
}) {
  return GestureDetector(
    onTap: () {
      onTap!();
    },
    child: Container(
      // padding: const EdgeInsets.symmetric(vertical: 36,),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: fontColor,
                fontSize: fontSize),
          ),
          const SizedBox(width: 5),
          Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ],
      ),
    ),
  );
}

Widget boxWithSwitch({
  required String title,
  required IconData icon,
  Color color = Colors.white,
  Color fontColor = Colors.grey,
  double width = 156,
  Color iconColor = Colors.grey,
  double? iconSize,
  double? fontSize,
  bool value = false,
  Function? onChange,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 36,
    ),
    width: width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                  fontSize: fontSize),
            ),
          ],
        )
      ],
    ),
  );
}
