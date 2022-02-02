import 'dart:io';

import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:image_picker/image_picker.dart';
//
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  String phone = '';
  var count;
  @override
  TextEditingController _emailTEC = TextEditingController();

  String userEmail = "hell";
  File? _imageFile;
  // File? _imageFile;
   late String _email, _password;
  final ImagePicker _picker = ImagePicker();

  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    var height = query.size.height;
    var width = query.size.width;

    return Scaffold(

        body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Stack(

                  children: <Widget>[


                    // To have bacground image

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black,

                    ),
                    Align(
                        alignment: Alignment.center,

                        child: Column(
                          children: [
                            //
                            SizedBox(
                              height: height / 20,
                            ),

                            imageProfile(),
                            SizedBox( height: height/25),
                            buildName(),
                            SizedBox( height: height/46),
                            buildEmail(),
                            SizedBox( height: height/46),
                            buildPassword(),


                            SizedBox(height: height/46),

                            buildPhone(),
                            SizedBox( height: height/24),
                            buildsignauth(),


                            SizedBox(
                              height: height / 10,
                            ),


                          ],
                        ))
                  ]),
            )));


  }

  Widget buildEmail() => Container(

    width: MediaQuery.of(context).size.width/1.2,

    child:TextFormField(

      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'OpenSans',
      ),
      decoration: InputDecoration(

        contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        // contentPadding: const EdgeInsets.only(top: 11.0),
        prefixIcon: Icon(
          Icons.email,
          color: Colors.blue,
        ),
        errorStyle: TextStyle(
          color: Colors.deepOrange,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        focusedBorder: OutlineInputBorder(

          borderSide: BorderSide(
            color: Colors.red,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Colors.blue, // <-- Change this
          fontSize: 22,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),


      ),
      onChanged: (value) {
        setState(() {
          _email = value.trim();
        });
      },


      validator: (value) {
        final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
        final regExp = RegExp(pattern);

        if (value!.isEmpty) {
          return 'Enter an email';
        } else if (!regExp.hasMatch(value)) {
          return 'Enter a valid email';
        } else {
          // count = 1;
          return null;
        }
      },

      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => setState(() => email = value!),


    ),

  );

  Widget buildPassword() => Container(


      width: MediaQuery.of(context).size.width/1.2,

      child:TextFormField(
        decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // contentPadding: const EdgeInsets.only(top: 11.0),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          errorStyle: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Colors.blue, // <-- Change this
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),


        ),
        onChanged: (value) {
          setState(() {
            _password = value.trim();
          });
        },
        validator: (value) {
          if (value!.length < 7) {
            return 'Password must be at least 7 characters long';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => password = value!),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      )

  );

  Widget buildPhone() => Container(

      width: MediaQuery.of(context).size.width/1.2,

      child:TextFormField(
        decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // contentPadding: const EdgeInsets.only(top: 11.0),
          prefixIcon: Icon(
            Icons.phone,
            color: Colors.blue,
          ),
          errorStyle: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Phone',
          labelStyle: TextStyle(
            color: Colors.blue, // <-- Change this
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),


        ),
        onChanged: (value) {
          setState(() {
            _password = value.trim();
          });
        },
        validator: (value) {
          if (value!.length < 11) {
            return 'Phone must have 11 numbers';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => username = value!),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      ));


  Widget buildName() => Container(

      width: MediaQuery.of(context).size.width/1.2,

      child:TextFormField(
        decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // contentPadding: const EdgeInsets.only(top: 11.0),
          prefixIcon: Icon(
            Icons.people,
            color: Colors.blue,
          ),
          errorStyle: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Name',
          labelStyle: TextStyle(
            color: Colors.blue, // <-- Change this
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),


        ),
        onChanged: (value) {
          setState(() {
            _password = value.trim();
          });
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter your name';

          } else {
            // count = 1;
            return null;
          }
        },
        onSaved: (value) => setState(() => username = value!),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      ));

  Widget buildsignauth() =>  Container(

      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 17,

      child:ElevatedButton(
        // onPressed: onClicked,
        onPressed: () {
          final isValid = formKey.currentState!.validate();
          FocusScope.of(context).unfocus();



          if (isValid) {
            formKey.currentState!.save();

            //  buildsignauth();

          };
          // auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
          //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
          // });

        },


        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Colors.white;
              return Colors.red;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              )),
        ),
        child: Text(
          '\tSign up ',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
  );

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
            ),
            SizedBox(width: 80),
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },

            ),

          ])
        ],
      ),
    );
  }
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }


  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
             child:  _imageFile != null

        ?
        CircleAvatar(
          radius: 80.0,
         backgroundImage: FileImage(_imageFile!),
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: FileImage(imagefile!),
        //     )
        // ),

      )
          : CircleAvatar(
            radius: 80.0,
              backgroundImage: AssetImage('assets/profile.png'),

            )

    ),


        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

// paste
}




