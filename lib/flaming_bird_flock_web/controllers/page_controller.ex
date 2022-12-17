defmodule FlamingBirdFlockWeb.PageController do
  use FlamingBirdFlockWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
