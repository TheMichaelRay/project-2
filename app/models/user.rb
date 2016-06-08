class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials},
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => "xxx", :access_key_id => "xxx", :secret_access_key => "xxx"}
  end


  has_many :posts
  has_many :comments


end
