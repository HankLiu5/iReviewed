class Reviewer < ActiveRecord::Base
  has_secure_password # It's virtual attribute. Like there is a "password" column.
  has_many :books
end
