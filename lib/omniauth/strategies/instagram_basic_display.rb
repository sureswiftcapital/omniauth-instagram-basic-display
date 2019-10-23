require "omniauth/strategies/oauth2"
require "openssl"
require "rack/utils"
require "uri"

module OmniAuth
  module Strategies
    class InstagramBasicDisplay < OmniAuth::Strategies::OAuth2
      class NoAuthorizationCodeError < StandardError; end

      DEFAULT_SCOPE = "user_profile".freeze

      option :client_options,
               site: "https://api.instagram.com",
               authorize_url: "https://api.instagram.com/oauth/authorize?response_type=code",
               token_url: "oauth/access_token"

      option :access_token_options,
             header_format: "OAuth %s", param_name: "code"

      option :authorize_options, %i[scope response_type]

      uid { raw_info["id"] }

      def raw_info
        @raw_info ||= access_token.get("me").parsed
      end
    end
  end
end
