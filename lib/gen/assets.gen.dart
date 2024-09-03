/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/5qdZDIR369.json
  String get a5qdZDIR369 => 'assets/animations/5qdZDIR369.json';

  /// File path: assets/animations/DsaIGmBy0d.json
  String get dsaIGmBy0d => 'assets/animations/DsaIGmBy0d.json';

  /// File path: assets/animations/lets_cook_animation.json
  String get letsCookAnimation => 'assets/animations/lets_cook_animation.json';

  /// File path: assets/animations/rate_meal_animation.json
  String get rateMealAnimation => 'assets/animations/rate_meal_animation.json';

  /// List of all assets
  List<String> get values =>
      [a5qdZDIR369, dsaIGmBy0d, letsCookAnimation, rateMealAnimation];
}

class $AssetsColorsGen {
  const $AssetsColorsGen();

  /// File path: assets/colors/mycolors.xml
  String get mycolors => 'assets/colors/mycolors.xml';

  /// List of all assets
  List<String> get values => [mycolors];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/appIcon2.png
  AssetGenImage get appIcon2 =>
      const AssetGenImage('assets/images/appIcon2.png');

  /// File path: assets/images/calories.svg
  String get calories => 'assets/images/calories.svg';

  /// File path: assets/images/chef.svg
  String get chef => 'assets/images/chef.svg';

  /// File path: assets/images/dummy_recipe.png
  AssetGenImage get dummyRecipe =>
      const AssetGenImage('assets/images/dummy_recipe.png');

  /// File path: assets/images/filled_heart.svg
  String get filledHeart => 'assets/images/filled_heart.svg';

  /// File path: assets/images/filled_star.svg
  String get filledStar => 'assets/images/filled_star.svg';

  /// File path: assets/images/followicon.svg
  String get followicon => 'assets/images/followicon.svg';

  /// File path: assets/images/heart.svg
  String get heart => 'assets/images/heart.svg';

  /// File path: assets/images/home.svg
  String get home => 'assets/images/home.svg';

  /// File path: assets/images/icon_profile-fill.svg
  String get iconProfileFill => 'assets/images/icon_profile-fill.svg';

  /// File path: assets/images/minus.svg
  String get minus => 'assets/images/minus.svg';

  /// File path: assets/images/pancakes_dummy.png
  AssetGenImage get pancakesDummy =>
      const AssetGenImage('assets/images/pancakes_dummy.png');

  /// File path: assets/images/play_button.svg
  String get playButton => 'assets/images/play_button.svg';

  /// File path: assets/images/plus.svg
  String get plus => 'assets/images/plus.svg';

  /// File path: assets/images/ramen_dummy.png
  AssetGenImage get ramenDummy =>
      const AssetGenImage('assets/images/ramen_dummy.png');

  /// File path: assets/images/searchicon.svg
  String get searchicon => 'assets/images/searchicon.svg';

  /// File path: assets/images/servings.svg
  String get servings => 'assets/images/servings.svg';

  /// File path: assets/images/spaghetti_dummy.png
  AssetGenImage get spaghettiDummy =>
      const AssetGenImage('assets/images/spaghetti_dummy.png');

  /// File path: assets/images/star.svg
  String get star => 'assets/images/star.svg';

  /// File path: assets/images/timer.svg
  String get timer => 'assets/images/timer.svg';

  /// File path: assets/images/uplaod_arrow.svg
  String get uplaodArrow => 'assets/images/uplaod_arrow.svg';

  /// File path: assets/images/upload_image.svg
  String get uploadImage => 'assets/images/upload_image.svg';

  /// List of all assets
  List<dynamic> get values => [
        appIcon2,
        calories,
        chef,
        dummyRecipe,
        filledHeart,
        filledStar,
        followicon,
        heart,
        home,
        iconProfileFill,
        minus,
        pancakesDummy,
        playButton,
        plus,
        ramenDummy,
        searchicon,
        servings,
        spaghettiDummy,
        star,
        timer,
        uplaodArrow,
        uploadImage
      ];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsColorsGen colors = $AssetsColorsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
