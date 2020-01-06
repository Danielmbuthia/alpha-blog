class Category < ApplicationRecord
    validates :name,
               uniqueness:{case_sensitive:false },
               presence: true,
               length: {minimum: 3,maximum: 25}
end
