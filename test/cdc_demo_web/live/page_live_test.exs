defmodule CdcDemoWeb.PageLiveTest do
  use CdcDemoWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Get Started"
    refute render(page_live) =~ "Get Started"
  end

  test "render todos", %{conn: conn} do
    {:ok, todo1} = CdcDemo.Todos.create_todo(%{todo: "first todo"})
    {:ok, todo2} = CdcDemo.Todos.create_todo(%{todo: "second todo"})

    {:ok, page_live, _} = live(conn, "/")

    render_content = render(page_live)

    assert render_content =~ todo1.todo
    assert render_content =~ todo2.todo
  end
end
