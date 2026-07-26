import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'community_controller.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final controller = Get.put(CommunityController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Community',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 2.5,
              ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purple,
        onPressed: () => _showCreatePostSheet(context, controller),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: purple));
        }
        if (controller.posts.isEmpty) {
          return const Center(
            child: Text('No posts yet. Be the first to post!'),
          );
        }
        return RefreshIndicator(
          onRefresh: controller.fetchPosts,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.posts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final post = controller.posts[index];
              return _PostCard(post: post, controller: controller);
            },
          ),
        );
      }),
    );
  }

  void _showCreatePostSheet(BuildContext context, CommunityController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Create Post',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.bodyController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'What\'s on your mind?',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.createPost,
                style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Submit Post'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final dynamic post;
  final CommunityController controller;
  const _PostCard({required this.post, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(post.body, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('@${post.authorUsername}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                const Spacer(),
                Obx(() {
                  final p = controller.posts
                      .firstWhere((x) => x.id == post.id, orElse: () => post);
                  return GestureDetector(
                    onTap: () => controller.toggleLike(p),
                    child: Row(
                      children: [
                        Icon(
                          p.likedByMe
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: p.likedByMe ? Colors.red : Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text('${p.likes}',
                            style: const TextStyle(fontSize: 13)),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
