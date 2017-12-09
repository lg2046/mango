defmodule MangoWeb.Acceptance.Category_page_test do
  use ExUnit.Case
  use Hound.Heplers

  hound_session()

  setup do
    :ok
  end

  test "show fruits" do
    nevigate_to("categories/fruits")

    page_title = find_element(:css, ".page-title")
    |> visible_text()
    assert page_title == "Fruits"

  end

  test "show vegetables" do

  end

end