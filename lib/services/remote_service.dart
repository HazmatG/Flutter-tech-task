import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/bitcoinpost.dart';

class RemoteServices {
  Future<List<Coin>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  }
}