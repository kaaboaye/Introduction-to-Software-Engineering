defmodule Teamify.People.Person do
  use Ecto.Schema
  import Ecto.Changeset

  alias Teamify.TeamMembers.TeamMember

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "people" do
    field :full_name, :string
    has_many :members, TeamMember

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:full_name])
    |> validate_required([:full_name])
  end
end
