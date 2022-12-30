defmodule FlamingBirdFlockWeb.RustLive do
  use FlamingBirdFlockWeb, :live_view

  def render(assigns) do
    ~H"""
    <.center>
      <h1>Rust Live</h1>

      <p><%= @count %></p>

      <button phx-click="do_count">Count</button>

      <iframe id="rustframe" scrolling="no" src={Routes.static_path(@socket, "/assets/index.html")}>
      </iframe>
    </.center>
    """
  end

  def mount(_params, _session, socket) do
    socket
    |> assign(count: 0)
    |> ok()
  end

  def handle_event("do_count", _value, socket) do
    send_stuff_on_channel()

    socket
    |> assign(count: socket.assigns.count + 1)
    |> noreply()
  end

  def send_stuff_on_channel() do
    FlamingBirdFlockWeb.Endpoint.broadcast!("test:lobby", "shout", %{field1: [1, 5, 6, 1]})
  end

  defp ok(socket), do: {:ok, socket}
  defp noreply(socket), do: {:noreply, socket}
end
