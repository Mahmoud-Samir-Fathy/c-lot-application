abstract class QuantityStates{}
class QuantityInitialState extends QuantityStates{}
class QuantityIncreaseState extends QuantityStates{
  final int quantity;

  QuantityIncreaseState({required this.quantity});
}
class QuantityDecreaseState extends QuantityStates{
  final int quantity;

  QuantityDecreaseState({required this.quantity});

}