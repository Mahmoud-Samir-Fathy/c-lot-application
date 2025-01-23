import 'package:dartz/dartz.dart';

abstract class GetOrderRepository{
  Future<Either> getOnProcessingOrder(String onProcessing);
}