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

{:ok, reg_user} =
  Noteworthy.Accounts.register_user(%{
    email: "user@user.com",
    password: "passwordpassword",
    role: "fuck"
  })

Repo.insert!(%Note{
  title: "Cool Note 1",
  content: "# This is a Cool Note",
  done: false,
  user_id: reg_user.id
})

# Repo.insert!(%Note{
#   title: "Cool Note 2",
#   content: "# This is also a Cool Note",
#   done: false,
#   user_id: reg_user.id
# })

# Repo.insert!(%Note{
#   title: "Cool Note 3",
#   content: "# This is also also a Cool Note",
#   done: false,
#   user_id: reg_user.id
# })
