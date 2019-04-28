defmodule TeamifyWeb.TeamView do
  use TeamifyWeb, :view
  alias TeamifyWeb.TeamView

  def render("index.json", %{teams: teams}) do
    %{data: render_many(teams, TeamView, "team.json")}
  end

  def render("show.json", %{team: team}) do
    %{data: render_one(team, TeamView, "team.json")}
  end

  def render("team.json", %{team: team}) do
    %{project_id: team.project_id, team_leader_id: team.team_leader_id}
  end
end
