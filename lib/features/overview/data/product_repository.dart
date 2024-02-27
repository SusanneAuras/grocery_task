import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_task/common/data/local_data_constants.dart';
import 'package:grocery_task/common/domain/product.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream<List<Product>> get products {
  //   return Stream.value(mockProducts);
  // }

  Stream<List<Product>> get products {
    final productsCollectionRef = _firestore.collection("products");
    final productSnapshot = productsCollectionRef.snapshots();
    final productsStram = productSnapshot.map((snapshot) => snapshot.docs
        .map((product) => Product.fromFirestore(product))
        .toList());
    return productsStram;
  }

// Fügt alle Produkte aus der MockProdukts hinzu
  Future<void> saveProductsToFirestore() async {
    for (Product product in mockProducts) {
      await addProduct(product);
    }
  }

  void deleteProductsFromFirestore() async {
    final CollectionReference<Map<String, dynamic>> productCollectionRef =
        _firestore.collection("products");

    final QuerySnapshot<Map<String, dynamic>> productsSnapshot =
        await productCollectionRef.get();
    for (var element in productsSnapshot.docs) {
      element.reference.delete();
    }
  }

  // Fügt ein Produkt hinzu
  Future<void> addProduct(Product product) async {
    final CollectionReference<Map<String, dynamic>> productCollectionRef =
        _firestore.collection("products");
    productCollectionRef.add(product.toMap());
  }
}
