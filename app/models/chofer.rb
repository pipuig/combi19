class Chofer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #borre  :registerable, para que no se puedan registrar como choferes

  validates :nombre, presence:true
  validates :apellido, presence:true
  validates :dni, presence:true, uniqueness:true, length: {minimum: 8, maximum: 8}, numericality: true
  validates :telefono, presence:true, numericality: true

  has_many :viajes


  def custom_label_method
    "#{self.nombre}"
  end

end
