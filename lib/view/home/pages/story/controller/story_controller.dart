import 'package:get/get.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/helper/cache_utils.dart';

class StoryController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  StoryController({required this.httpRepository, required this.cacheUtils});
}
