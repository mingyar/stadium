defmodule StadiumWeb.FallbackController do
  use StadiumWeb, :controller

  alias StadiumWeb.ErrorView

  def call(conn, nil) do
    conn
    |> put_status(:not_found)
    |> render(ErrorView, "404.json", message: "The resource couldn't be found!")
  end
end
