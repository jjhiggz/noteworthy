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
alias Noteworthy.Accounts.User
alias Noteworthy.Accounts.UserToken

Repo.delete_all(Note)
Repo.delete_all(User)
Repo.delete_all(UserToken)

{:ok, admin_user} =
  Noteworthy.Accounts.register_user(%{
    email: "admin@admin.com",
    password: "passwordpassword",
    role: "admin"
  })
  |> IO.inspect()

{:ok, reg_user} =
  Noteworthy.Accounts.register_user(%{
    email: "user@user.com",
    password: "passwordpassword",
    role: "user"
  })
  |> IO.inspect()

{:ok, reg_user2} =
  Noteworthy.Accounts.register_user(%{
    email: "user2@user.com",
    password: "passwordpassword",
    role: "user"
  })
  |> IO.inspect()

Repo.insert!(%Note{
  title: "User 1: A Love Story",
  content: "# Intro \n twas' a cold winter night when I first met the lovely lady",
  done: false,
  user_id: reg_user.id
})

Repo.insert!(%Note{
  title: "User 2 Note",
  content: "# Diary of a Second Class User \n - I am sad \n - I am happy \n - I am the walrus",
  done: false,
  user_id: reg_user2.id
})

Repo.insert!(%Note{
  title: "User 1: A Hate Story",
  content: "# Intro \n twas' a dark winter night when I first met the evil gent",
  done: false,
  user_id: reg_user.id
})

Repo.insert!(%Note{
  title: "A Note from an Admin",
  content: "# The laments of my day \n Being an admin is tough, nobody understandst",
  done: false,
  user_id: admin_user.id
})

# Repo.insert!(%Note{
#   title: "Cool Note 3",
#   content: "# This is also also a Cool Note",
#   done: false,
#   user_id: reg_user.id
# })
