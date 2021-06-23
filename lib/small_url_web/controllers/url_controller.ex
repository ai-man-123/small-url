defmodule SmallUrlWeb.UrlController do
  use SmallUrlWeb, :controller
  alias SmallUrl.Links

  @url %{}

  def new(conn, params) do
    id = Ksuid.generate() |> String.slice(4, 7)
    @url = Map.put_new(@url, id, params[:url])
    IO.inspect(@url)
    IO.inspect(id)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(201, id)
    |> halt()
  end

  def get(conn, %{"id" => id} = params) do
    url = Map.get(@url, id)
    IO.inspect(@url)

    case url do
      nil ->
        conn
        |> send_resp(404, "Not found")
        |> halt()

      id ->
        conn
        |> send_resp(200, id)
        |> halt()
    end
  end

  def forward(conn, %{"id" => id} = params) do
    shortlink = Links.get_short_links_by_key(id)

    case shortlink do
      nil ->
        conn
        |> send_resp(404, "Not found")
        |> halt()

      shortlink ->
        conn
        |> redirect(external: Map.get(shortlink, :url))
    end
  end
end
