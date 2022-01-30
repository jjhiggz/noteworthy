# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Noteworthy.Repo.insert!(%Noteworthy.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Noteworthy.Repo
alias Noteworthy.Notes.Note

Repo.delete_all(Note)
# Noteworthy.Notes.li

Repo.insert!(%Note{
  title: "Cool Note 1",
  content: "# This is a Cool Note",
  done: false
})

Repo.insert!(%Note{
  title: "Cool Note 2",
  content: "# This is also a Cool Note",
  done: false
})

Repo.insert!(%Note{
  title: "Cool Note 3",
  content: "# This is also also a Cool Note",
  done: false
})
