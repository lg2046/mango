defmodule MangoWeb.SessionController do
  use MangoWeb, :controller

  alias Mango.CRM

  def new(conn, _params) do
    render conn, :new
  end

  def create(conn, %{"session" => session_params}) do
    case CRM.get_customer_by_credential(session_params) do
      :error ->
        conn
        |> put_flash(:error, "Invalid username/passwor")
        |> render :new
      customer ->
        conn
        #|> assign(:current_customer, customer)
        |> put_session(:customer_id, customer.id)
        |> configure_session(renew: true)
        |> put_flash(:info, "Login successful")
        |> redirect(to: page_path(conn, :index))
    end
  end

  def delete(conn, _) do
    clear_session(conn)
    |> put_flash(:info, "You have benn logged out")
    |> redirect(to: page_path(conn, :index))
  end
end