

class AppLink {

  static const String linkServerName = "http://10.0.2.2/eCommerceApp";
  static const String test = "$linkServerName/test.php";


  //============================Auth===============================//
  static const String signUp = "$linkServerName/auth/signup.php";
  static const String signIn = "$linkServerName/auth/signin.php";

  //============================Home===============================//
  static const String homePage = "$linkServerName/home/home.php";

   //============================Favorite===============================//
  static const String addFavorite = "$linkServerName/favoritesss/add.php";
  static const String removeFavorite = "$linkServerName/favoritesss/delete.php";
  static const String viewFavorite = "$linkServerName/favoritesss/view.php";
  static const String deleteFromFavoriteScreen = "$linkServerName/favoritesss/delete_from_fav_screen.php";

 //============================Items===============================//
  static const String itemsPage = "$linkServerName/itemss/view.php";
  static const String searchItems = "$linkServerName/search/search.php";
  //============================Image===============================//
  static const String imageStatic = "$linkServerName/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  //============================cart===============================//
  static const String cartView = "$linkServerName/cart/view.php";
  static const String cartitemsView = "$linkServerName/cart/view_items.php";
  static const String cartAdd = "$linkServerName/cart/add.php";
  static const String cartDelete = "$linkServerName/cart/delete.php";
  static const String cartGetCountOfItems = "$linkServerName/cart/get_count_of_items.php";

  //============================Coupon===============================//

  static const String checkcoupon = "$linkServerName/coupons/check_coupon.php";

  //============================address===============================//

  static const String addAddress    = "$linkServerName/addres/add_addres.php";
  static const String viewAddress   = "$linkServerName/addres/view_addres.php";
  static const String editeAddress  = "$linkServerName/addres/edite_addres.php";
  static const String deleteAddress = "$linkServerName/addres/delete_addres.php";

  //============================checkOut===============================//
  static const String checkOut = "$linkServerName/orders/check_out.php";


}