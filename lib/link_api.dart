

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

 //============================Items===============================//
 static const String itemsPage = "$linkServerName/itemss/view.php";

  //============================Image===============================//
  static const String imageStatic = "$linkServerName/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
} 