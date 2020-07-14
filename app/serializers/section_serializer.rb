class SectionSerializer
	include FastJsonapi::ObjectSerializer
  attributes :id, :section, :section_title, :visibility, :status
end
