import 'package:assignment_1/user_profile.dart';
import 'package:assignment_1/widget/edit_custom_widget.dart';
import 'package:flutter/material.dart';

import 'api_bloc_provider/api_methods.dart';
import 'app_theam/app_colors.dart';

class EditUserDetails extends StatefulWidget {
  const EditUserDetails({Key? key}) : super(key: key);

  @override
  State<EditUserDetails> createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {

  ApiMethode _obj = ApiMethode();

  String _gender = "";

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _cityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:       SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.sizeOf(context).height + 200,
            color: secondryColor,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                          ),
                          height: 35,
                          width: 35,
                          child: Center(child: InkWell(
                              onTap: (){
                             Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back,color: primaryColor,)))),
                      InkWell(
                        onTap: (){
                       if (_formKey.currentState!.validate()) {
                       try {
                         if(_gender == ""){
                           ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                               content: Text(
                                 "Field can not be empty",
                               ),
                               // behavior: SnackBarBehavior.floating,
                               backgroundColor: Colors.red,
                             ),
                           );

                         }
                         else {
                           _obj.PostData(
                               _nameController.text,
                               _emailController.text,
                               _phoneController.text,
                               _gender,
                               _countryController.text,
                               _stateController.text,
                               _cityController.text
                           );
                           Navigator.push(context, MaterialPageRoute(
                               builder: (context) => ProfileScreen()));
                         }
                       } catch (e) {

                       }
                       }
                        },
                        child: SizedBox(
                          width: 80,
                          height: 35,
                         child: Container(
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.all(Radius.circular(10))
                           ),
                           child: Center(child: Text('Save',style: TextStyle(fontSize: 20,color: primaryColor,fontWeight: FontWeight.bold),)),
                         ),
                           ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40,),

                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    height: 80,
                    width: 400,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        const Text('     Enter Your Full Name',style: TextStyle(fontSize: 14,color: Colors.black54),),
                        SizedBox(
                            height: 20,
                            child: EditCustomTextFieldWidget(
                              controller: _nameController,
                              hintText: 'Enter your fullname',
                              keybordtype: TextInputType.text,
                              validator: (value) {
                                return empty(value!);
                              },

                            )),
                        const SizedBox(height: 12,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    height: 80,
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        const Text('     Mobile Number',style: TextStyle(fontSize: 14,color: Colors.black54),),
                        const SizedBox(height: 0,),
                        SizedBox(
                            height: 20,
                            child: EditCustomTextFieldWidget(
                              controller: _phoneController,
                              hintText: 'Enter your mobile number',
                              keybordtype: TextInputType.number,
                              validator: (value) {
                                return phoneNumber(value!);
                              },
                            )),
                         const SizedBox(height: 15,),

                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    height: 80,
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        const Text('     E-mail',style: TextStyle(fontSize: 14,color: Colors.black54),),
                        const SizedBox(height: 0,),
                        SizedBox(
                            height: 20,
                            child: EditCustomTextFieldWidget(
                              controller: _emailController,
                              hintText: 'Enter your email',
                              keybordtype: TextInputType.emailAddress,
                              validator: (value) {
                                return emailValidate(value!);
                              },
                            )),
                        const SizedBox(height: 15,),

                      ],
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    height: 80,
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        const Text('     Gender',style: TextStyle(fontSize: 14,color: Colors.black54),),
                        SizedBox(
                          height: 39 ,
                          // width: MediaQuery.sizeOf(context).width * 0.45,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(10),
                              value: _gender,
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  _gender = newValue!;
                                });
                              },
                              items: [
                                '',
                                'Male',
                                'Female',
                              ]
                                  .map<DropdownMenuItem<String>>((String value) =>
                                  DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ))
                                  .toList(),

                              // add extra sugar..
                              icon: const Padding(
                                padding: EdgeInsets.only(bottom: 0),
                                child: Icon(
                                  Icons.arrow_drop_down,
                                ),
                              ),
                              iconSize: 25,
                              iconEnabledColor: primaryColor,
                              iconDisabledColor: Colors.black.withOpacity(0.7),
                              underline: const SizedBox(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    height: 80,
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        const Text('     Country',style: TextStyle(fontSize: 14,color: Colors.black54),),
                        SizedBox(
                            height: 20,
                            child: EditCustomTextFieldWidget(
                              controller: _countryController,
                              hintText: 'Enter your country name',
                              keybordtype: TextInputType.text,
                              validator: (value) {
                                return empty(value!);
                              },
                            )), const SizedBox(height: 12,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    height: 80,
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        const Text('     State',style: TextStyle(fontSize: 14,color: Colors.black54),),
                        SizedBox(
                            height: 20,
                            child: EditCustomTextFieldWidget(
                              controller: _stateController,
                              hintText: 'Enter your state',
                              keybordtype: TextInputType.text,
                              validator: (value) {
                                return empty(value!);
                              },
                            )), const SizedBox(height: 12,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    height: 80,
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        const Text('     City',style: TextStyle(fontSize: 14,color: Colors.black54),),
                        SizedBox(
                            height: 20,
                            child: EditCustomTextFieldWidget(
                              controller: _cityController,
                              hintText: 'Enter your city',
                              keybordtype: TextInputType.text,
                              validator: (value) {
                                return empty(value!);
                              },
                            )), const SizedBox(height: 12,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  String? emailValidate(String value){
    const String format = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    return !RegExp(format).hasMatch(value) ? "Enter valid email" : null;
  }
  String? phoneNumber(String value) {

    if (value.isEmpty) {
      return 'Please enter phone number';
    } else if(value.length!=10){
      return 'Phone Number can only 10 digit';
    }
    else{
      return null;
    }

  }

  String? empty(String value) {

    if (value.isEmpty) {
      return 'Field can not be empty';
    }
    else{
      return null;
    }

  }
}
