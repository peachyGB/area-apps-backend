class InteractionSerializer < ActiveModel::Serializer
  attributes :id, :bookmark, :download, :error, :rating
  has_one :user
  has_one :business
end
