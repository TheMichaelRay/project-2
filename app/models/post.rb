class Post < ActiveRecord::Base
  has_attached_file :image,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials},
                    url: ":s3_domain_url",
                    path: "/:class/:attachment/:id_partition/:style/:filename",
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => ENV["S3_SHOUTOUT_BUCKET"], :access_key_id => ENV["S3_ACCESS_KEY_ID"], :secret_access_key => ENV["S3_SECRET_KEY_ID"]}
  end


  belongs_to :user
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
end
