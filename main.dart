import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
    );
  }
}

class Product {
  final String name;
  final double price;
  int quantity;

  Product({required this.name, required this.price, this.quantity = 0});
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Product 1', price: 10.0),
    Product(name: 'Product 2', price: 20.0),
    Product(name: 'Product 3', price: 30.0),
    Product(name: 'Product 4', price: 10.0),
    Product(name: 'Product 5', price: 20.0),
    Product(name: 'Product 6', price: 30.0),
    Product(name: 'Product 7', price: 10.0),
    Product(name: 'Product 8', price: 20.0),
    Product(name: 'Product 9', price: 30.0),
    Product(name: 'Product 10', price: 10.0),
    Product(name: 'Product 11', price: 20.0),
    Product(name: 'Product 12', price: 30.0),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(products[index].name),
              subtitle: Text('Price: \$${products[index].price.toStringAsFixed(1)}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Quantity: ${products[index].quantity}'),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(

                      onPressed: () {
                        setState(() {
                          products[index].quantity++;
                          if (products[index].quantity == 5) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Congratulations!'),
                                content: Text('You\'ve bought 5 ${products[index].name}!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        });
                      },
                      child: Text('Buy Now'),
                    ),
                  ),
                ],
              ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage(products: products)),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage({required this.products});

  @override
  Widget build(BuildContext context) {
    int totalQuantity = products.fold(0, (previousValue, product) => previousValue + product.quantity);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products: $totalQuantity'),
      ),
    );
  }
}
