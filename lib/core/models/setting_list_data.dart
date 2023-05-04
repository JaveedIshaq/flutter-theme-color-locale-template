import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/core/controllers/localization_controller.dart';

class SettingsListData {
  String titleTxt;
  String subTxt;
  IconData iconData;
  bool isSelected;

  SettingsListData({
    this.titleTxt = '',
    this.isSelected = false,
    this.subTxt = '',
    this.iconData = Icons.supervised_user_circle,
  });

  List<SettingsListData> getCountryListFromJson(Map<String, dynamic> json) {
    List<SettingsListData> countryList = [];
    if (json['countryList'] != null) {
      json['countryList'].forEach((v) {
        SettingsListData data = SettingsListData();
        data.titleTxt = v["name"];
        data.subTxt = v["code"];
        countryList.add(data);
      });
    }
    return countryList;
  }

  static List<SettingsListData> get settingsList => [
        SettingsListData(
          titleTxt: Loc.alized.notifications,
          isSelected: false,
          iconData: FontAwesomeIcons.solidBell,
        ),
        SettingsListData(
          titleTxt: Loc.alized.theme_mode,
          isSelected: false,
          iconData: FontAwesomeIcons.skyatlas,
        ),
        SettingsListData(
          titleTxt: Loc.alized.fonts,
          isSelected: false,
          iconData: FontAwesomeIcons.font,
        ),
        SettingsListData(
          titleTxt: Loc.alized.color,
          isSelected: false,
          iconData: Icons.color_lens,
        ),
        SettingsListData(
          titleTxt: Loc.alized.language,
          isSelected: false,
          iconData: Icons.translate_outlined,
        ),
        SettingsListData(
          titleTxt: Loc.alized.country,
          isSelected: false,
          iconData: FontAwesomeIcons.userGroup,
        ),
        SettingsListData(
          titleTxt: Loc.alized.currency,
          isSelected: false,
          iconData: FontAwesomeIcons.gift,
        ),
        SettingsListData(
          titleTxt: Loc.alized.terms_of_services,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        ),
        SettingsListData(
          titleTxt: Loc.alized.privacy_policy,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        ),
        SettingsListData(
          titleTxt: Loc.alized.give_us_feedbacks,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        ),
        SettingsListData(
          titleTxt: Loc.alized.log_out,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        )
      ];

  static List<SettingsListData> currencyList = [
    SettingsListData(
      titleTxt: 'Australia Dollar',
      subTxt: "\$ AUD",
    ),
    SettingsListData(
      titleTxt: 'Argentina Peso',
      subTxt: "\$ ARS",
    ),
    SettingsListData(
      titleTxt: 'Indian rupee',
      subTxt: "₹ Rupee",
    ),
    SettingsListData(
      titleTxt: 'United States Dollar',
      subTxt: "\$ USD",
    ),
    SettingsListData(
      titleTxt: 'Chinese Yuan',
      subTxt: "¥ Yuan",
    ),
    SettingsListData(
      titleTxt: 'Belgian Euro',
      subTxt: "€ Euro",
    ),
    SettingsListData(
      titleTxt: 'Brazilian Real',
      subTxt: "R\$ Real",
    ),
    SettingsListData(
      titleTxt: 'Canadian Dollar',
      subTxt: "\$ CAD",
    ),
    SettingsListData(
      titleTxt: 'Cuban Peso',
      subTxt: "₱ PESO",
    ),
    SettingsListData(
      titleTxt: 'French Euro',
      subTxt: "€ Euro",
    ),
    SettingsListData(
      titleTxt: 'Hong Kong Dollar',
      subTxt: "\$ HKD",
    ),
    SettingsListData(
      titleTxt: 'Italian Lira',
      subTxt: "€ Euro",
    ),
    SettingsListData(
      titleTxt: 'New Zealand Dollar',
      subTxt: "\$ NZ",
    ),
  ];
}
