import 'package:get/get.dart';
import 'package:test_api_prodect/screen/home/model/home_model.dart';
import 'package:test_api_prodect/util/api_helper.dart';

class HomeController extends GetxController {
  Rxn<HomeModel> homeList = Rxn<HomeModel>();
  var filteredProducts = RxList<ProductsModel>();

  Future<void> getModel() async {
    HomeModel? l1 = await ApiHelper.helper.homeApiCall();
    homeList.value = l1;
    filteredProducts.assignAll(l1?.productsList ?? []);
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(homeList.value?.productsList ?? []);
    } else {
      var filteredList = homeList.value?.productsList?.where((product) {
        return product.title!.toLowerCase().contains(query.toLowerCase());
      }).toList();
      filteredProducts.assignAll(filteredList ?? []);
    }
  }
}
