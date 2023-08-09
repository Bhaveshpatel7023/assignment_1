import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_theam/app_colors.dart';

class EditCustomTextFieldWidget extends StatefulWidget {
  final controller;
  final String hintText;
  final keybordtype;
  final Enable;
  final validator;
  const EditCustomTextFieldWidget({Key? key, this.controller, required this.hintText, this.keybordtype, this.Enable,this.validator}) : super(key: key);

  @override
  State<EditCustomTextFieldWidget> createState() => _EditCustomTextFieldWidgetState();
}

class _EditCustomTextFieldWidgetState extends State<EditCustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 75,
      width: MediaQuery.of(context).size.width * 1,
      child: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: primaryColor,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: TextFormField(
            validator: widget.validator,
            enabled: widget.Enable,
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
            controller: widget.controller,
            // onChanged:(String){ onChanged},
            keyboardType: widget.keybordtype,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.black26,fontSize: 17),
              contentPadding: const EdgeInsets.only(
                left: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
