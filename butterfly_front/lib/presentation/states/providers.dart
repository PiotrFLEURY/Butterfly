import 'package:butterfly_front/data/repositories/chat_repository_impl.dart';
import 'package:butterfly_front/domain/entities/entities.dart';
import 'package:butterfly_front/domain/repositories/chat_repository.dart';
import 'package:butterfly_front/domain/usecases/fetch_conversation.dart';
import 'package:butterfly_front/domain/usecases/send_message.dart';
import 'package:butterfly_front/presentation/states/conversation_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatRepositoryProvider =
    Provider<ChatRepository>((ref) => ChatRepositoryImpl());

final chatListProvider = Provider<List<ChatGroup>>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return repository.getChats();
});

final fetchConversationUseCaseProvider = Provider<FetchConversation>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return FetchConversation(repository);
});

final sendMessageUseCaseProvider = Provider<SendMessage>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return SendMessage(repository);
});

final conversationProvider =
    StateNotifierProvider<ConversationNotifier, Conversation?>((ref) {
  final fetchConversationUseCase = ref.watch(fetchConversationUseCaseProvider);
  final sendMessageUseCase = ref.watch(sendMessageUseCaseProvider);
  return ConversationNotifier(
    fetchConversationUseCase,
    sendMessageUseCase,
  );
});
