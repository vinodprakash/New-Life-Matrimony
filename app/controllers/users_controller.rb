class UsersController < ApplicationController
  before_action :set_active_user

  before_action :set_user_basic_info, only: [:update_basic_info, :fetch_basic_info]
  before_action :set_user_address, only: [:update_address, :fetch_user_address]
  before_action :set_user_horoscope, only: [:update_horoscope, :fetch_user_horoscope]
  before_action :set_user_occupation, only: [:update_occupation, :fetch_user_occupation]
  
  def update_basic_info
    @user_basic_info.update(basic_info_params)
    fetch_basic_info
  end

  def fetch_basic_info
    render json: @user_basic_info, serializer: UserBasicInfoSerializer, status: 200
  end

  def update_address
    @user_address.update(address_params)
    fetch_user_address
  end

  def fetch_user_address
    render json: @user_address, serializer: UserAddressSerializer, status: 200
  end

  def update_horoscope
    @user_horoscope.update(horoscope_params)
    fetch_user_horoscope
  end

  def fetch_user_horoscope
    render json: @user_horoscope, serializer: UserHoroscopeSerializer, status: 200
  end

  def update_occupation
    @user_occupation.update(occupation_params)
    fetch_user_occupation
  end

  def fetch_user_occupation
    render json: @user_occupation, serializer: UserOccupationSerializer, status: 200
  end

  private

  def set_user_basic_info
    @user_basic_info = UserBasicInfo.find_or_create_by(user_id: current_user.id)
  end

  def basic_info_params
    params.permit(:first_name, :last_name, :father_name, :mother_name, 
      :age, :gender, :religion, :caste, :sub_caste)
  end

  def set_user_address
    @user_address = UserAddress.find_or_create_by(user_id: current_user.id)
  end

  def address_params
    params.permit(:door_no, :address_line1, :address_line2, :city, :district, :state, :country, :pincode)
  end

  def set_user_horoscope
    @user_horoscope = UserHoroscope.find_or_create_by(user_id: current_user.id)
  end

  def horoscope_params
    params.permit(:dob, :time_of_birth, :place_of_birth, :zodiac, :star)
  end

  def set_user_occupation
    @user_occupation = UserOccupation.find_or_create_by(user_id: current_user.id)
  end

  def occupation_params
    params.permit(:occupied, :occupation_type, :company_name, :designation, :salary)
  end
end
