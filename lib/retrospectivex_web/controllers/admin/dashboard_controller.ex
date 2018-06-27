defmodule RetrospectivexWeb.Admin.DashboardController do
  use RetrospectivexWeb, :controller

  alias Retrospectivex.Accounts.Schemas.Administrator
  alias Retrospectivex.Contents.Page
  alias Retrospectivex.Repo

  def index(conn, _params) do
    with administrators <- Repo.aggregate(Administrator, :count, :id),
         pages <- Repo.aggregate(Page, :count, :id) do
      render(conn, "index.html", administrators: administrators, pages: pages)
    end
  end
end