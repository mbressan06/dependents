class Dependent < ActiveRecord::Base
  validates :name, :kinship_type, presence: true

  # PaperClip
  has_attached_file   :image,:styles => {
                                        :large => "512x512" ,
                                        :medium => "200x200" ,
                                        :small => "168x168",
                                        :thumb => "40x40",
                                        :tiny => "32x32"
                                        },
                      :url  => "/images/dependents/:id-:basename.:style.:extension",
                      :path => ":rails_root/public/images/dependents/:id-:basename.:style.:extension",
                      :default_url => :set_default_url
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 10.megabytes

  def set_default_url
  "/img/missing.png"
  end

end
