defmodule Joyvote.PageController do
  use Joyvote.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
