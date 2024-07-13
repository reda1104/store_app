import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProductService
{
  Future<ProductModel> updateProduct(
      {required String price,
        required String title,
        required String desc,
        required int id,
        required String image,
        required String category
        }) async {
    print('product id = $id');
    Map<String , dynamic> data = await Api().put(url: 'https://fakestoreapi.com1/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    });

    return ProductModel.fromJson(data);
  }
}