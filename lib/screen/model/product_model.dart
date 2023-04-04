class ProductModel {
  int? id;
  double? price;
  String? title, description, category, image;
  Rating? rating;

  ProductModel(
      {this.id,
        this.price,
        this.title,
        this.description,
        this.category,
        this.rating,
        this.image});

  ProductModel fromJson(Map m1) {
    id = m1['id'];
    price = m1['price'];
    title = m1['title'];
    description = m1['description'];
    category = m1['category'];
    image = m1['image'];

    rating = Rating().fromJson(m1);

    ProductModel e1 = ProductModel(
        description: description,
        title: title,
        id: id,
        image: image,
        category: category,
        price: price,
        rating: rating);
    return e1;
  }
}

class Rating {
  int? count;
  double? rate;

  Rating({this.count, this.rate});

  Rating fromJson(Map m1) {
    count = m1['count'];
    rate = m1['rate'];

    Rating r1 = Rating(count: count, rate: rate);
    return r1;
  }
}