import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:save/core/utils/app_colors.dart';
import 'package:save/presentation/view/widgets/pets_item.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pets"),
        backgroundColor: AppColors.darkBrown,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Helps').snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemBuilder: (context, index) => buildpetsItem(
                context: context,
                imgUrl: snapshot.data?.docs[index]['image'] ?? '',
                phone: snapshot.data?.docs[index]['phone'] ?? '',
                gender: snapshot.data?.docs[index]['gender'] ?? '',
                address: snapshot.data?.docs[index]['address'] ?? '',
              ),
              itemCount: snapshot.data?.docs.length ?? 0,
            );
          }),
    );
  }
}
