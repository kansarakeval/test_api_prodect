import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_api_prodect/screen/home/controller/home_controller.dart';
import 'package:test_api_prodect/screen/like/model/db_model.dart';
import 'package:test_api_prodect/util/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  final TextEditingController txtSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.getModel();
    txtSearch.addListener(() {
      controller.filterProducts(txtSearch.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed('like');
                },
                icon: const Icon(Icons.bookmark_border))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtSearch,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                    () => controller.filteredProducts.isEmpty
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(
                  itemCount: controller.filteredProducts.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed('detail',
                                arguments:
                                controller.filteredProducts[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 8, right: 8, top: 8),
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200),
                            child: Row(
                              children: [
                                Image.network(
                                  "${controller.filteredProducts[index].thumbnail}",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 180,
                                      child: Text(
                                        "${controller.filteredProducts[index].title}",
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
                                      "${controller.filteredProducts[index].price}",
                                      style:
                                      const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () async {
                                      DbModel model = DbModel(
                                        image: controller
                                            .filteredProducts[index]
                                            .thumbnail,
                                        price: controller
                                            .filteredProducts[index]
                                            .price,
                                        title: controller
                                            .filteredProducts[index]
                                            .title,
                                        detail: controller
                                            .filteredProducts[index]
                                            .description,
                                      );
                                      await DbHelper.helper.addData(model);
                                    },
                                    icon:
                                    Icon(Icons.favorite_border))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
