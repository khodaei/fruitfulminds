class User < ActiveRecord::Base
  belongs_to :profile

  has_many :presurveys
  has_many :postsurveys
  has_many :food_journals
  belongs_to :school
  has_and_belongs_to_many :school_infos

  delegate :label, :to => :profile, :prefix => true

  has_secure_password
  validate :name, :presence => true
  validate :email, :presence => true, :uniqueness => true
  validate :password, :presence => true, :on => :create, :length => {:minimum => 6}

  def admin?
    profile_label == Profile::ADMIN
  end

  def ambassador?
    profile_label == Profile::AMBASSADOR
  end

end
