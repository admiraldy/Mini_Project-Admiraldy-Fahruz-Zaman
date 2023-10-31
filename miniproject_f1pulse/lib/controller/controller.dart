import 'package:get/get.dart';
import 'package:miniproject_f1pulse/models/constructor_standing_models.dart';
import 'package:miniproject_f1pulse/models/driver_standing_models.dart';
import 'package:miniproject_f1pulse/models/news_model.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';
import 'package:miniproject_f1pulse/services/ergast_api_service.dart';
import 'package:miniproject_f1pulse/services/news_api_service.dart';

class DriverStandingController extends GetxController {
  var driverStandings = <DriverStanding>[].obs;
  var isLoading = true.obs;
  var hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDriverStandings();
  }

  void fetchDriverStandings() async {
    try {
      var standings = await ErgastAPI().fetchDriverStandings();
      driverStandings.value = standings;
      isLoading.value = false;
    } catch (e) {
      hasError.value = true;
    }
  }
}

class ConstructorStandingController extends GetxController {
  var constructorStandings = <ConstructorStanding>[].obs;
  var isLoading = true.obs;
  var hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchConstructorStandings();
  }

  void fetchConstructorStandings() async {
    try {
      var standings = await ErgastAPI().fetchConstructorStandings();
      constructorStandings.value = standings;
      isLoading.value = false;
    } catch (e) {
      hasError.value = true;
    }
  }
}

class HomeController extends GetxController {
  final raceData = <Race>[].obs;
  final newsData = <NewsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRaceData();
    fetchNewsData();
  }

  void fetchRaceData() async {
    final races = await ErgastAPI().getRaceData();
    raceData.assignAll(races);
  }

  void fetchNewsData() async {
    final news = await NewsApiService().fetchNews('formula 1');
    newsData.assignAll(news);
  }
}
