import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quota_01/Screen/modal/Home_Modal.dart';
import 'package:quota_01/Untile/Database_Helper.dart';
import 'package:share_plus/share_plus.dart';

class Home_Controller extends GetxController {
  RxInt Index = 0.obs;
  RxInt Text = 0.obs;
  RxInt Star = 0.obs;
  RxInt copy = 0.obs;
  RxInt change = 0.obs;
  RxMap data = {}.obs;
  RxInt int = 0.obs;
  RxList Images = [
    "https://media.istockphoto.com/id/1007530412/photo/motivational-and-inspirational-quote.jpg?b=1&s=170667a&w=0&k=20&c=o1c1KvItwuAzZoWV6cPQ94Vg_pThhrSSv31jiSH9xbM=",
    "https://media.istockphoto.com/id/832627352/photo/happiness.jpg?s=612x612&w=0&k=20&c=EqwWl2XyvchPZIWepVcVmYOR0hFjnbJ27JX08mTmOw0=",
    "https://i.pinimg.com/736x/72/06/b2/7206b2a5d99b196f518f012cfd607444.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/50568-Daniel-J-Boorstin-Quote-Education-is-learning-what-you-didn-t-even.jpg",
    "https://wallpaperaccess.com/full/4956105.jpg",
    "https://media.istockphoto.com/id/1356112888/photo/create-life-balance-message-on-a-notepaper-with-stone-formation-on-the-table-indoor-on-white.jpg?b=1&s=170667a&w=0&k=20&c=-W1qjIVsT09n61_e89v7wcvMVFJOZrH5GBcUFQI-HnY=",
  ].obs;
  List l1 = [];
  RxInt DataIndex = 0.obs;


