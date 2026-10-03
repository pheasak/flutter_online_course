import 'package:get/get.dart';

/// ViewModel for bottom navigation state management
class NavigationViewModel extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
