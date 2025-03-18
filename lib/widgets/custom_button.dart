
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key , required this.ontap});
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(12)),
        child: const Center(
          child: Text(
            'Add',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}