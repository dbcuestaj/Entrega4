import 'package:f_202110_firebase/domain/controller/authentication_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseSignUp extends StatefulWidget {
  @override
  _FirebaseSignUpState createState() => _FirebaseSignUpState();
}

class _FirebaseSignUpState extends State<FirebaseSignUp> {
  late String name;
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerUser = TextEditingController();
  final controllerDate = TextEditingController();

  AuthenticationController authenticationController = Get.find();

  _signup(theEmail, thePassword) async {
    try {
      await authenticationController.signUp(theEmail, thePassword);

      Get.snackbar(
        "Sign Up",
        'OK',
        icon: Icon(Icons.person, color: Colors.orange),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (err) {
      Get.snackbar(
        "Sign Up",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Registro",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: this.controllerUser,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: this.controllerEmail,
                          decoration:
                              InputDecoration(labelText: "Email address"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter email";
                            } else if (!value.contains('@')) {
                              return "Enter valid email address";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: this.controllerPassword,
                          decoration: InputDecoration(labelText: "Password"),
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please a Enter Password';
                            }
                            if (!RegExp("^[a-zA-Z0-9+_.-]").hasMatch(value)) {
                              return 'Please a Enter Password valido';
                            } else if (value.length <= 8) {
                              return "La contraseña debe  debe tener 8 o mas caracteres";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: this.controllerDate,
                          decoration:
                              InputDecoration(labelText: "Date oF Birth"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Ingrese tu fecha de nacimiento";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              final form = _formKey.currentState;
                              form!.save();
                              // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (_formKey.currentState!.validate()) {
                                _signup(controllerEmail.text,
                                    controllerPassword.text);
                              }
                            },
                            child: Text("Submit")),
                      ]),
                ))));
  }
}
