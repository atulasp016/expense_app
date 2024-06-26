import 'package:expense_app/data/models/category_model.dart';
import 'package:expense_app/domain/utils/app_images.dart';

class AppConstants {
  static final List<CategoryModel> mCategories = [
    CategoryModel(
      catId: 1,
      catName: 'Fuel',
      catImg: ImageConstant.IMG_PATH_FUEL,
    ),
    CategoryModel(
      catId: 2,
      catName: 'Fast-Food',
      catImg: ImageConstant.IMG_PATH_FAST_FOOD,
    ),
    CategoryModel(
      catId: 3,
      catName: 'Movie',
      catImg: ImageConstant.IMG_PATH_MOVIE,
    ),
    CategoryModel(
      catId: 4,
      catName: 'Shopping',
      catImg: ImageConstant.IMG_PATH_SHOPPING,
    ),
    CategoryModel(
      catId: 5,
      catName: 'Salon',
      catImg: ImageConstant.IMG_PATH_SALON,
    ),
  ];
}
