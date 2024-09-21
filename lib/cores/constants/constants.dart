import 'package:dio/dio.dart';

//url
const baseUrl = 'https://jsonplaceholder.typicode.com';
Options options = Options(headers: {"Content-Type": "application/json"});

//shared refrencese
const kCachedPostData = "CACHED_POST_DATA";

//json keys
const kId = 'id';
const kTitle = 'title';
const kBody = 'body';
