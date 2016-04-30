defmodule BasketCart.BasketManager do

    def do_operation id, fun do
      name = {:global, {__MODULE__, id}}

      case Agent.start(fn () -> BasketCart.new end, name: name) do
        {:error, {:already_started, _pid}} -> :ok
        {:ok, _pid} -> :ok
      end

      Agent.get_and_update(name, fun, 5000)
    end

    def add_item basket_id, item do
        BasketCart.BasketManager.do_operation basket_id, fn basket ->
            {:ok, BasketCart.add(basket, item)}
        end
    end

    def remove_item basket_id, item do
        BasketCart.BasketManager.do_operation basket_id, fn basket ->
            {:ok, BasketCart.remove(basket, item)}
        end
    end

    def count basket_id do
        BasketCart.BasketManager.do_operation basket_id, fn basket ->
            {BasketCart.count(basket), basket}
        end
    end

    def contents basket_id do
        BasketCart.BasketManager.do_operation basket_id, fn basket ->
            {BasketCart.current_items(basket), basket}
        end
    end

end
