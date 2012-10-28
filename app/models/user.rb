class User < ActiveRecord::Base
  has_many :presurveys
  has_many :postsurveys
  has_many :food_journals
  belongs_to :school
  has_and_belongs_to_many :school_infos

  has_secure_password
  validate :name, :presence => true
  validate :email, :presence => true, :uniqueness => true
  validate :password, :presence => true, :on => :create, :length => {:minimum => 5}

end
