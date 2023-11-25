import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save/core/utils/app_colors.dart';
import 'package:save/core/utils/media_query_values.dart';
import 'package:save/presentation/manager/cubit/help_them_cubit.dart';
import 'package:save/presentation/manager/states/help_them_states.dart';
import 'package:save/presentation/view/widgets/custom_button.dart';
import 'package:save/presentation/view/widgets/text_form_field.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  File? _image;
  String? imageUrl;
  DateTime now = DateTime.now();

  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  uploadImage() async {
    Reference reference =
        FirebaseStorage.instance.ref().child('pets_pic${DateTime.now()}/');
    UploadTask uploadTask = reference.putFile(_image!);
    TaskSnapshot snapshot = await uploadTask;
    imageUrl = await snapshot.ref.getDownloadURL();
    debugPrint("##### $imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HelpCubit(),
      child: BlocConsumer<HelpCubit, HelpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HelpCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Help Them"),
              backgroundColor: AppColors.darkBrown,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: context.width * 1.635,
                        width: context.width * 0.9,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _image != null
                                  ? Container(
                                      clipBehavior: Clip.antiAlias,
                                      width: 120,
                                      height: 120,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.cover,
                                      ))
                                  : IconButton(
                                      onPressed: _openImagePicker,
                                      icon: Icon(
                                        Icons.camera_alt,
                                        size: 50,
                                        color: AppColors.darkBrown,
                                      )),
                              SizedBox(
                                height: context.height * 0.05,
                              ),
                              defualtFormField(
                                  controller: genderController,
                                  validate: () {},
                                  label: "Gender",
                                  type: TextInputType.text),
                              SizedBox(
                                height: context.height * 0.05,
                              ),
                              defualtFormField(
                                  controller: phoneController,
                                  validate: () {},
                                  label: "Phone",
                                  type: TextInputType.text),
                              SizedBox(
                                height: context.height * 0.05,
                              ),
                              defualtFormField(
                                  controller: addressController,
                                  validate: () {},
                                  label: "Address",
                                  type: TextInputType.text),
                              SizedBox(
                                height: context.height * .1,
                              ),
                              CustomButton(
                                lable: "Submit",
                                height: context.height * 0.07,
                                width: context.width * 0.8,
                                onTap: () async {
                                  if (imageUrl == null) {
                                    await uploadImage();
                                  }
                                  if (imageUrl != null) {
                                    cubit.helpFun(
                                      address: addressController.text,
                                      gender: genderController.text,
                                      phone: phoneController.text,
                                      postImage: imageUrl!,
                                    );
                                  }
                                },
                                isOutlined: false,
                                backgroundColor: AppColors.darkBrown,
                                textColor: AppColors.offWhite,
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
