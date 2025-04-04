import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.ontap, required this.isloading});
  final void Function()? ontap;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: isloading
              ? SizedBox(
                  height: 28,
                  width: 28,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    backgroundColor: Colors.black54,
                    strokeWidth: 4,
                  ),
                )
              : Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
        ),
      ),
    );
  }
}
