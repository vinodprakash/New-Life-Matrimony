class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    # Validation
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    
    # Association
    has_one :user_verification, dependent: :destroy
    has_one :user_basic_info, dependent: :destroy

    # Callback
    before_create :generate_user_id
    after_create :create_user_verification

    # Enum
    enum role: { admin: 1, customer: 2}

    def email_verified?
        user_verification.verified
    end

    def validate_password(password)
        valid_password?(password)
    end

    def generate_user_id
        loop do
            new_user_id =  "NLM-#{rand(10000..100000)}"
            unless User.exists?(new_user_id)
                self.user_id = new_user_id
                break
            end 
        end
    end

    def create_user_verification
        user_verification = UserVerification.find_or_create_by(user_id: id)
        user_verification.update(
            email_otp: generate_email_otp,
            expiry_time: otp_expiry_time,
            verified: false
        )
    end

    private

    def generate_email_otp
        '%06d' % rand(8 ** 6)
    end

    def otp_expiry_time
        DateTime.now + 15.minutes
    end
end
