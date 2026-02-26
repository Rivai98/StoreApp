import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/routing/app_routes.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_form_field.dart';
import 'package:store_app/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:store_app/features/home/presentation/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      _emailController.text = _emailController.text.trim();
      _passwordController.text = _passwordController.text.trim();
      BlocProvider.of<LoginCubit>(context).login(
        username: _emailController.text.toString(),
        password: _passwordController.text.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        } else if (state is LoginFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else if (state is LoginSuccess) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(backgroundColor: Colors.white),

              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "Please Login with registred account",
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),

                      const SizedBox(height: 35.0),
                      Text(
                        "Email or Phone Number",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustonFormField(
                              controller: _emailController,

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter a valid email";
                                } else {
                                  return null;
                                }
                              },
                              icon: Icons.email_outlined,
                              hintText: "Enter your email or phone number",
                              textType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            CustonFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter valid passowrd";
                                } else {
                                  String pass = value;

                                  if (pass.trim().length < 8) {
                                    return "Please enter more than 8 characters";
                                  }
                                  return null;
                                }
                              },
                              obsecureText: true,
                              icon: Icons.lock_outline,
                              hintText: "Create your password",
                              textType: TextInputType.visiblePassword,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text("Forget Password?"),
                              ),
                            ),
                            const SizedBox(height: 30),
                            state is LoginLoading
                                ? CircularProgressIndicator()
                                : CustomButton(
                                    onPressed: _submit,
                                    text: "Sign In",
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(width: 5.0),
                          InkWell(
                            onLongPress: () {},
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
