import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/core/utils/app_colors.dart';
import 'package:save/core/utils/media_query_values.dart';
import 'package:save/core/utils/style_manager.dart';
import 'package:save/presentation/manager/cubit/requst_cubit.dart';
import 'package:save/presentation/manager/states/request_states.dart';
import 'package:save/presentation/view/widgets/custom_button.dart';
import 'package:save/presentation/view/widgets/text_form_field.dart';

// ignore: must_be_immutable
class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final TextEditingController gender = TextEditingController();
  final TextEditingController kind = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController color = TextEditingController();
  final TextEditingController phone = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit(),
      child: BlocConsumer<RequestCubit, RequestState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RequestCubit.get(context);
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
                  "Apply Request",
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
                            Image.asset(
                              "assets/photos/victor-dog.png",
                              height: context.height * 0.35,
                            ),
                            defualtFormField(
                              controller: gender,
                              label: "Gender",
                              type: TextInputType.text,
                              validate: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defualtFormField(
                              controller: kind,
                              label: "Kind",
                              type: TextInputType.text,
                              validate: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defualtFormField(
                              controller: age,
                              label: "Age",
                              type: TextInputType.number,
                              validate: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defualtFormField(
                              controller: color,
                              label: "Color",
                              type: TextInputType.text,
                              validate: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defualtFormField(
                              controller: phone,
                              label: "Phone",
                              type: TextInputType.text,
                              validate: (value) {},
                            ),
                            SizedBox(
                              height: context.height * 0.05,
                            ),
                            CustomButton(
                              lable: "Request",
                              height: 50,
                              width: 500,
                              backgroundColor: AppColors.darkBrown,
                              textColor: AppColors.offWhite,
                              isOutlined: false,
                              onTap: () {
                                cubit.requestMethod(
                                    age: age.text,
                                    color: color.text,
                                    gender: gender.text,
                                    kind: kind.text,
                                    phone: phone.text);
                              },
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
