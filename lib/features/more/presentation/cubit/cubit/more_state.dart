part of 'more_cubit.dart';

abstract class MoreState {}

final class MoreInitial extends MoreState {}

final class FaqReadyState extends MoreState {
  FaqReadyState({required this.faqList});

  final List<FaqEntity> faqList;
}
 