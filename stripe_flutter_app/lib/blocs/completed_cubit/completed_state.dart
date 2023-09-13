// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'completed_cubit.dart';

class CompletedState {
  final bool isCompleted;

  const CompletedState({
    required this.isCompleted,
  });

  CompletedState copyWith({
    bool? isCompleted,
  }) {
    return CompletedState(
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  bool operator ==(covariant CompletedState other) {
    if (identical(this, other)) return true;

    return other.isCompleted == isCompleted;
  }

  @override
  int get hashCode => isCompleted.hashCode;

  @override
  String toString() => 'CompletedState(isCompleted: $isCompleted)';
}
