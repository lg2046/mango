defmodule Mango.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :price, :decimal
      add :sku, :string
      add :is_seasonal, :boolean, default: false, null: false
      add :image, :string
      add :pack_size, :string
      add :category, :string

      timestamps(type: :timestamptz) # 增加inserted_at 与 updated_at
    end

    create unique_index(:products, [:sku]) #增加索引
  end
end
