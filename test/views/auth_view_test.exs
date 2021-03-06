defmodule Constable.AuthViewTest do
  use Constable.ViewCase, async: true
  alias Constable.AuthView
  alias Constable.Api.UserView

  test "show.json returns correct fields" do
    user = insert(:user)

    rendered_user = render_one(user, AuthView, "show.json", as: :user)
    user_view_json = render_one(user, UserView, "show.json")
    user_with_token = user_view_json |> put_in([:user, :token], user.token)

    assert rendered_user == user_with_token
  end
end
