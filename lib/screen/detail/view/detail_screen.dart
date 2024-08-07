import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_api_prodect/screen/home/model/home_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late ProductsModel m1;
  @override
  void initState() {
    super.initState();
    m1 = Get.arguments as ProductsModel;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network("${m1.thumbnail}",height: 300,fit: BoxFit.cover,)),
            const SizedBox(height: 10,),
            Text("${m1.title}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text("\$ ${m1.price}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text("${m1.description}",style: const TextStyle(fontSize: 18),),
            const SizedBox(height: 10,),
            Text("Category: ${m1.category}",style: const TextStyle(fontSize: 18,),),
            const SizedBox(height: 10,),
            Text("Rating: ${m1.rating}",style: const TextStyle(fontSize: 18,),),
          ],
        ),
      ),
    )
    );
  }
}
