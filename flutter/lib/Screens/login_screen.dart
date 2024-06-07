import 'package:cancer_blood/Screens/register_screen.dart';
import 'package:cancer_blood/Screens/navigation.dart';
import 'package:cancer_blood/utils.dart';
import 'package:cancer_blood/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Form(
              key: formKey,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: 'Email',
                            fillColor: Colors.black,
                            focusColor: Colors.black,
                          ),
                        ),
                        CustomTextFormField(
                          hintText: " ",
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            passwordController.text = value;
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              final isValid = formKey.currentState!.validate();

                              if (!isValid) {
                                Utils.showSnackBar(
                                    context, "Please fill all fields");
                                return;
                              }
                              try {
                                final crd = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);

                                if (crd.user != null && context.mounted) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Navigation()));
                                }

                                if (context.mounted) {
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
                              'LOGIN',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('OR'),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
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
                              'Create New Account',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
