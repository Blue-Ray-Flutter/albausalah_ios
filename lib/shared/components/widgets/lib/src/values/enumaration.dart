// Different types Message of ChatView
enum MessageType {
  image,
  text,
  voice,
  video,
  mixed,
  suggest,
  custom,
}

/// Types of states
enum ChatViewState { hasMessages, noData, loading, error }

extension ChatViewStateExtension on ChatViewState {
  bool get hasMessages => this == ChatViewState.hasMessages;

  bool get isLoading => this == ChatViewState.loading;

  bool get isError => this == ChatViewState.error;

  bool get noMessages => this == ChatViewState.noData;
}
