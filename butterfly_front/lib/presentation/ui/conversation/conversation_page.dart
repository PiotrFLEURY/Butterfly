import 'package:butterfly_front/presentation/states/providers.dart';
import 'package:butterfly_front/presentation/styles/colors.dart';
import 'package:butterfly_front/presentation/ui/contacts/views/rounded_square_picture.dart';
import 'package:butterfly_front/presentation/ui/conversation/views/message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConversationPage extends ConsumerWidget {
  ConversationPage({
    super.key,
    required this.id,
  });

  final String id;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversation = ref.watch(conversationProvider);
    if (conversation == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverPersistentHeader(
              delegate: ConversationPersistentHeaderDelegate(),
            ),
          ];
        },
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: conversation.messages.length,
                itemBuilder: (context, index) {
                  return MessageItem(
                    isMe: conversation.messages[index].senderId ==
                        'connected_user@example.com',
                    message: conversation.messages[index],
                  );
                },
              ),
            ),
            Container(
              color: ButterflyColors.secondary,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 24,
                      color: ButterflyColors.quinary,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      focusNode: _focusNode,
                      controller: _controller,
                      onFieldSubmitted: (value) {
                        ref
                            .read(conversationProvider.notifier)
                            .sendMessage(value);
                        _controller.clear();
                        _focusNode.requestFocus();
                      },
                      textInputAction: TextInputAction.send,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: const TextStyle(
                        color: ButterflyColors.primary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera,
                      size: 24,
                      color: ButterflyColors.quinary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mic,
                      size: 24,
                      color: ButterflyColors.quinary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConversationPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  const ConversationPersistentHeaderDelegate();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return const _Header();
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversation = ref.watch(conversationProvider);
    return Container(
      color: ButterflyColors.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: ListTile(
        title: Row(
          children: [
            RoundedSquarePicture(
              borderRadius: 4,
              url: conversation?.participants[0].profilePicture ??
                  'https://picsum.photos/200',
              size: 76,
            ),
            const SizedBox(width: 16),
            Text(
              conversation?.participants[0].name ?? 'unknown participant',
              style: const TextStyle(
                color: ButterflyColors.quaternary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                GoRouter.of(context).pop();
              },
              color: ButterflyColors.quinary,
              iconSize: 32,
            ),
          ],
        ),
        subtitle: Row(
          children: [
            const SizedBox(width: 96),
            const Text(
              'Carpe diem',
              style: TextStyle(
                color: ButterflyColors.quaternary,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined),
              onPressed: () {},
              color: ButterflyColors.quinary,
              iconSize: 24,
            ),
            IconButton(
              icon: const Icon(Icons.phone_outlined),
              onPressed: () {},
              color: ButterflyColors.quinary,
              iconSize: 24,
            ),
          ],
        ),
      ),
    );
  }
}
