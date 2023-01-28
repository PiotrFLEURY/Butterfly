import 'package:butterfly_models/butterfly_models.dart';
import 'package:butterfly_front/presentation/states/providers.dart';
import 'package:butterfly_front/presentation/styles/colors.dart';
import 'package:butterfly_front/presentation/ui/contacts/views/rounded_square_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              const SliverPersistentHeader(
                delegate: PersistentHeaderDelegate(),
              ),
              const SliverAppBar(
                backgroundColor: ButterflyColors.secondary,
                floating: false,
                pinned: true,
                title: TabBar(
                  indicatorColor: ButterflyColors.quinary,
                  indicatorWeight: 3,
                  labelPadding: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  tabs: [
                    CustomTab(
                      text: 'chats',
                      badgeCount: 3,
                    ),
                    CustomTab(
                      text: 'groups',
                      badgeCount: 2,
                    ),
                    CustomTab(text: 'contacts'),
                  ],
                ),
              ),
            ];
          }),
          body: const TabBarView(
            children: [
              ConversationList(),
              ConversationList(),
              ConversationList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ConversationList extends ConsumerWidget {
  const ConversationList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(chatListProvider);
    return CustomScrollView(
      slivers: chats.map((chatGroup) {
        return SliverPersistentHeader(
          delegate: ChatGroupPersistentHeaderDelegate(chatGroup: chatGroup),
        );
      }).toList(),
    );
  }
}

class ChatGroupPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  const ChatGroupPersistentHeaderDelegate({
    required this.chatGroup,
  });

  final ChatGroup chatGroup;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chatGroup.name,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              color: ButterflyColors.quaternary,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatGroup.conversations.length,
              itemBuilder: ((context, index) {
                var conversation = chatGroup.conversations[index];
                return ContactItem(conversation: conversation);
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class ContactItem extends ConsumerWidget {
  const ContactItem({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: RoundedSquarePicture(
        size: 32,
        borderRadius: 4,
        url: conversation.participants[0].profilePicture,
      ),
      title: InkWell(
        onTap: () {
          ref
              .watch(conversationProvider.notifier)
              .fetchConversation(conversation.id);
          GoRouter.of(context).go(
            '/contacts/conversation/${conversation.id}',
          );
        },
        child: Text(
          conversation.participants[0].name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ButterflyColors.quaternary,
          ),
        ),
      ),
      subtitle: Text(
        conversation.messages[0].text,
        style: const TextStyle(
          fontSize: 12,
          color: ButterflyColors.quaternary,
          fontStyle: FontStyle.italic,
        ),
      ),
      trailing: Text(
        conversation.messages[0].date.toHourString(),
        style: const TextStyle(
          fontSize: 10,
          color: ButterflyColors.quaternary,
        ),
      ),
    );
  }
}

class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  const PersistentHeaderDelegate();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return const Header();
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.text,
    this.badgeCount = 0,
  });

  final String text;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white.withAlpha(50),
          ),
          Center(
            child: Text(
              text,
              style: const TextStyle(
                color: ButterflyColors.quaternary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (badgeCount > 0)
            Positioned(
              right: 32,
              top: 8,
              child: Badge(
                text: badgeCount.toString(),
              ),
            ),
        ],
      ),
    );
  }
}

class Badge extends StatelessWidget {
  const Badge({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: ButterflyColors.senary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ButterflyColors.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: ListTile(
        leading: const RoundedSquarePicture(
          borderRadius: 4,
          url: 'https://picsum.photos/300/300',
          size: 64,
        ),
        title: Row(
          children: [
            const Text(
              'User Name\n(Online)',
              style: TextStyle(
                color: ButterflyColors.quaternary,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
              color: ButterflyColors.quinary,
              iconSize: 32,
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
              color: ButterflyColors.quinary,
              iconSize: 32,
            ),
          ],
        ),
        subtitle: const TextField(
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            hintText: 'Share a message or linke with your contacts',
            hintStyle: TextStyle(
              color: ButterflyColors.tertiary,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(24.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension DateTimeX on DateTime {
  String toHourString() {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
