defmodule MangoWeb.HomepageTest do
  use MangoWeb.ConnCase
  use Hound.Helpers #导入hound helper

  hound_session()  #启动hound worker

  test "present of featured products" do
    navigate_to("/")
    assert page_source() =~ "Seasonal products"
  end
end
