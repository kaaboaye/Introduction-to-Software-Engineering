defmodule TeamifyWeb.PersonView do
  use TeamifyWeb, :view
  alias TeamifyWeb.PersonView

  def render("index.json", %{people: people}) do
    %{data: render_many(people, PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      full_name: person.full_name}
  end
end
