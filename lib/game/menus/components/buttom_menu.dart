import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  final dynamic onPressed;
  final String title;
  final IconData icono;
  const ButtonMenu(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.icono})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)))),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(icono),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          )),
    );
  }
}
