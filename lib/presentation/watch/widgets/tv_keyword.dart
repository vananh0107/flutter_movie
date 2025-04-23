import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/bloc/generic_data_cubit.dart';
import 'package:movie/common/bloc/generic_data_state.dart';
import 'package:movie/core/entities/keyword.dart';
import 'package:movie/domain/tv/usercases/get_keyword.dart';
import 'package:movie/service_locator.dart';
class TvKeywords extends StatelessWidget {
  final int tvId;
  const TvKeywords({required this.tvId,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<KeywordEntity>>(sl<GetKeyworduUseCase>(), params: tvId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(
                  child: CircularProgressIndicator()
              );
            }
            if (state is DataLoaded) {
              List<KeywordEntity> keywords = state.data;
              return Wrap(
                children: keywords.map((item)=>Chip(label: Text(item.name!))).toList(),
              );
            }
            if (state is FailureLoadData) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Container();
          }
      ),
    );
  }
}