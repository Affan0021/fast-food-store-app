import 'package:flutter/material.dart';
import 'signup.dart';

import 'package:get/get.dart';
//
class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  var count;
  @override
  TextEditingController _emailTEC = TextEditingController();

  String userEmail = "hell";

  late String _email, _password;

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
                              height: height / 14,
                            ),

                            Container(
                              margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              width: MediaQuery.of(context).size.width / 1.7,
                              height: MediaQuery.of(context).size.height / 3.4,
                              color: Colors.transparent,
                              child: Image.asset(
                                'assets/logo.png',
                              ),
                            ),

                            //
                            SizedBox(
                              height: height / 45,
                            ),
                            buildEmail(),
                            SizedBox( height: height/24),
                            buildPassword(),
                            Container(
                              margin: EdgeInsets.only(left: 145),
                              //   alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {


                                  },
                                  child: Text(
                                    '\tForget Password ?',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'OpenSans',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),

                            const SizedBox(height: 50),
                            buildsignauth(),


                            SizedBox(
                              height: height / 14,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: width / 6,
                                ),
                                Container(
                                  // margin:EdgeInsets.only(left: 100),
                                  child: Text(
                                    'Create an account?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 115,
                                ),
                                Container(
                                    child: TextButton(
                                      onPressed: () {
                                        Get.to(
                                            Signup(),
                                            duration: Duration(seconds: 1),
                                            transition: Transition.leftToRight
                                        );

                                      },
                                      child: Text(
                                        '\tSign up',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'OpenSans',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                              ],
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

  Widget valid() => Container();

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
          '\tSign in ',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
  );



// paste
}




