class HomeModel {
  int? total, skip, limit;
  List<ProductsModel>? productsList;

  HomeModel({this.total, this.skip, this.limit, this.productsList});

  factory HomeModel.mapToModel(Map m1) {
    List l1 = m1['products'] ?? [];
    return HomeModel(
      total: m1['total'],
      limit: m1['limit'],
      productsList: l1.map((e) => ProductsModel.mapToModel(e)).toList(),
      skip: m1['skip'],
    );
  }
}

class ProductsModel {
  int? id, stock, weight, minimumOrderQuantity;
  String? title, description, category, brand, sku, warrantyInformation, shippingInformation, availabilityStatus, returnPolicy, thumbnail;
  dynamic price, discountPercentage, rating;
  List<String>? tagsList;
  DimensionsModel? dimensions;
  List<ReviewsModel>? reviewsList;
  MetaModel? meta;

  ProductsModel({
    this.id,
    this.stock,
    this.weight,
    this.minimumOrderQuantity,
    this.title,
    this.description,
    this.category,
    this.brand,
    this.sku,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.returnPolicy,
    this.thumbnail,
    this.price,
    this.discountPercentage,
    this.rating,
    this.tagsList,
    this.dimensions,
    this.reviewsList,
    this.meta
  });

  factory ProductsModel.mapToModel(Map m1) {
    List reviews = m1['reviews'] ?? [];
    List tags = m1['tags'] ?? [];
    return ProductsModel(
      id: m1['id'],
      stock: m1['stock'],
      weight: m1['weight'],
      minimumOrderQuantity: m1['minimumOrderQuantity'],
      title: m1['title'],
      description: m1['description'],
      category: m1['category'],
      brand: m1['brand'],
      sku: m1['sku'],
      warrantyInformation: m1['warrantyInformation'],
      shippingInformation: m1['shippingInformation'],
      availabilityStatus: m1['availabilityStatus'],
      returnPolicy: m1['returnPolicy'],
      thumbnail: m1['thumbnail'],
      price: m1['price'],
      discountPercentage: m1['discountPercentage'],
      rating: m1['rating'],
      tagsList: tags.cast<String>(),
      dimensions: DimensionsModel.mapToModel(m1['dimensions']),
      reviewsList: reviews.map((e) => ReviewsModel.mapToModel(e)).toList(),
      meta: MetaModel.mapToModel(m1['meta']),
    );
  }
}

class DimensionsModel {
  dynamic width, height, depth;

  DimensionsModel({this.width, this.height, this.depth});

  factory DimensionsModel.mapToModel(Map m1) {
    return DimensionsModel(
      width: m1['width'],
      depth: m1['depth'],
      height: m1['height'],
    );
  }
}

class ReviewsModel {
  int? rating;
  String? comment, reviewerName, reviewerEmail;
  dynamic date;

  ReviewsModel({
    this.rating,
    this.comment,
    this.reviewerName,
    this.reviewerEmail,
    this.date
  });

  factory ReviewsModel.mapToModel(Map m1) {
    return ReviewsModel(
      date: m1['date'],
      comment: m1['comment'],
      rating: m1['rating'],
      reviewerEmail: m1['reviewerEmail'],
      reviewerName: m1['reviewerName'],
    );
  }
}

class MetaModel {
  String? barcode, qrCode;
  dynamic createdAt, updatedAt;

  MetaModel({this.barcode, this.qrCode, this.createdAt, this.updatedAt});

  factory MetaModel.mapToModel(Map m1) {
    return MetaModel(
      barcode: m1['barcode'],
      createdAt: m1['createdAt'],
      qrCode: m1['qrCode'],
      updatedAt: m1['updatedAt'],
    );
  }
}
