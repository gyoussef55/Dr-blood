import 'package:cancer_blood/Screens/login_screen.dart';
import 'package:cancer_blood/Screens/navigation.dart';
import 'package:cancer_blood/utils.dart';
import 'package:cancer_blood/widgets/custom_radio_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:datepicker_dropdown/order_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final formKey = GlobalKey<FormState>();

  final fNameController = TextEditingController();
  final sNamecontroller = TextEditingController();
  final rePasswordController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? selectedGender;
  String? day;
  String? month;
  String? year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.25,
        title: ListTile(
            title: Image.asset(
              'assets/Icon.png',
              width: 58,
              height: 89,
            ),
            subtitle: const Text(
              'Cancer Blood',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: Center(
        child: Form(
            key: formKey,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: fNameController,
                          validator: (value) {
                            final RegExp nameExp = RegExp(r'^[a-zA-Z]+$');
                            if (value != null &&
                                value.isEmpty &&
                                !value.contains(nameExp)) {
                              return 'Please enter a valid first name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            labelText: 'First Name',
                            fillColor: Colors.black,
                            focusColor: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: sNamecontroller,
                          validator: (value) {
                            final RegExp nameExp = RegExp(r'^[a-zA-Z]+$');
                            if (value != null &&
                                value.isEmpty &&
                                !value.contains(nameExp)) {
                              return 'Please enter a valid sur name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            labelText: 'Surname',
                            fillColor: Colors.black,
                            focusColor: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            labelText: 'Email',
                            fillColor: Colors.black,
                            focusColor: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                         
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            labelText: 'Password',
                            fillColor: Colors.black,
                            focusColor: Colors.black,
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                        
                          obscureText: true,
                          controller: rePasswordController,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            labelText: 'Repeat Password',
                            fillColor: Colors.black,
                            focusColor: Colors.black,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Repeat Password';
                            } else if (rePasswordController.text !=
                                passwordController.text) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Date of Birth',
                            )),
                        DropdownDatePicker(
                          yearFlex: 1,
                          monthFlex: 1,

                          dateformatorder: OrderFormat.DMY, // default is myd
                          inputDecoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          isDropdownHideUnderline: true,
                          isFormValidator: true,
                          startYear: 1900,
                          endYear: 2020,
                          width: 5,

                          onChangedDay: (value) => day = value,
                          onChangedMonth: (value) => month = value,

                          onChangedYear: (value) => year = value,
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Gender')),
                        GenderSelection(
                          onChanged: (gender) {
                            selectedGender = gender;
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              final isValid = formKey.currentState!.validate();

                              if (!isValid || selectedGender == null) {
                                Utils.showSnackBar(
                                    context, "Please fill all fields");
                                return;
                              }
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);
                                users.add({
                                  'email': emailController.text,
                                  'birthday': '$day/$month/$year',
                                  'first_name': fNameController.text,
                                  'sur_name': sNamecontroller.text,
                                  'gender': selectedGender,
                                });

                                if (context.mounted) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Navigation()));

                                  Utils.showSnackBar(context, 'Success');
                                }
                              } on FirebaseAuthException catch (e) {
                                if (context.mounted) {
                                  Utils.showSnackBar(context, e.message!);
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  Utils.showSnackBar(context, e.toString());
                                }
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.red),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            child: const Text(
                              'SIGN UP',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: 'Sign in',
                                    style: const TextStyle(
                                        color: Color.fromRGBO(15, 145, 210, 1)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));
                                      }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