  RxList<Home_Modal> quotelist = <Home_Modal>[
    Home_Modal(
        colors: Colors.blueAccent,
        image: [
          "https://media.istockphoto.com/id/1007530412/photo/motivational-and-inspirational-quote.jpg?b=1&s=170667a&w=0&k=20&c=o1c1KvItwuAzZoWV6cPQ94Vg_pThhrSSv31jiSH9xbM=",
          "https://media.istockphoto.com/id/832627352/photo/happiness.jpg?s=612x612&w=0&k=20&c=EqwWl2XyvchPZIWepVcVmYOR0hFjnbJ27JX08mTmOw0=",
          "https://i.pinimg.com/736x/72/06/b2/7206b2a5d99b196f518f012cfd607444.jpg",
          "https://quotefancy.com/media/wallpaper/3840x2160/50568-Daniel-J-Boorstin-Quote-Education-is-learning-what-you-didn-t-even.jpg",
          "https://wallpaperaccess.com/full/4956105.jpg",
          "https://media.istockphoto.com/id/1356112888/photo/create-life-balance-message-on-a-notepaper-with-stone-formation-on-the-table-indoor-on-white.jpg?b=1&s=170667a&w=0&k=20&c=-W1qjIVsT09n61_e89v7wcvMVFJOZrH5GBcUFQI-HnY=",
        ],
        quote:
            "જ્યાં સુધી આપણું અંતિમ લક્ષ્ય પ્રાપ્ત ન થાય ત્યાં સુધી ક્રમશ: વધુ દુઃખ સહન કરવાની શક્તિ આપણામાં આવવી જોઈએ, આ જ સાચી જીત છે.",
        author_name: "સરદાર પટેલ"),
    Home_Modal(
        colors: Colors.green.shade300,
        image: [
          "https://media.istockphoto.com/id/1007530412/photo/motivational-and-inspirational-quote.jpg?b=1&s=170667a&w=0&k=20&c=o1c1KvItwuAzZoWV6cPQ94Vg_pThhrSSv31jiSH9xbM=",
          "https://media.istockphoto.com/id/832627352/photo/happiness.jpg?s=612x612&w=0&k=20&c=EqwWl2XyvchPZIWepVcVmYOR0hFjnbJ27JX08mTmOw0=",
          "https://i.pinimg.com/736x/72/06/b2/7206b2a5d99b196f518f012cfd607444.jpg",
          "https://quotefancy.com/media/wallpaper/3840x2160/50568-Daniel-J-Boorstin-Quote-Education-is-learning-what-you-didn-t-even.jpg",
          "https://wallpaperaccess.com/full/4956105.jpg",
          "https://media.istockphoto.com/id/1356112888/photo/create-life-balance-message-on-a-notepaper-with-stone-formation-on-the-table-indoor-on-white.jpg?b=1&s=170667a&w=0&k=20&c=-W1qjIVsT09n61_e89v7wcvMVFJOZrH5GBcUFQI-HnY=",
        ],
        quote:
            "if i had flower for every time thought of you...i could walk through my garden forever.",
        author_name: "Alfred Lord Tennyson"),
    Home_Modal(
        colors: Colors.brown.shade300,
        image: [
          "https://media.istockphoto.com/id/1007530412/photo/motivational-and-inspirational-quote.jpg?b=1&s=170667a&w=0&k=20&c=o1c1KvItwuAzZoWV6cPQ94Vg_pThhrSSv31jiSH9xbM=",
          "https://media.istockphoto.com/id/832627352/photo/happiness.jpg?s=612x612&w=0&k=20&c=EqwWl2XyvchPZIWepVcVmYOR0hFjnbJ27JX08mTmOw0=",
          "https://i.pinimg.com/736x/72/06/b2/7206b2a5d99b196f518f012cfd607444.jpg",
          "https://quotefancy.com/media/wallpaper/3840x2160/50568-Daniel-J-Boorstin-Quote-Education-is-learning-what-you-didn-t-even.jpg",
          "https://wallpaperaccess.com/full/4956105.jpg",
          "https://media.istockphoto.com/id/1356112888/photo/create-life-balance-message-on-a-notepaper-with-stone-formation-on-the-table-indoor-on-white.jpg?b=1&s=170667a&w=0&k=20&c=-W1qjIVsT09n61_e89v7wcvMVFJOZrH5GBcUFQI-HnY=",
        ],
        quote: "Speak low if you Speak love",
        author_name: "William shakespeare"),
    Home_Modal(
        colors: Colors.teal.shade300,
        image: [
          "https://media.istockphoto.com/id/1007530412/photo/motivational-and-inspirational-quote.jpg?b=1&s=170667a&w=0&k=20&c=o1c1KvItwuAzZoWV6cPQ94Vg_pThhrSSv31jiSH9xbM=",
          "https://media.istockphoto.com/id/832627352/photo/happiness.jpg?s=612x612&w=0&k=20&c=EqwWl2XyvchPZIWepVcVmYOR0hFjnbJ27JX08mTmOw0=",
          "https://i.pinimg.com/736x/72/06/b2/7206b2a5d99b196f518f012cfd607444.jpg",
          "https://quotefancy.com/media/wallpaper/3840x2160/50568-Daniel-J-Boorstin-Quote-Education-is-learning-what-you-didn-t-even.jpg",
          "https://wallpaperaccess.com/full/4956105.jpg",
          "https://media.istockphoto.com/id/1356112888/photo/create-life-balance-message-on-a-notepaper-with-stone-formation-on-the-table-indoor-on-white.jpg?b=1&s=170667a&w=0&k=20&c=-W1qjIVsT09n61_e89v7wcvMVFJOZrH5GBcUFQI-HnY=",
        ],
        quote: "जीवन आपको दो बार एक ही मोका नहीं दे सकता है।",
        author_name: "चेतन भगत"),
  ].obs;
  RxList<Home_Modal> quotelist1 = <Home_Modal>[
    Home_Modal(
        colors: Colors.blueAccent,
        image: [
          "https://media.istockphoto.com/id/1007530412/photo/motivational-and-inspirational-quote.jpg?b=1&s=170667a&w=0&k=20&c=o1c1KvItwuAzZoWV6cPQ94Vg_pThhrSSv31jiSH9xbM=",
          "https://media.istockphoto.com/id/832627352/photo/happiness.jpg?s=612x612&w=0&k=20&c=EqwWl2XyvchPZIWepVcVmYOR0hFjnbJ27JX08mTmOw0=",
          "https://i.pinimg.com/736x/72/06/b2/7206b2a5d99b196f518f012cfd607444.jpg",
          "https://quotefancy.com/media/wallpaper/3840x2160/50568-Daniel-J-Boorstin-Quote-Education-is-learning-what-you-didn-t-even.jpg",
          "https://wallpaperaccess.com/full/4956105.jpg",
          "https://media.istockphoto.com/id/1356112888/photo/create-life-balance-message-on-a-notepaper-with-stone-formation-on-the-table-indoor-on-white.jpg?b=1&s=170667a&w=0&k=20&c=-W1qjIVsT09n61_e89v7wcvMVFJOZrH5GBcUFQI-HnY=",
        ],
        quote:
        "જ્યાં સુધી આપણું અંતિમ લક્ષ્ય પ્રાપ્ત ન થાય ત્યાં સુધી ક્રમશ: વધુ દુઃખ સહન કરવાની શક્તિ આપણામાં આવવી જોઈએ, આ જ સાચી જીત છે.",
        author_name: "સરદાર પટેલ"),
    Home_Modal(
        colors: Colors.green.shade300,
        image: [
          "https://media.istockphoto.com/id/1007530412/photo/motivational-and-inspirational-quote.jpg?b=1&s=170667a&w=0&k=20&c=o1c1KvItwuAzZoWV6cPQ94Vg_pThhrSSv31jiSH9xbM=",
          "https://media.istockphoto.com/id/832627352/photo/happiness.jpg?s=612x612&w=0&k=20&c=EqwWl2XyvchPZIWepVcVmYOR0hFjnbJ27JX08mTmOw0=",
          "https://i.pinimg.com/736x/72/06/b2/7206b2a5d99b196f518f012cfd607444.jpg",
          "https://quotefancy.com/media/wallpaper/3840x2160/50568-Daniel-J-Boorstin-Quote-Education-is-learning-what-you-didn-t-even.jpg",
          "https://wallpaperaccess.com/full/4956105.jpg",
          "https://media.istockphoto.com/id/1356112888/photo/create-life-balance-message-on-a-notepaper-with-stone-formation-on-the-table-indoor-on-white.jpg?b=1&s=170667a&w=0&k=20&c=-W1qjIVsT09n61_e89v7wcvMVFJOZrH5GBcUFQI-HnY=",
        ],
        quote:
        "if i had flower for every time thought of you...i could walk through my garden forever.",
        author_name: "Alfred Lord Tennyson"),
    Home_Modal(
        colors: Colors.brown.shade300,
        image: [
          "https://media.istockphoto.com/id/1007530412/photo/motivational-and-inspirational-quote.jpg?b=1&s=170667a&w=0&k=20&c=o1c1KvItwuAzZoWV6cPQ94Vg_pThhrSSv31jiSH9xbM=",
          "https://media.istockphoto.com/id/832627352/photo/happiness.jpg?s=612x612&w=0&k=20&c=EqwWl2XyvchPZIWepVcVmYOR0hFjnbJ27JX08mTmOw0=",
          "https://i.pinimg.com/736x/72/06/b2/7206b2a5d99b196f518f012cfd607444.jpg",
          "https://quotefancy.com/media/wallpaper/3840x2160/50568-Daniel-J-Boorstin-Quote-Education-is-learning-what-you-didn-t-even.jpg",
          "https://wallpaperaccess.com/full/4956105.jpg",
          "https://media.istockphoto.com/id/1356112888/photo/create-life-balance-message-on-a-notepaper-with-stone-formation-on-the-table-indoor-on-white.jpg?b=1&s=170667a&w=0&k=20&c=-W1qjIVsT09n61_e89v7wcvMVFJOZrH5GBcUFQI-HnY=",
        ],
        quote: "Speak low if you Speak love",
        author_name: "William shakespeare"),
    Home_Modal(
        colors: Colors.teal.shade300,
        image: [
          "https://media.istockphoto.com/id/1007530412/photo/motivational-and-inspirational-quote.jpg?b=1&s=170667a&w=0&k=20&c=o1c1KvItwuAzZoWV6cPQ94Vg_pThhrSSv31jiSH9xbM=",
          "https://media.istockphoto.com/id/832627352/photo/happiness.jpg?s=612x612&w=0&k=20&c=EqwWl2XyvchPZIWepVcVmYOR0hFjnbJ27JX08mTmOw0=",
          "https://i.pinimg.com/736x/72/06/b2/7206b2a5d99b196f518f012cfd607444.jpg",
          "https://quotefancy.com/media/wallpaper/3840x2160/50568-Daniel-J-Boorstin-Quote-Education-is-learning-what-you-didn-t-even.jpg",
          "https://wallpaperaccess.com/full/4956105.jpg",
          "https://media.istockphoto.com/id/1356112888/photo/create-life-balance-message-on-a-notepaper-with-stone-formation-on-the-table-indoor-on-white.jpg?b=1&s=170667a&w=0&k=20&c=-W1qjIVsT09n61_e89v7wcvMVFJOZrH5GBcUFQI-HnY=",
        ],
        quote: "जीवन आपको दो बार एक ही मोका नहीं दे सकता है।",
        author_name: "चेतन भगत"),
  ].obs;
  Future<void> GetData()
  async {
    l1 = await Database_Helper().readdb();
    update();
  }

  Future<void> GetData2()
  async {
    l1 = await Database_Helper().readdb();
    data.value = l1[DataIndex.value];
    update();
  }
}
