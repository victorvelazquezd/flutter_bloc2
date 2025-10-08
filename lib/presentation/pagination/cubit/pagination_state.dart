part of 'pagination_cubit.dart';

enum PaginationStatus{
  initial,
  loading,
  loaded,
  error,
  complete,
  loadingMoreError
}

class PaginationState extends Equatable {
  /// {@macro pagination}
  const PaginationState({
    this.status = PaginationStatus.initial,
    this.pokeNames = const [],
  });

  final PaginationStatus status;
  final List<Result> pokeNames;

  @override
  List<Object> get props => [status, pokeNames];

  /// Creates a copy of the current PaginationState with property changes
  PaginationState copyWith({
    PaginationStatus? status,
    List<Result>? pokeNames,
  }) {
    return PaginationState(
      status: status ?? this.status,
      pokeNames: pokeNames ?? this.pokeNames,
    );
  }
}
// {@template pagination_initial}
/// The initial state of PaginationState
/// {@endtemplate}
class PaginationInitial extends PaginationState {
  /// {@macro pagination_initial}
  const PaginationInitial() : super();
}
