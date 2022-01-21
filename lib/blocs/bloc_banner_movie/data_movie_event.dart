import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BannerEvent extends Equatable {
  const BannerEvent();

  @override
  List<Object?> get props => [];
}

class RequestGetBanner extends BannerEvent {
  const RequestGetBanner();

  @override
  List<Object?> get props => [];
}
