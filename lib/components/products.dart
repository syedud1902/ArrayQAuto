import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
    id: 0,
    title: 'Jordan 1 UNC',
    price: 250,
    size: 12,
    description: 'Jordan 1 University Blue',
    image: 'assests/images/sneaker.png',
    color: Colors.white,
  ),
  Product(
    id: 2,
    title: "Jordan 1 Mocha",
    price: 250,
    size: 12,
    description: 'Jordan 1 Mocha/Black',
    image: "assests/images/mocha.png",
    color: Color(0xFF705a48),
  ),
  Product(
    id: 3,
    title: "Yeezy Slides Pure",
    price: 80,
    size: 12,
    description: 'Adidas Yeezy Slide',
    image: "assests/images/pure_slides.png",
    color: Color(0xFFedede1),
  ),
  Product(
    id: 4,
    title: 'Jordan 1 UNC',
    price: 250,
    size: 12,
    description: 'Jordan 1 University Blue',
    image: 'assests/images/sneaker.png',
    color: Colors.white,
  ),
];
