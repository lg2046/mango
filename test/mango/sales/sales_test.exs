defmodule Mango.SalesTest do
  use Mango.DataCase # 使用DataCase 可以在测试阶段帮助我们进行数据库连接

  alias Mango.Catalog.Product
  alias Mango.Repo

  alias Mango.Sales
  alias Mango.Sales.Order

  #  setup do
  #    alias Mango.Repo
  #    alias Mango.Catalog.Product
  #    Repo.insert %Product{name: "Carrot", pack_size: "1 kg", price: 55, sku: "A123", is_seasonal: true}
  #    Repo.insert %Product{name: "Apple", pack_size: "1 kg", price: 75, sku: "B232", is_seasonal: true}
  #    :ok
  #  end

  test "add_to_cart" do
    product = %Product{
                name: "Tomato",
                pack_size: "1 kg",
                price: 55,
                sku: "A123",
                is_seasonal: false,
                category: "vegetables"
              }
              |> Repo.insert!

    cart = Sales.create_cart()

    {:ok, cart} = Sales.add_to_cart(cart, %{"product_id" => product.id, "quantity" => "2"})

    assert [line_item] = cart.line_items
    assert line_item.product_id == product.id
    assert line_item.product_name == "Tomato"
    assert line_item.pack_size == "1 kg"
    assert line_item.quantity == 2
    assert line_item.unit_price == Decimal.new(product.price)
    assert line_item.total == Decimal.mult(Decimal.new(product.price), Decimal.new(2))

    IO.inspect(Repo.all(Order))
  end

  test "get_cart/1" do
    cart1 = Sales.create_cart()
    assert %Order{status: "In Cart"} = cart1

    cart2 = Sales.get_cart(cart1.id)
    assert cart1.id == cart2.id
  end

end