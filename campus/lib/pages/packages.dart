import 'package:flutter/material.dart';

class Package {
  final String packageName;
  final String description;
  final double price;

  Package(
      {required this.packageName,
      required this.description,
      required this.price});
}

class PackagesButton extends StatelessWidget {
  static List<Package> packages = [
    Package(
      packageName: 'Basic Package',
      description: 'Includes basic features and limited support',
      price: 99.99,
    ),
    Package(
      packageName: 'Standard Package',
      description: 'Includes standard features and email support',
      price: 199.99,
    ),
    Package(
      packageName: 'Premium Package',
      description: 'Includes premium features and 24/7 support',
      price: 299.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackagesPage(packages: packages),
          ),
        );
      },
      child: Text('Packages'),
    );
  }
}

class PackagesPage extends StatelessWidget {
  final List<Package> packages;

  PackagesPage({required this.packages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Packages'),
      ),
      body: ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          return ListTile(
            title: Text(package.packageName),
            subtitle: Text(package.description),
            trailing: Text('\$${package.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
