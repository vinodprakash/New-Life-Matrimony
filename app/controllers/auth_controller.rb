class AuthController < ApplicationController

  before_action :find_user, only: %i[verity_email_otp login resend_email_otp]

  def sign_up
    user = User.create(sign_up_params)
    if user.persisted?
      render json: { 
        success: 'Sign up Successful. OTP sent to Email Address'
      }, status: 200
    else
      render json: { error: user.errors.full_messages.join(',') }, status: 422
    end
  end

  def verity_email_otp
    user_verification = @user.user_verification
    if otp_expired?(user_verification)
      render json: {error: 'OTP Expired'}, status: 422
    else
      if valid_otp?(user_verification)
        user_verification.update(verified: true)
        render json: {success: 'OTP Verification Successful'}, status: 200
      else
        render json: {error: 'Invalid OTP'}, status: 422
      end
    end
  end

  def resend_email_otp
    @user.create_user_verification if @user
    render json: { success: 'OTP sent to Email Address' }, status: 200
  end

  def login
    if @user && @user.email_verified?
      if @user.validate_password(login_params[:password])
        render json: {success: 'Success', token: generate_user_token(@user) }, status: 200
      else
        render json: {error: 'Invalid Password'}, status: 422
      end
    else
      render json: {error: 'Email Verification Pending'}, status: 422
    end
  end

  private

  def find_user
    @user = User.find_by(email: params[:email]) || User.find_by(user_id: params[:user_id])
  end

  def sign_up_params
    params.permit(:email, :mobile, :password)
  end

  def email_otp_params
    params.permit(:email, :otp)
  end

  def login_params
    params.permit(:email, :password)
  end

  def otp_expired?(user_verification)
    DateTime.now > user_verification.expiry_time
  end

  def valid_otp?(user_verification)
    user_verification.email_otp == email_otp_params[:otp]
  end

  def generate_user_token(user)
    JwtToken.encode({user_id: user.user_id})
  end

end
