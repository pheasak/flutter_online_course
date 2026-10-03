import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:learning/fetchAPI/character_controller.dart';

class OnePieceCharacterScreen extends StatelessWidget {
  const OnePieceCharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CharacterController());
    return Scaffold(
      appBar: AppBar(title: const Text('One Piece Character')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.characters.length,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(controller.characters.value[index].name!),
                subtitle: Text(controller.characters.value[index].bounty!),
              ),
            );
          },
        );
      }),
    );
  }
}
