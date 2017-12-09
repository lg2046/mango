defmodule Mango.Catalog.Product do
  use Ecto.Schema

  # schema主要做两件事情：
  # 创建了%Product{} struct, 即为domain
  # 负责从products查询出来的记录与%Product的映射

  schema "products" do
    field :name, :string
    field :price, :decimal
    field :sku, :string
    field :is_seasonal, :boolean, default: false
    field :image, :string
    field :pack_size, :string
    field :category, :string

    timestamps(type: :utc_datetime)
  end
end