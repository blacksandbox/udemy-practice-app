class Chef < ActiveRecord::Base
  has_many :recipes
  
  before_save {self.email = self.email.downcase}
  
  validates :chefname, presence: true, length: {mininum: 3, maximum: 40}
  validates :email, presence: true, length: {maximum: 150},
                                    uniqueness: {case_sensitive: false}
end