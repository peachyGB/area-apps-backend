class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :busName, :appName, :link, :appImage, :address, :category
end
