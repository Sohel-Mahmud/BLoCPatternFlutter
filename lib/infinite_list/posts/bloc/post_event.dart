/*
 * File: post_event.dart
 * Project: bloc
 * File Created: Friday, 12th May 2023 9:51:48 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Friday, 12th May 2023 9:51:48 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable{

  @override
  List<Object> get props => [];
}

class PostFetched extends PostEvent{}