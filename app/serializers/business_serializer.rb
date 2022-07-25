class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :link, :address, :category
end
