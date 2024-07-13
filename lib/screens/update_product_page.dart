import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({super.key});
  static String id = 'UpdateProduct';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? ProductName, Desc, image, Price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChanged: (data) {
                    ProductName = data;
                  },
                  hintText: 'Product Name',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    Desc = data;
                  },
                  hintText: 'Description',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    Price = data;
                  },
                  hintText: 'Price',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButon(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {

                    });

                    try {
                      await updateProduct(product);
                      print('success');
                    }  catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {

                    });


                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
   await UpdateProductService().updateProduct(
     id: product.id,
        price: Price == null ? product.price.toString() : Price!,
        title: ProductName == null ? product.title : ProductName!,
        desc: Desc == null ? product.description : Desc! ,
        image: image == null ? product.image : image!,
       category: product.category,

    );
  }
}
