defmodule TeamifyWeb.TeamMemberController do
  use TeamifyWeb, :controller

  alias Teamify.TeamMembers
  alias Teamify.TeamMembers.TeamMember

  action_fallback TeamifyWeb.FallbackController

  def index(conn, _params) do
    team_members = TeamMembers.list_team_members()
    render(conn, "index.json", team_members: team_members)
  end

  def create(conn, %{"team_member" => team_member_params}) do
    with {:ok, %TeamMember{} = team_member} <- TeamMembers.create_team_member(team_member_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.team_member_path(conn, :show, team_member))
      |> render("show.json", team_member: team_member)
    end
  end

  def show(conn, %{"id" => id}) do
    team_member = TeamMembers.get_team_member!(id)
    render(conn, "show.json", team_member: team_member)
  end

  def update(conn, %{"id" => id, "team_member" => team_member_params}) do
    team_member = TeamMembers.get_team_member!(id)

    with {:ok, %TeamMember{} = team_member} <- TeamMembers.update_team_member(team_member, team_member_params) do
      render(conn, "show.json", team_member: team_member)
    end
  end

  def delete(conn, %{"id" => id}) do
    team_member = TeamMembers.get_team_member!(id)

    with {:ok, %TeamMember{}} <- TeamMembers.delete_team_member(team_member) do
      send_resp(conn, :no_content, "")
    end
  end
end
