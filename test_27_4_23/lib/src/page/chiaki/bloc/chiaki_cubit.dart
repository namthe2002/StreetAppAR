import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../chiaki.dart';

class ChiakiCubit extends Cubit<ChiakiState> {
  ChiakiCubit() : super(ChiakiInitial()) {
    // TODO
  }

  Future<List<ProductDataModel>>readJsonData() async{
    final jsondata = await rootBundle.loadString('assets/dat.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
  Future<List<Product>> fetchProducts() async {
    final response = await rootBundle.loadString('assets/dat.json');
    final data = json.decode(response);
    return List<Product>.from(data.map((json) => Product.fromJson(json)));
  }
}
class ProductDataModel{
  int? id;
  String? name;
  String? category;
  String? imageURL;
  String? oldPrice;
  String? price;

  ProductDataModel(
      {
        this.id,
        this.name,
        this.category,
        this.imageURL,
        this.oldPrice,
        this.price
      });

   ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    category = json['category'];
    imageURL = json['imageUrl'];
    oldPrice = json['oldPrice'];
    price = json['price'];
  }
}

class Product {
  final String? name;
  final String? price;
  final String? imageUrl;
  final String? salePercent;
  final String? discount;
  final String? oldPrice;

  Product({required this.oldPrice,required this.discount,required this.name, required this.price, required this.imageUrl,required this.salePercent});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      oldPrice: json['oldPrice'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      salePercent: json['oldPrice'],
      discount: json['discount'],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path. lineTo(size.width * 0.4, size.height - 12);
    path.lineTo(size.width * 0.6, size.height - 12);
    path. lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    }
  @override
  bool shouldReclip (covariant CustomClipper<Path> oldclipper) {
    return true;

    @override
    bool shouldReclip(TriangleClipper oldClipper) => false;
  }
}