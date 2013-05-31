class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # httpsリダイレクト
  before_filter :ssl_redirect unless Rails.env.development?

  # 未ログインリダイレクト
  before_filter :authorize

  # セッション有効期限延長
  before_filter :reset_session_expires

  private

  #--------------#
  # ssl_redirect #
  #--------------#
  # httpsへリダイレクト(Production環境のみ)
  def ssl_redirect
    if Rails.env.production? and request.env["HTTP_X_FORWARDED_PROTO"].to_s != "https"
      request.env["HTTP_X_FORWARDED_PROTO"] = "https"

      redirect_to request.url and return
    end
  end

  #-----------#
  # authorize #
  #-----------#
  # ログイン認証
  def authorize
    # セッション、トップコントローラ以外で
    if params[:controller] != "sessions" and params[:controller] != "top"
      # 未ログインであればルートヘリダイレクト
      if session[:user_id].blank?
        redirect_to :root and return
      end
    end

    # トップコントローラで
    if params[:controller] == "top"
      # ログイン済みであればhomeへリダイレクト
      unless session[:user_id].blank?
        redirect_to controller: "home" and return
      end
    end
  end

  #-----------------------#
  # reset_session_expires #
  #-----------------------#
  # セッション期限延長
  def reset_session_expires
    request.session_options[:expire_after] = 2.weeks
  end

  #--------------#
  # current_user #
  #--------------#
  def current_user
    @current_user ||= User.where( id: session[:user_id] ).first
  end

  helper_method :current_user
end
