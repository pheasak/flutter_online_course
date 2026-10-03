import 'package:get/get.dart';
import 'package:learning/fetchAPI/character_model.dart';
import 'package:learning/fetchAPI/data_source.dart';

class CharacterController extends GetxController {
  var characters = <CharacterModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchCharacters();
    super.onInit();
  }

  Future<void> fetchCharacters() async {
    try {
      isLoading.value = true;
      characters.value = await DataSource().getCharacters();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
