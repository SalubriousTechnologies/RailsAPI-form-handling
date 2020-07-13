class SectionSerializer < ActiveModel::Serializer
  attributes :id, :section, :section_title, :visibility, :status
end
