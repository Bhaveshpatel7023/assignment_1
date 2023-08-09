import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'api_bloc_provider/api_methods.dart';
import 'app_theam/app_colors.dart';
import 'app_theam/app_text_style.dart';
import 'audio_play.dart';
import 'edit_user.dart';
import 'models/user_details_model.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  StreamController<UserDetailsModel> _streamController = StreamController();



  UserDetailsModel? _apiResponse;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: StreamBuilder<UserDetailsModel>(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                height: 900,
                child: Center(
                  child: CircularProgressIndicator(color: primaryColor,),
                ),
              );
            }
            return Container(
              height: MediaQuery.sizeOf(context).height + 150,
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
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AudioPlay()));
                            },
                            child: Text('Audio Player',style: TextStyle(color: primaryColor,fontSize: 16,fontWeight: FontWeight.bold),)),

                                InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditUserDetails()));
                            },
                            child: Text('Edit Details',style: TextStyle(color: primaryColor,fontSize: 16,fontWeight: FontWeight.bold),))
                      ],
                    ),
                    const SizedBox(height: 40,),
                    const SizedBox(height: 40,),
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
                          const Text('     Name',style: TextStyle(fontSize: 14,color: Colors.black54),),
                          const SizedBox(height: 10,),
                          Text('   ${snapshot.data!.data.last.name}',style: const TextStyle(fontSize: 19,color: Colors.black54,fontWeight: FontWeight.w500),),
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
                          const SizedBox(height: 10,),
                          Text('    ${snapshot.data!.data.last.phone}',style: const TextStyle(fontSize: 19,color: Colors.black54,fontWeight: FontWeight.w500),),
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
                          const Text('     Email ID',style: TextStyle(fontSize: 14,color: Colors.black54),),
                          const SizedBox(height: 10,),
                          Text('   ${snapshot.data!.data.last.email}',style: const TextStyle(fontSize: 19,color: Colors.black54,fontWeight: FontWeight.w500),),
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
                          const Text('     Gender',style: TextStyle(fontSize: 14,color: Colors.black54),),
                          const SizedBox(height: 10,),
                          Text('    ${snapshot.data!.data.last.gender}',style: const TextStyle(fontSize: 19,color: Colors.black54,fontWeight: FontWeight.w500),),
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
                          const SizedBox(height: 10,),
                          Text('    ${snapshot.data!.data.last.country}',style: const TextStyle(fontSize: 19,color: Colors.black54,fontWeight: FontWeight.w500),),
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
                          const Text('     State',style: TextStyle(fontSize: 14,color: Colors.black54),),
                          const SizedBox(height: 10,),
                          Text('    ${snapshot.data!.data.last.state}',style: const TextStyle(fontSize: 19,color: Colors.black54,fontWeight: FontWeight.w500),),
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
                          const Text('     city',style: TextStyle(fontSize: 14,color: Colors.black54),),
                          const SizedBox(height: 10,),
                          Text('   ${snapshot.data!.data.last.city}',style: const TextStyle(fontSize: 19,color: Colors.black54,fontWeight: FontWeight.w500),),
                          const SizedBox(height: 12,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),

                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  Future<UserDetailsModel?> getData() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            baseUrl),
        headers: headers);

    var data = jsonDecode(response.body.toString());
    print(data);

    if (response.statusCode == 200) {
      _apiResponse = UserDetailsModel.fromJson(jsonDecode(response.body.toString()));
      _streamController.sink.add(_apiResponse!);
      print(_apiResponse!.data.first.city.toString());

    }
    else {
      print(response.reasonPhrase);
    }

  }
}
