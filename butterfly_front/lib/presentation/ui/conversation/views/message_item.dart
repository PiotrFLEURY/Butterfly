import 'package:butterfly_front/domain/entities/message.dart';
import 'package:butterfly_front/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:look/look.dart';
import 'package:butterfly_front/presentation/ui/contacts/contacts.dart';

@Look('lookBuilder')
class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.isMe,
    required this.message,
  });

  final bool isMe;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            return Row(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                if (isMe) SizedBox(width: maxWidth * 0.2),
                Flexible(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isMe
                          ? ButterflyColors.quinary
                          : ButterflyColors.secondary,
                      borderRadius: BorderRadius.only(
                        topLeft: isMe ? const Radius.circular(10) : Radius.zero,
                        topRight:
                            !isMe ? const Radius.circular(10) : Radius.zero,
                        bottomLeft: const Radius.circular(10),
                        bottomRight: const Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 4,
                          child: Text(
                            message.text,
                            style: TextStyle(
                              color:
                                  isMe ? Colors.white : ButterflyColors.quinary,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 10,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          message.date.toHourString(),
                          style: const TextStyle(
                            color: ButterflyColors.tertiary,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                if (!isMe) SizedBox(width: maxWidth * 0.2),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget lookBuilder() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        MessageItem(
          isMe: true,
          message: Message(
            text: 'Hello man how are you ?',
            date: DateTime(2021, 1, 1, 12, 0),
            senderId: '1',
          ),
        ),
        MessageItem(
          isMe: false,
          message: Message(
            text: 'Fine and you ?',
            date: DateTime(2021, 1, 1, 12, 0),
            senderId: '1',
          ),
        ),
        // long message from me
        MessageItem(
          isMe: true,
          message: Message(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl eget nisl. Donec auctor, nisl eget ultricies tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl eget nisl.',
            date: DateTime(2021, 1, 1, 12, 0),
            senderId: '1',
          ),
        ),
        MessageItem(
          isMe: false,
          message: Message(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl eget nisl. Donec auctor, nisl eget ultricies tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl eget nisl.',
            date: DateTime(2021, 1, 1, 12, 0),
            senderId: '1',
          ),
        ),
      ],
    ),
  );
}
