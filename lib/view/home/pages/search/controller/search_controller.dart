import 'package:albausalah_app/shared/components/actions/actions.dart';
import 'package:get/get.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../../account/pages/edit_information_for_customer/model/cities_model.dart';
import '../../../../stores/model/stores_model.dart';

class SearchPageController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  SearchPageController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<StoresModel?> searchModel = Rx<StoresModel?>(null);
  Rx<CitiesModel?> citiesModel = Rx<CitiesModel?>(null);

  Rx<int> storeCityValue = Rx<int>(0);

  searchStores({String? search}) async {
    late Rx<Response?> searchResponse = Rx<Response?>(null);

    try {
      searchResponse.value = await httpRepository.search(
        search: search!,
      );

      if (searchResponse.value == null) {
        return null;
      }
      searchModel.value = StoresModel.fromJson(searchResponse.value!.body);
      searchModel.refresh();
    } catch (e) {

      e.printError();
    }
  }

  @override
  Future<void> onInit() async {
    citiesModel.value = await ConstantActions.getCities();
    super.onInit();
  }
}
