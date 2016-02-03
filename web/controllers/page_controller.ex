defmodule Tuxedo.PageController do
  use Tuxedo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
