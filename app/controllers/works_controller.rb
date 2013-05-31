class WorksController < ApplicationController
	def index
    unless current_user
      redirect_to root_path
    else
		  #@tl = home_timeline_from_twitter
    end
	end

	private

  def twitter_client
    Twitter.configure do |config|
      config.consumer_key       = ENV['TWITTER_KEY']
      config.consumer_secret    = ENV['TWITTER_SECRET']
      config.oauth_token        = current_user.token
      config.oauth_token_secret = current_user.secret
    end
  end

  def home_timeline_from_twitter
    twitter_client.home_timeline(count: 20, include_rts: 'ture').map{|tl|
      {
        :id => tl.user.id,
        :name => tl.user.name,
        :screen_name => tl.user.screen_name,
        :profile_url => tl.user.profile_image_url,
        #:background_url => tl.user.profile_background_image_url,
        :text => tl.text
      }
    }
  end
end
