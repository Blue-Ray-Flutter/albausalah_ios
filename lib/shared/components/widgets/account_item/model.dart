class AccountModel {
  AccountItems accountItems;
  String title;
  String icon;
  void Function() onTap;

  AccountModel({
    required this.accountItems,
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

enum AccountItems {
  editInformation,
  deliveryStaff,
  myOrders,
  monthlyReports,
  myMessages,
  myNotification,
  clientOrders,
  myStatus,
  myServices,
  addProduct,
  addJob,
  myJob,
  myProducts,
  followers,
  followingStores,
  favoriteProducts,
  favoriteStores,
  viewStore,
  upgrade,
  siteRequests,
  storeRequests,
  logout,
}
