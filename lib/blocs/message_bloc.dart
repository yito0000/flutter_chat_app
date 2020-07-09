import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/blocs/message_event.dart';
import 'package:flutter_chat_app/blocs/message_state.dart';
import 'package:flutter_chat_app/resource/repository/message_repository.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {

  final MessageRepository _messageRepository = new MessageRepository();

  @override
  MessageState get initialState => MessageInitial();

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    yield* _mapMessageFetchToState();
  }

  Stream<MessageState> _mapMessageFetchToState() async* {
    await this._messageRepository.fetchAll();
  }

}