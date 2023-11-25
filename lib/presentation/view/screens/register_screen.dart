import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/config/routes/app_routs.dart';
import 'package:save/core/utils/app_colors.dart';
import 'package:save/core/utils/media_query_values.dart';
import 'package:save/core/utils/style_manager.dart';
import 'package:save/presentation/manager/cubit/register_cubit.dart';
import 'package:save/presentation/manager/states/register_states.dart';
import 'package:save/presentation/view/screens/home_screen.dart';
import 'package:save/presentation/view/widgets/custom_button.dart';
import 'package:save/presentation/view/widgets/text_form_field.dart';
import 'package:svg_flutter/svg.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, CreateUserStates>(
        listener: (context, state) {
          if (state is CreatUserSuccessState) {
            navigateTo(context, const HomeScreen());
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.darkBrown,
                    )),
                elevation: 0.0,
                centerTitle: true,
                backgroundColor: AppColors.white,
                title: Text(
                  "Sign Up",
                  style: getBoldStyle(fontSize: 25, color: AppColors.darkBrown),
                ),
              ),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/eye/Dogpaw-cuate-1.svg"),
                            SizedBox(
                              height: context.height * 0.000000001,
                            ),
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
                            const SizedBox(
                              height: 10,
                            ),
                            defualtFormField(
                              controller: confirmpassController,
                              label: "confirm Password",
                              type: TextInputType.text,
                              validate: (String value) {
                                // ignore: unrelated_type_equality_checks
                                if (value != passController.text) {
                                  return 'Please enter the same Password';
                                } else {
                                  return null;
                                }
                              },
                              suffix: Icons.password_sharp,
                            ),
                            const SizedBox(height: 20),
                            CustomButton(
                              lable: "Sign Up",
                              height: 50,
                              width: 500,
                              backgroundColor: AppColors.darkBrown,
                              textColor: AppColors.offWhite,
                              isOutlined: false,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.userRegister(
                                      email: emailController.text,
                                      password: passController.text);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
