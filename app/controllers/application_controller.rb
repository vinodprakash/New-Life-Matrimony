class ApplicationController < ActionController::API

    def index
        render json: { status: 'ok', name: 'New Life Matrimony API Platform' }, status: 200
    end

    def set_active_user
        token = request.headers['token']
        user_id = JwtToken.decode(token)
        render json: { error: 'Invalid User' }, status: 422 and return unless user_id.present?
            
        @user ||= User.find_by(user_id: user_id)
    rescue
        render json: { error: 'Invalid User' }, status: 422 and return
    end

    def current_user
        @user
    end 
end
