class BandRep < ActiveRecord::Base
  belongs_to :band

  has_secure_password
  validates :username, presence: true, uniqueness: true
end
