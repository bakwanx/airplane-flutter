part of 'destination_cubit.dart';

@immutable
abstract class DestinationState {}

class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState{}

class DestinationSuccess extends DestinationState{
  final List<DestinationModel> destintionModels;

  DestinationSuccess(this.destintionModels);

  @override
  // TODO: implement props
  List<Object?> get props => [destintionModels];
}

class DestinationFailed extends DestinationState{

  final String error;

  DestinationFailed(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];

}
