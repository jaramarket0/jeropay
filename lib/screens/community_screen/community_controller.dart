import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/services/api_service.dart';
import 'package:jeropay/config/app_toast.dart';

class CommunityPost {
  final int id;
  final String title;
  final String body;
  final String authorUsername;
  final String createdAt;
  int likes;
  bool likedByMe;

  CommunityPost({
    required this.id,
    required this.title,
    required this.body,
    required this.authorUsername,
    required this.createdAt,
    required this.likes,
    required this.likedByMe,
  });

  factory CommunityPost.fromJson(Map<String, dynamic> json) => CommunityPost(
        id: json['id'],
        title: json['title'] ?? '',
        body: json['body'] ?? '',
        authorUsername: json['author_username'] ?? '',
        createdAt: json['created_at'] ?? '',
        likes: json['likes'] ?? 0,
        likedByMe: json['liked_by_me'] ?? false,
      );
}

class CommunityController extends GetxController {
  ApiService apiService = ApiService(const Duration(seconds: 30));

  var posts = <CommunityPost>[].obs;
  var isLoading = false.obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      final response = await apiService.getCommunityPosts();
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final list = (data['data'] as List)
            .map((e) => CommunityPost.fromJson(e))
            .toList();
        posts.value = list;
      }
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> toggleLike(CommunityPost post) async {
    try {
      final response = await apiService.likeCommunityPost(post.id.toString());
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final idx = posts.indexWhere((p) => p.id == post.id);
        if (idx != -1) {
          posts[idx].likes = data['likes'];
          posts[idx].likedByMe = data['action'] == 'liked';
          posts.refresh();
        }
      }
    } catch (_) {}
  }

  Future<void> createPost() async {
    final title = titleController.text.trim();
    final body = bodyController.text.trim();
    if (title.isEmpty || body.isEmpty) {
      AppToast.error('Title and body are required');
      return;
    }
    try {
      final response = await apiService.createCommunityPost({'title': title, 'body': body});
      if (response.statusCode == 201) {
        titleController.clear();
        bodyController.clear();
        Get.back();
        AppToast.success('Your post is pending admin approval');
      } else {
        AppToast.error('Could not submit post');
      }
    } catch (e) {
      AppToast.error(e.toString());
    }
  }
}
