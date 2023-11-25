import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/config/routes/app_routs.dart';
import 'package:save/core/utils/app_colors.dart';
import 'package:save/core/utils/media_query_values.dart';
import 'package:save/core/utils/style_manager.dart';
import 'package:save/presentation/manager/cubit/login_cubit.dart';
import 'package:save/presentation/manager/states/login_state.dart';
import 'package:save/presentation/view/screens/home_screen.dart';
import 'package:save/presentation/view/screens/register_screen.dart';
import 'package:save/presentation/view/widgets/custom_button.dart';
import 'package:save/presentation/view/widgets/text_form_field.dart';
import 'package:svg_flutter/svg.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController passController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSucessStates) {
          navigateTo(context, const HomeScreen());
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: AppColors.white,
              title: Text(
                "Sign In",
                style: getBoldStyle(fontSize: 25, color: AppColors.darkBrown),
              ),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/eye/Dogpaw-cuate-1.svg"),
                          SizedBox(height: context.height * 0.0),
                          defualtFormField(
                            controller: emailController,
                            label: "Email",
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.contains("@")) {
                                return null;
                              } else {
                                return "add valid email";
                              }
                            },
                            suffix: Icons.email_sharp,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          defualtFormField(
                            controller: passController,
                            label: "Password",
                            type: TextInputType.text,
                            validate: (value) {
                              if (value!.length < 6) {
                                return 'Please enter Valid password';
                              }
                              return null;
                            },
                            suffix: Icons.password_sharp,
                          ),
                          SizedBox(height: context.height * 0.1),
                          CustomButton(
                            lable: "Sign in",
                            height: 50,
                            width: 500,
                            backgroundColor: AppColors.darkBrown,
                            textColor: AppColors.offWhite,
                            isOutlined: false,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.userLogin(
                                    email: emailController.text,
                                    password: passController.text);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: context.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't Have Account?",
                                style: getRegularStyle(
                                    color: AppColors.darkBrown, fontSize: 20),
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigateTo(context, const RegisterScreen());
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: getBoldStyle(
                                        color: AppColors.darkBrown,
                                        fontSize: 20),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
