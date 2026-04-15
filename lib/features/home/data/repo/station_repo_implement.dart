import 'package:dio/dio.dart';
import 'package:enr_tickets/core/services/api/api_service.dart';
import 'package:enr_tickets/core/services/api/endpoints.dart';
import 'package:enr_tickets/features/home/data/model/station_model/station_model.dart';
import 'package:enr_tickets/features/home/data/repo/station_repo.dart';

class StationRepoImplement implements StationRepo {
  final ApiService apiService;

  StationRepoImplement(this.apiService);

  @override
  Future<List<StationModel>> getStations() async {
    try {
      final response = await apiService.get(
        endpoint: EndPoints.getStations,
      );

      final data = response.data as List;

      return data
          .map((json) => StationModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ?? "Something went wrong",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}