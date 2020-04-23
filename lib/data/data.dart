import 'package:horizons/model/categories_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> categories = new List();

  CategoryModel category = new CategoryModel();
  category.categoryName = "Street Art";
  category.imgUrl = "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(category);

  category = new CategoryModel();

  category.categoryName = "City";
  category.imgUrl = "https://images.pexels.com/photos/1034662/pexels-photo-1034662.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(category);

  category = new CategoryModel();

  category.categoryName = "Cars";
  category.imgUrl = "https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(category);

  category = new CategoryModel();

  category.categoryName = "Motivation";
  category.imgUrl = "https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(category);

  category = new CategoryModel();

  category.categoryName = "Bikes";
  category.imgUrl = "https://images.pexels.com/photos/296735/pexels-photo-296735.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(category);

  category = new CategoryModel();
  
  category.categoryName = "Nature";
  category.imgUrl = "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(category);

  category = new CategoryModel();
  
  category.categoryName = "B & W";
  category.imgUrl = "https://images.pexels.com/photos/57905/pexels-photo-57905.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(category);

  category = new CategoryModel();
  
  category.categoryName = "Space";
  category.imgUrl = "https://images.pexels.com/photos/110854/pexels-photo-110854.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(category);

  category = new CategoryModel();
  
  category.categoryName = "Abstract";
  category.imgUrl = "https://images.pexels.com/photos/1616403/pexels-photo-1616403.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(category);

 return categories;
}