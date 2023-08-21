import 'package:albausalah_app/shared/components/widgets/product_image/product_image.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import 'controller/add_new_product_controller.dart';

class AddNewProduct extends GetWidget<AddNewProductController> {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title: Text(
          'Add new product'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        return controller.categoryModel.value == null ||
                controller.productSizeModel.value == null ||
                controller.productColorModel.value == null
            ? Center(
                child: LoadingAnimationWidget.stretchedDots(
                  color: AppColor.globalDefaultColor,
                  size: 40,
                ),
              )
            : Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 20,
                    top: 40,
                  ),
                  children: [
                    Text(
                      'Product name *'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DefaultFormField(
                      validator: (product) {
                        if (product == null || product.isEmpty) {
                          return 'Product name is required'.tr;
                        }
                        return null;
                      },
                      controller: controller.productNameController,
                      minLines: 1,
                      maxLines: 1,
                      borderColors: AppColor.globalDefaultColor,
                      isPassword: false,
                      enabled: true,
                      readOnly: false,
                      radius: 15,
                      autofocus: false,
                      focusBorderColor: AppColor.globalDefaultColor,
                      textColor: AppColor.globalDefaultColor,
                      filled: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'SKU *',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DefaultFormField(
                      validator: (sku) {
                        if (sku == null || sku.isEmpty) {
                          return 'SKU name is required'.tr;
                        }
                        return null;
                      },
                      controller: controller.skuController,
                      minLines: 1,
                      maxLines: 1,
                      borderColors: AppColor.globalDefaultColor,
                      isPassword: false,
                      enabled: true,
                      readOnly: false,
                      radius: 15,
                      autofocus: false,
                      focusBorderColor: AppColor.globalDefaultColor,
                      textColor: AppColor.globalDefaultColor,
                      filled: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Price *'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DefaultFormField(
                      validator: (price) {
                        if (price == null || price.isEmpty) {
                          return 'Price is required'.tr;
                        }
                        return null;
                      },
                      controller: controller.priceController,
                      minLines: 1,
                      maxLines: 1,
                      borderColors: AppColor.globalDefaultColor,
                      isPassword: false,
                      enabled: true,
                      readOnly: false,
                      radius: 15,
                      autofocus: false,
                      focusBorderColor: AppColor.globalDefaultColor,
                      textColor: AppColor.globalDefaultColor,
                      filled: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Discount price status *'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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
                          dropdownHeight: 130,
                          dropdownList: const [
                            {'label': 'Active', 'value': 1},
                            {'label': 'Inactive', 'value': 2},
                          ],
                          defaultValue: const {'label': 'Status *', 'value': 0},
                          isAnimation: true,
                          isResultLabel: true,
                          onChange: (value) {
                            controller.activeValue.value = value['value'];
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
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Discount price*'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DefaultFormField(
                      validator: (priceDiscount) {
                        if (priceDiscount == null || priceDiscount.isEmpty) {
                          return 'Price discount name is required'.tr;
                        }
                        return null;
                      },
                      controller: controller.discountPriceController,
                      minLines: 1,
                      maxLines: 1,
                      borderColors: AppColor.globalDefaultColor,
                      isPassword: false,
                      enabled: true,
                      readOnly: false,
                      radius: 15,
                      autofocus: false,
                      focusBorderColor: AppColor.globalDefaultColor,
                      textColor: AppColor.globalDefaultColor,
                      filled: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Special Offer Status *'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    ///done
                    Center(
                      child: Container(
                        width: SizeConfig.screenWidth,
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
                          dropdownHeight: 100,
                          dropdownList: [
                            {'label': 'Active'.tr, 'value': 1},
                            {'label': 'Inactive'.tr, 'value': 2},
                          ],
                          defaultValue: {'label': 'Status *'.tr, 'value': 0},
                          isAnimation: true,
                          isResultLabel: true,
                          onChange: (value) {
                            controller.specialOfferValue.value = value['value'];
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
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Product image *'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.globalDefaultColor,
                          width: 0.4,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: DefaultFormField(
                              borderColors: Colors.white,
                              controller: controller.fileController,
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                              hint: 'Upload your photo'.tr,
                              isPassword: false,
                              enabled: true,
                              readOnly: true,
                              radius: 15,
                              autofocus: false,
                              focusBorderColor: Colors.white,
                              textColor: AppColor.globalDefaultColor,
                              filled: false,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColor.globalDefaultColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: SizeConfig.screenWidth > 400
                                          ? [
                                              TextSpan(
                                                text: 'Upload'.tr,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const WidgetSpan(
                                                  child: SizedBox(width: 8)),
                                              const WidgetSpan(
                                                child: Icon(
                                                  Icons.upload_outlined,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ]
                                          : [
                                              TextSpan(
                                                text: 'Upload'.tr,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                    ),
                                  ),
                                  //  iconData: PhosphorIcons.googleLogo,
                                  onPressed: () {
                                    Future.delayed(const Duration(seconds: 1),
                                        () async {
                                      await controller.openFileExplorer();
                                      controller.isDoneUpload.value
                                          ? controller.btnController.success()
                                          : controller.btnController.stop();
                                    });
                                  },
                                  // successIcon: Icons.done_outline_rounded,
                                  // controller: controller.btnController,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Other product images '.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => controller.otherImages.isEmpty
                          ? Container()
                          : SizedBox(
                              height: 100,
                              child: ListView.separated(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  right: 10,
                                  left: 5,
                                ),
                                clipBehavior: Clip.hardEdge,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ProductImage(
                                  image: controller.otherImages[index],
                                  borderColor: Colors.white,
                                  onTap: () {},
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 10),
                                itemCount: controller.otherImages.length,

                                // controller.singleProductModel.value!.data!
                                //     .otherImages!.length,
                              ),
                            ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.globalDefaultColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Upload'.tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                        ),
                        //  iconData: PhosphorIcons.googleLogo,
                        onPressed: () {
                          controller.getImages();
                        },
                        // successIcon: Icons.done_outline_rounded,
                        // controller: controller.btnController,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Category *'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: AppColor.globalDefaultColor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: CoolDropdown(
                          resultWidth: SizeConfig.screenWidth,
                          dropdownItemPadding: const EdgeInsets.all(5),
                          dropdownItemGap: 5,
                          dropdownHeight: 220,
                          dropdownList: controller
                              .categoryModel.value!.category!
                              .map((e) {
                            return {'label': e.name, 'value': e.id};
                          }).toList(),
                          defaultValue: {'label': 'Category *'.tr, 'value': 0},
                          isAnimation: true,
                          isResultLabel: true,
                          onChange: (value) {
                            controller.categoryValue.value = value['value'];
                            controller.getSubCategories(
                                categoryId:
                                    controller.categoryValue.value.toString());
                          },
                          dropdownItemReverse: true,
                          dropdownItemMainAxis: MainAxisAlignment.start,
                          resultMainAxis: MainAxisAlignment.start,
                          dropdownWidth: 210,
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
                    Obx(() {
                      return controller.subCategoryModel.value == null ||
                              controller.subCategoryModel.value!.subCategories!
                                  .isEmpty
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Sub Category *'.tr,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.5,
                                        color: AppColor.globalDefaultColor,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: CoolDropdown(
                                      resultWidth: SizeConfig.screenWidth,
                                      dropdownItemPadding:
                                          const EdgeInsets.all(5),
                                      dropdownItemGap: 5,
                                      dropdownHeight: 220,
                                      dropdownList: controller.subCategoryModel
                                          .value!.subCategories!
                                          .map((e) {
                                        return {'label': e.name, 'value': e.id};
                                      }).toList(),
                                      defaultValue: {
                                        'label': 'Sub Category *'.tr,
                                        'value': 0
                                      },
                                      isAnimation: true,
                                      isResultLabel: true,
                                      onChange: (value) {
                                        controller.subCategoryValue.value =
                                            value['value'];
                                      },
                                      dropdownItemReverse: true,
                                      dropdownItemMainAxis:
                                          MainAxisAlignment.start,
                                      resultMainAxis: MainAxisAlignment.start,
                                      dropdownWidth: 210,
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
                            );
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Status *'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: AppColor.globalDefaultColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: CoolDropdown(
                          resultWidth: SizeConfig.screenWidth,
                          dropdownItemPadding: const EdgeInsets.all(5),
                          dropdownItemGap: 5,
                          dropdownHeight: 130,
                          dropdownList: [
                            {'label': 'Active'.tr, 'value': 1},
                            {'label': 'Inactive'.tr, 'value': 2},
                          ],
                          defaultValue: const {'label': 'Status *', 'value': 0},
                          isAnimation: true,
                          isResultLabel: true,
                          onChange: (value) {
                            controller.statusValue.value = value['value'];
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
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Size *'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 1),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.productSizeModel.value!.sizes!.length,
                        itemBuilder: (context, index) => SizedBox(
                          width: 114,
                          child: Obx(() {
                            return ListTileTheme(
                              horizontalTitleGap: 0,
                              contentPadding: const EdgeInsets.all(0),
                              child: CheckboxListTile(
                                activeColor: AppColor.globalDefaultColor,
                                contentPadding: EdgeInsets.zero,
                                title: Text(controller.productSizeModel.value!
                                    .sizes![index].name!),
                                value: controller.selectSizes.contains(
                                    controller.productSizeModel.value!
                                        .sizes![index].id!
                                        .toString()),
                                onChanged: (value) {
                                  if (value!) {
                                    controller.selectSizes.add(controller
                                        .productSizeModel
                                        .value!
                                        .sizes![index]
                                        .id!
                                        .toString());
                                  } else {
                                    controller.selectSizes.remove(controller
                                        .productSizeModel
                                        .value!
                                        .sizes![index]
                                        .id!
                                        .toString());
                                  }

                                  // controller.checkedSize[index] = value!;
                                },
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Color *'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 5,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.productColorModel.value!.colors!.length,
                        itemBuilder: (context, index) => SizedBox(
                          width: 100,
                          child: Obx(() {
                            return ListTileTheme(
                              horizontalTitleGap: 0,
                              contentPadding: const EdgeInsets.all(0),
                              child: CheckboxListTile(
                                activeColor: AppColor.globalDefaultColor,
                                contentPadding: EdgeInsets.zero,
                                title: Text(controller.productColorModel.value!
                                    .colors![index].name!),
                                value: controller.selectColors.contains(
                                    controller.productColorModel.value!
                                        .colors![index].id!
                                        .toString()),
                                onChanged: (value) {
                                  if (value!) {
                                    controller.selectColors.add(controller
                                        .productColorModel
                                        .value!
                                        .colors![index]
                                        .id!
                                        .toString());
                                  } else {
                                    controller.selectColors.remove(controller
                                        .productColorModel
                                        .value!
                                        .colors![index]
                                        .id!
                                        .toString());
                                  }

                                  // controller.checkedSize[index] = value!;
                                },
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Product description *'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DefaultFormField(
                      validator: (product) {
                        if (product == null || product.isEmpty) {
                          return 'Product description is required'.tr;
                        }
                        return null;
                      },
                      controller: controller.productDescriptionController,
                      minLines: 5,
                      maxLines: 10,
                      borderColors: AppColor.globalDefaultColor,
                      isPassword: false,
                      enabled: true,
                      readOnly: false,
                      radius: 15,
                      autofocus: false,
                      focusBorderColor: AppColor.globalDefaultColor,
                      textColor: AppColor.globalDefaultColor,
                      filled: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ArgonButton(
                        height: 50,
                        roundLoadingShape: true,
                        width: SizeConfig.screenWidth,
                        onTap: (startLoading, stopLoading, btnState) async {
                          // startLoading();
                          if (controller.formKey.currentState!.validate() &&
                              controller.activeValue.value > 0 &&
                              controller.statusValue.value > 0 &&
                              controller.categoryValue.value > 0 &&
                              // controller.subCategoryValue.value > 0 &&
                              controller.specialOfferValue.value > 0) {
                            await controller.addNewProduct();
                            // await stopLoading();
                          } else {
                            Get.snackbar(
                              'Field required'.tr,
                              'Please Enter required field'.tr,
                              icon: const Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: AppColor.globalDefaultColor,
                              borderRadius: 15,
                              margin: const EdgeInsets.all(15),
                              colorText: Colors.white,
                              duration: const Duration(seconds: 2),
                              isDismissible: true,
                              dismissDirection: DismissDirection.horizontal,
                              forwardAnimationCurve: Curves.easeOutBack,
                            );
                            // await stopLoading();
                          }
                        },
                        loader: const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        borderRadius: 15,
                        color: AppColor.globalDefaultColor,
                        child: Text(
                          'Save'.tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      }),
    ));
  }
}
