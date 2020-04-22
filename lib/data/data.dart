import 'package:horizons/model/categories_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> categories = new List();

  CategoryModel category = new CategoryModel();
  category.categoryName = "Street Art";
  category.imgUrl = "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg";
  
  category = new CategoryModel();

  category.categoryName = "City";
  category.imgUrl = "https://images.pexels.com/photos/1034662/pexels-photo-1034662.jpeg";
  
  category = new CategoryModel();

  category.categoryName = "Cars";
  category.imgUrl = "https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg";
  
  category = new CategoryModel();

  category.categoryName = "Motivation";
  category.imgUrl = "https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg";
  
  category = new CategoryModel();

  category.categoryName = "Bikes";
  category.imgUrl = "https://images.pexels.com/photos/296735/pexels-photo-296735.jpeg";
  
 return categories;
}