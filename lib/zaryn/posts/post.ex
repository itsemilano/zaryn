defmodule Zaryn.Posts.Post do
  use Zaryn.Schema
  import Ecto.Changeset

  schema "posts" do
    field :description, :string
    field :photo_url, :string
    field :url_id, :string
    field :total_likes, :integer, default: 0
    field :total_comments, :integer, default: 0
    belongs_to :user, Zaryn.Accounts.User
    has_many :likes, Zaryn.Likes.Like, foreign_key: :liked_id
    has_many :comments, Zaryn.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:url_id, :description, :photo_url])
    |> validate_required([:url_id, :photo_url])
  end
end
