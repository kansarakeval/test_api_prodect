import 'package:get/get.dart';
import 'package:test_api_prodect/screen/like/model/db_model.dart';
import 'package:test_api_prodect/util/db_helper.dart';

class LikeController extends GetxController{
  Rxn<List<DbModel>> productList = Rxn();

  Future<void> getProductData() async {
    List<DbModel> l1 = await DbHelper.helper.readData();
    productList.value = l1;
  }

}