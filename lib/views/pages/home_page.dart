import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/models/category_model.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;
  late List<ProductModel> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = dummyProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/home-banner.jpg',
              ),
            ),
            const SizedBox(height: 36),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: dummyCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final category = dummyCategories[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedCategoryId != category.id) {
                            selectedCategoryId = category.id;
                            filteredProducts = dummyProducts
                                .where((product) =>
                                    product.category.id == selectedCategoryId)
                                .toList();
                          } else {
                            selectedCategoryId = null;
                            filteredProducts = dummyProducts;
                          }
                        });
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: selectedCategoryId == category.id
                              ? AppColors.primary
                              : AppColors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                category.imgUrl,
                                height: 50,
                                width: 50,
                                color: selectedCategoryId == category.id
                                    ? AppColors.white
                                    : null,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                category.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: selectedCategoryId == category.id
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 36),
            GridView.builder(
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 16,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final product = filteredProducts[index];

                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              product.imgUrl,
                              height: 100,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${product.price}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.grey100,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (product.selfav == 0) {
                                  product.selfav = 1;
                                  favproduct.add(product);
                                } else {
                                  product.selfav = 0;
                                  favproduct.remove(product);
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: product.fav[product.selfav],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
