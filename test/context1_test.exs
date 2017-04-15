defmodule MultiRepos.Context1Test do
  use MultiRepos.DataCase

  alias MultiRepos.Context1
  alias MultiRepos.Context1.User

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:user, attrs \\ @create_attrs) do
    {:ok, user} = Context1.create_user(attrs)
    user
  end

  test "list_users/1 returns all users" do
    user = fixture(:user)
    assert Context1.list_users() == [user]
  end

  test "get_user! returns the user with given id" do
    user = fixture(:user)
    assert Context1.get_user!(user.id) == user
  end

  test "create_user/1 with valid data creates a user" do
    assert {:ok, %User{} = user} = Context1.create_user(@create_attrs)
    assert user.name == "some name"
  end

  test "create_user/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Context1.create_user(@invalid_attrs)
  end

  test "update_user/2 with valid data updates the user" do
    user = fixture(:user)
    assert {:ok, user} = Context1.update_user(user, @update_attrs)
    assert %User{} = user
    assert user.name == "some updated name"
  end

  test "update_user/2 with invalid data returns error changeset" do
    user = fixture(:user)
    assert {:error, %Ecto.Changeset{}} = Context1.update_user(user, @invalid_attrs)
    assert user == Context1.get_user!(user.id)
  end

  test "delete_user/1 deletes the user" do
    user = fixture(:user)
    assert {:ok, %User{}} = Context1.delete_user(user)
    assert_raise Ecto.NoResultsError, fn -> Context1.get_user!(user.id) end
  end

  test "change_user/1 returns a user changeset" do
    user = fixture(:user)
    assert %Ecto.Changeset{} = Context1.change_user(user)
  end
end
