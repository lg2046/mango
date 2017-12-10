defmodule MangoWeb.RegistrationController do
  use MangoWeb, :controller
  alias Mango.CRM

  def new(conn, _) do
    changeset = CRM.build_customer()
    IO.inspect(changeset)
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"registration" => registration_params}) do
    case CRM.create_customer(registration_params) do
      {:ok, custom} ->
        conn
        |> put_flash(:info, "注册成功")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        IO.inspect(changeset)
        conn
        |> render(:new, changeset: changeset)
    end
  end
end