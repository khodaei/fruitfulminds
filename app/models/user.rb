class User < ActiveRecord::Base
  belongs_to :profile
  belongs_to :school_semester

  has_many :presurvey1s
  has_many :presurvey2s
  has_many :postsurveys
  has_many :food_journals

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

  def school
    school_semester.school if school_semester
  end
end
