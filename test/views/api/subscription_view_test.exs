defmodule Constable.Api.SubscriptionViewTest do
  use Constable.ViewCase, async: true
  alias Constable.Api.SubscriptionView

  test "show.json returns correct fields" do
    subscription = insert(:subscription)

    rendered_subscription = render_one(subscription, SubscriptionView, "show.json")

    assert rendered_subscription == %{
      subscription: %{
        id: subscription.id,
        announcement_id: subscription.announcement_id,
        user_id: subscription.user_id,
      }
    }
  end
end
