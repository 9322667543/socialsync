// ignore_for_file: non_constant_identifier_names

import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:oneview/GlobalVariables/Global.dart";
import "package:oneview/pages/aiPostGeneration.dart";
import "package:oneview/pages/homePage.dart";
import "package:page_transition/page_transition.dart";

postApi(List platforms, String postMessage, List mediaurl, context) async {
  var headersList = {
    'Accept': '*/*',
    'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    'Authorization': 'Bearer 5CYNDR3-YYPMF07-PDFH1HB-JHTSSR8',
    'Content-Type': 'application/json'
  };
  var url = Uri.parse('https://app.ayrshare.com/api/post');

  var body = {
    "post": postMessage,
    "platforms": platforms,
    "mediaUrls": mediaurl
  };

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  var list=jsonDecode(resBody);
  print(list);
  if (list[0]=="success") {
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: homePage(), type: PageTransitionType.leftToRight));
  }
  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
  } else {
    print(res.reasonPhrase);
  }
}

connectToInstagram() async {
  var headersList = {
    'Accept': '*/*',
    'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    'Content-Type': 'application/json'
  };
  var url = Uri.parse('https://hacks-backend.onrender.com/connect-instagram');

  var body = {"username": "vishwa_sinha_95", "password": "Vishwa@insta"};

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
  } else {
    print(res.reasonPhrase);
  }
}

getInstagramPosts() async {
  var headersList = {
    'Accept': '*/*',
    'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
  };
  var url = Uri.parse('https://hacks-backend.onrender.com/get-facebook-posts');

  var req = http.Request('GET', url);
  req.headers.addAll(headersList);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  postsData = jsonDecode(resBody)["data"];
  for (int i = 0; i < postsData.length; i++) {
    imageUrls.add(postsData[i]['full_picture']);
    titles.add(postsData[i]['message']);
    // Likes.add(postsData[i]['like_count']);
    // comments.add(postsData[i]['comment_count']);
  }

  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
  } else {
    print(res.reasonPhrase);
  }
}

textToImage(String TextFromUser, context) async {
  var headersList = {
    'Accept': '*/*',
    'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    'Content-Type': 'application/json'
  };
  var url =
      Uri.parse('https://hacks-backend.onrender.com/generate-image-from-text');

  var body = {"title": TextFromUser};

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  if (resBody.contains("https")) {
    aiGenratedImageUrl = resBody;
    generateCaption(TextFromUser, context);
  }
  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
  } else {
    print(res.reasonPhrase);
  }
}

generateCaption(String TextFromUser, context) async {
  var headersList = {
    'Accept': '*/*',
    'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    'Content-Type': 'application/json'
  };
  var url = Uri.parse('https://hacks-backend.onrender.com/generate-caption');

  var body = {"title": TextFromUser};

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  if (resBody.isNotEmpty) {
    aiGenratedCaption = resBody;
    isLoading = false;
    Navigator.push(
        context,
        PageTransition(
            child: AiPostGen(
              inputData: TextFromUser,
            ),
            type: PageTransitionType.leftToRight));
  }
  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
  } else {
    print(res.reasonPhrase);
  }
}
