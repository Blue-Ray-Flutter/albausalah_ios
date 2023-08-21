import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../../shared/components/constants/style/color.dart';
import '../../shared/components/widgets/button/button.dart';
import '../../shared/components/widgets/size_config/size_config.dart';
import '../../shared/components/widgets/text_filed/text_form_filed_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController textEditingController = TextEditingController();
  late PickerMapController controller = PickerMapController(
    initMapWithUserPosition: true,
  );

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(textOnChanged);
  }

  void textOnChanged() {
    controller.setSearchableText(textEditingController.text);
  }

  @override
  void dispose() {
    textEditingController.removeListener(textOnChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: CustomPickerLocation(
        controller: controller,
        appBarPicker: AppBar(
          elevation: 0,
          title:  Text(
            'Pick your address'.tr,
          ),
          centerTitle: true,
        ),
        topWidgetPicker: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 8,
            right: 8,
          ),
          child: Column(
            children: [
              DefaultFormField(
                hint: 'Search'.tr,
                controller: textEditingController,
                onSubmit: (value) async {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                prefixIcon: Icons.search,
                suffix: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: textEditingController,
                  builder: (ctx, text, child) {
                    if (text.text.isNotEmpty) {
                      return child!;
                    }
                    return const SizedBox.shrink();
                  },
                  child: InkWell(
                    focusNode: FocusNode(),
                    onTap: () {
                      textEditingController.clear();
                      controller.setSearchableText("");
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                isPassword: false,
                enabled: true,
                readOnly: false,
                radius: 15,
                autofocus: false,
                focusBorderColor: AppColor.globalDefaultColor,
                textColor: AppColor.globalDefaultColor,
                filled: true,
                fillColor: Colors.grey[200],
              ),
              const SizedBox(
                height: 8,
              ),
              const TopSearchWidget()
            ],
          ),
        ),
        bottomWidgetPicker: Positioned(
          bottom: 12,
          right: (SizeConfig.screenWidth - SizeConfig.screenWidth * 0.8) -
              SizeConfig.screenWidth * 0.12,
          child: PointerInterceptor(
            child: Button(
              height: 45,
              width: SizeConfig.screenWidth * 0.8,
              text: 'Pick'.tr,
              radius: 15,
              onPressed: () async {
                GeoPoint p = await controller.selectAdvancedPositionPicker();
                Navigator.pop(context, p);
              },
            ),
          ),
        ),
        pickerConfig: const CustomPickerLocationConfig(
            initZoom: 8,
            advancedMarkerPicker: MarkerIcon(
              icon: Icon(
                Icons.location_on,
                size: 150,
                color: AppColor.globalDefaultColor,
              ),
            )),
      ),
    );
  }
}

class TopSearchWidget extends StatefulWidget {
  const TopSearchWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TopSearchWidgetState();
}

class _TopSearchWidgetState extends State<TopSearchWidget> {
  late PickerMapController controller;
  ValueNotifier<GeoPoint?> notifierGeoPoint = ValueNotifier(null);
  ValueNotifier<bool> notifierAutoCompletion = ValueNotifier(false);

  late StreamController<List<SearchInfo>> streamSuggestion = StreamController();
  late Future<List<SearchInfo>> _futureSuggestionAddress;
  String oldText = "";
  Timer? _timerToStartSuggestionReq;
  final Key streamKey = const Key("streamAddressSug");

  @override
  void initState() {
    super.initState();
    controller = CustomPickerLocation.of(context);
    controller.searchableText.addListener(onSearchableTextChanged);
  }

  void onSearchableTextChanged() async {
    final v = controller.searchableText.value;
    if (v.length > 3 && oldText != v) {
      oldText = v;
      if (_timerToStartSuggestionReq != null &&
          _timerToStartSuggestionReq!.isActive) {
        _timerToStartSuggestionReq!.cancel();
      }
      _timerToStartSuggestionReq =
          Timer.periodic(const Duration(seconds: 3), (timer) async {
        await suggestionProcessing(v);
        timer.cancel();
      });
    }
    if (v.isEmpty) {
      await reInitStream();
    }
  }

  Future reInitStream() async {
    notifierAutoCompletion.value = false;
    await streamSuggestion.close();
    setState(() {
      streamSuggestion = StreamController();
    });
  }

  Future<void> suggestionProcessing(String addr) async {
    notifierAutoCompletion.value = true;
    _futureSuggestionAddress = addressSuggestion(
      addr,
      limitInformation: 5,
    );
    _futureSuggestionAddress.then((value) {
      streamSuggestion.sink.add(value);
    });
  }

  @override
  void dispose() {
    controller.searchableText.removeListener(onSearchableTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: notifierAutoCompletion,
      builder: (ctx, isVisible, child) {
        return AnimatedContainer(
          duration: const Duration(
            milliseconds: 500,
          ),
          height: isVisible ? MediaQuery.of(context).size.height / 4 : 0,
          child: Card(
            child: child!,
          ),
        );
      },
      child: StreamBuilder<List<SearchInfo>>(
        stream: streamSuggestion.stream,
        key: streamKey,
        builder: (ctx, snap) {
          if (snap.hasData) {
            return ListView.builder(
              itemExtent: 50.0,
              itemBuilder: (ctx, index) {
                return PointerInterceptor(
                  child: ListTile(
                    title: Text(
                      snap.data![index].address.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                    onTap: () async {
                      /// go to location selected by address
                      controller.goToLocation(
                        snap.data![index].point!,
                      );

                      /// hide suggestion card
                      notifierAutoCompletion.value = false;
                      await reInitStream();
                      FocusScope.of(context).requestFocus(
                        FocusNode(),
                      );
                    },
                  ),
                );
              },
              itemCount: snap.data!.length,
            );
          }
          if (snap.connectionState == ConnectionState.waiting) {
            return const Card(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
