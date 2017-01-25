class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :async, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :dependents
  validates :name, :document, presence: true
  validates :document, uniqueness: true
  validate :document_input

  private

  def document_input
    return if document.blank?
    valid = CPF.valid?(document)
    return if valid

    errors[:document] << I18n.t('account.messages.invalid')
  end
end
