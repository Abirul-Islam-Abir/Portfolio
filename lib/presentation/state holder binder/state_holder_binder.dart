import 'package:get/get.dart';
import 'package:portfolio/presentation/state%20holder%20controller/home_screen_controller.dart';

class StateHolderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}