defmodule MangoWeb.CartView do
  use MangoWeb, :view
  alias Mango.Sales.Order

  def cart_count(conn = %Plug.Conn{}) do
    conn.assigns.cart
    |> cart_count
  end

  def cart_count(%Order{} = cart) do
    cart.line_items
    |> Enum.reduce(
         0,
         fn (item, acc) ->
           acc + item.quantity
         end
       )
  end

  def render("add.json", %{cart: cart, cart_params: cart_params}) do
    %{"product_name" => name, "pack_size" => size, "quantity" => qty} = cart_params
    %{
      message: "Product added to cart - #{name}(#{size}) x #{qty} qty",
      cart_count: cart_count(cart)
    }
  end

end
