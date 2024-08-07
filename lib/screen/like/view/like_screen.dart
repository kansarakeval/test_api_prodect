import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_api_prodect/screen/like/controller/like_controller.dart';
import 'package:test_api_prodect/util/db_helper.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  LikeController controller = Get.put(LikeController());

  @override
  void initState() {
    super.initState();
    controller.getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => controller.productList.value == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.productList.value!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 8, right: 8, top: 8),
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        child: Row(
                          children: [
                            Image.network(
                              "${controller.productList.value![index].image}",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: Text(
                                    "${controller.productList.value![index].title}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${controller.productList.value![index].price}",
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () async {
                                  await DbHelper.helper.deleteData(
                                      controller.productList.value![index].id);
                                  controller.getProductData();
                                },
                                icon: Icon(Icons.delete_outline))
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
      ),
    ));
  }
}
