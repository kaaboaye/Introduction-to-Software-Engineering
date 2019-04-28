defmodule Teamify.TeamMembersTest do
  use Teamify.DataCase

  alias Teamify.TeamMembers

  describe "team_members" do
    alias Teamify.TeamMembers.TeamMember

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def team_member_fixture(attrs \\ %{}) do
      {:ok, team_member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TeamMembers.create_team_member()

      team_member
    end

    test "list_team_members/0 returns all team_members" do
      team_member = team_member_fixture()
      assert TeamMembers.list_team_members() == [team_member]
    end

    test "get_team_member!/1 returns the team_member with given id" do
      team_member = team_member_fixture()
      assert TeamMembers.get_team_member!(team_member.id) == team_member
    end

    test "create_team_member/1 with valid data creates a team_member" do
      assert {:ok, %TeamMember{} = team_member} = TeamMembers.create_team_member(@valid_attrs)
    end

    test "create_team_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TeamMembers.create_team_member(@invalid_attrs)
    end

    test "update_team_member/2 with valid data updates the team_member" do
      team_member = team_member_fixture()
      assert {:ok, %TeamMember{} = team_member} = TeamMembers.update_team_member(team_member, @update_attrs)
    end

    test "update_team_member/2 with invalid data returns error changeset" do
      team_member = team_member_fixture()
      assert {:error, %Ecto.Changeset{}} = TeamMembers.update_team_member(team_member, @invalid_attrs)
      assert team_member == TeamMembers.get_team_member!(team_member.id)
    end

    test "delete_team_member/1 deletes the team_member" do
      team_member = team_member_fixture()
      assert {:ok, %TeamMember{}} = TeamMembers.delete_team_member(team_member)
      assert_raise Ecto.NoResultsError, fn -> TeamMembers.get_team_member!(team_member.id) end
    end

    test "change_team_member/1 returns a team_member changeset" do
      team_member = team_member_fixture()
      assert %Ecto.Changeset{} = TeamMembers.change_team_member(team_member)
    end
  end
end
