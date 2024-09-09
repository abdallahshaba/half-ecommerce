
import 'package:e_commerce_app14/core/class/crud.dart';
import 'package:e_commerce_app14/link_api.dart';

class FavoriteData {
  Crud crud ;
  FavoriteData(this.crud);

  addFavoriteData (userid, itemid)async {
    var response = await crud.postData(AppLink.addFavorite, {
      "userId" : userid,
      "itemId" : itemid
    });
    return response.fold((l) => l, (r) => r);
  }
  removeFavoriteData (userid, itemid)async {
    var response = await crud.postData(AppLink.removeFavorite, {
      "userId" : userid,
      "itemId" : itemid
    });
    return response.fold((l) => l, (r) => r);
  }

  viewFavoriteData (userid)async {
    var response = await crud.postData(AppLink.viewFavorite, {
      "userId" : userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFromFavoriteScreenData (favoriteId)async {
    var response = await crud.postData(AppLink.deleteFromFavoriteScreen, {
      "favoriteId" : favoriteId,
    });
    return response.fold((l) => l, (r) => r);
  }

}


