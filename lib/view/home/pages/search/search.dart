import 'package:albausalah_app/shared/components/widgets/size_config/size_config.dart';
import 'package:albausalah_app/view/stores/store_page/view/store_page.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../shared/components/actions/actions.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/button/button.dart';
import '../../../../shared/components/widgets/store_item/store_item.dart';
import '../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import '../../../category/view/category_page.dart';
import 'controller/search_controller.dart';

class SearchPage extends GetWidget<SearchPageController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title: Text(
          'Search'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        return controller.citiesModel.value == null
            ? Center(
                child: LoadingAnimationWidget.stretchedDots(
                  color: AppColor.globalDefaultColor,
                  size: 40,
                ),
              )
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 145,
                    ),
                    child: Obx(
                      () => controller.searchModel.value == null ||
                              controller.searchModel.value!.stores!.isEmpty
                          ? Center(
                              child: Text(
                                'There are no stores'.tr,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontSize: 20,
                                ),
                              ),
                            )
                          : SizedBox(
                              child: GridView.builder(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  bottom: 40,
                                  left: 10,
                                  right: 10,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: 3 / 4.5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 15,
                                ),
                                itemCount: controller
                                    .searchModel.value!.stores!.length,
                                itemBuilder: (context, index) {
                                  return StoreItem(
                                    followWidget: controller.searchModel.value!
                                            .stores![index].followStore!
                                        ? Button(
                                            radius: 10,
                                            background:
                                                AppColor.globalDefaultColor,
                                            textColor: Colors.white,
                                            height: 40,
                                            width: 110,
                                            onPressed: () {
                                              controller
                                                  .searchModel
                                                  .value!
                                                  .stores![index]
                                                  .followStoreItem = false;
                                              controller.searchModel.refresh();
                                              ConstantActions.followStores(
                                                  controller.searchModel.value!
                                                      .stores![index].id!
                                                      .toString());
                                            },
                                            text: 'Following'.tr,
                                          )
                                        : Button(
                                            radius: 10,
                                            background: Colors.white,
                                            textColor:
                                                AppColor.globalDefaultColor,
                                            height: 40,
                                            width: 110,
                                            onPressed: () {
                                              controller
                                                  .searchModel
                                                  .value!
                                                  .stores![index]
                                                  .followStoreItem = true;
                                              controller.searchModel.refresh();
                                              ConstantActions.followStores(
                                                  controller.searchModel.value!
                                                      .stores![index].id!
                                                      .toString());
                                            },
                                            text: 'Follow'.tr,
                                          ),
                                    widget: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: FavoriteButton(
                                        iconSize: 38,
                                        isFavorite: controller
                                            .searchModel
                                            .value!
                                            .stores![index]
                                            .wishlistStore,
                                        valueChanged: (isFavorite) {
                                          ConstantActions
                                              .addRemoveStoreWishlist(controller
                                                  .searchModel
                                                  .value!
                                                  .stores![index]
                                                  .id
                                                  .toString());
                                        },
                                        //
                                      ),
                                    ),
                                    heightContainer: 150,
                                    nameShop: controller.searchModel.value!
                                        .stores![index].storeName,
                                    location: controller.searchModel.value!
                                        .stores![index].storeLocation,
                                    image: controller.searchModel.value!
                                        .stores![index].profilePhotoUrl,
                                    rate: double.parse(controller.searchModel
                                        .value!.stores![index].storeReview!),
                                    widthBorder: 0.9,
                                    onTap: () {
                                      Get.to(() => const StorePage(),
                                          arguments: [
                                            controller.searchModel.value!
                                                .stores![index].id,
                                            controller.searchModel.value!
                                                .stores![index].followStore,
                                          ]);
                                    },
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 7,
                                ),
                                child: DefaultFormField(
                                  onTap: () {},
                                  onSubmit: (value) {},
                                  onChange: (value) {
                                    controller.searchStores(search: value);
                                  },
                                  maxLines: 1,
                                  minLines: 1,
                                  prefixIcon: Icons.search_rounded,
                                  hint: 'Search for the store'.tr,
                                  isPassword: false,
                                  enabled: true,
                                  readOnly: false,
                                  radius: 15,
                                  autofocus: false,
                                  focusBorderColor: Colors.grey[700]!,
                                  textColor: AppColor.globalDefaultColor,
                                  filled: false,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height:
                                    controller.cacheUtils.getLanguage() == 'en'
                                        ? 58
                                        : 65,
                                width: 50,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  border: Border.all(
                                    width: 0.4,
                                    color: Colors.grey[700]!,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => const CategoryPage());
                                  },
                                  child: const Center(
                                    child: Icon(
                                      color: Colors.black87,
                                      size: 18,
                                      FontAwesomeIcons.filter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 0.5,
                                color: AppColor.globalDefaultColor,
                              ),
                            ),
                            child: CoolDropdown(
                              resultWidth: SizeConfig.screenWidth,
                              dropdownItemPadding: const EdgeInsets.all(5),
                              dropdownItemGap: 5,
                              dropdownHeight: 250,
                              dropdownList: controller
                                  .citiesModel.value!.cities!
                                  .map((e) {
                                return {'label': e.name, 'value': e.id};
                              }).toList(),
                              defaultValue: {
                                'label': 'Store City *'.tr,
                                'value': 0
                              },
                              isAnimation: true,
                              isResultLabel: true,
                              onChange: (value) async {
                                controller.storeCityValue.value =
                                    value['value'];
                                controller.searchModel.value =
                                    await ConstantActions.getCityStores(
                                        storeCityId: value['value'].toString());
                              },
                              dropdownItemReverse: true,
                              dropdownItemMainAxis: MainAxisAlignment.start,
                              resultMainAxis: MainAxisAlignment.start,
                              dropdownWidth: 200,
                              labelIconGap: 5,
                              resultTS: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              unselectedItemTS: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              resultIcon: const Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
