class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :users_projects
  has_many :projects, through: :users_projects

  ROLES = %w[admin dev user banned]
  def admin?
    self.role == 'admin'
  end
  def project_admin?(project_id=nil)
    self.role == 'admin' || project_id && users_projects.exists?(project_id: project_id, role: 'admin')
  end
  def sunfixr?(project_id)
    #(self.role == 'admin') || users_project.where('project_id=?',project_id).first.role == ('sunfixr' || 'admin')
    users_projects.where("project_id = ? and (role in ('admin','sunfixr'))",project_id).exists?
  end

  attr_encrypted :authentication_token, :key => Rails.application.secrets.api_secret_key
  before_save :ensure_authentication_token

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def reset_authentication_token!
    self.authentication_token = generate_authentication_token
    self.save
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.find_by_authentication_token(token)
    end
  end

end
