module AutocompleteService
  class << self
    def search(search, entity_class, field)
      entity_class.where("#{field} LIKE ?", "#{search}%")
    end
  end
end
