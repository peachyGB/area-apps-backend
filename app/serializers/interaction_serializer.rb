class InteractionSerializer < ActiveModel::Serializer
  attributes :id, :bookmark, :download, :error_report, :rating
  has_one :user
  has_one :business
end
