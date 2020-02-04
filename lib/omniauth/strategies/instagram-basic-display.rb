require "omniauth/strategies/oauth2"
require "openssl"
require "rack/utils"
require "uri"

module OmniAuth
  module Strategies
    class InstagramBasicDisplay < OmniAuth::Strategies::OAuth2
      class NoAuthorizationCodeError < StandardError; end

      DEFAULT_SCOPE = "user_profile".freeze

      option :name, "instagram_basic_display"

      option :client_options,
             site: "https://graph.instagram.com",
             authorize_url: "https://api.instagram.com/oauth/authorize",
             token_url: "https://api.instagram.com/oauth/access_token"

      uid { raw_info["id"] }

      info { raw_info }

      def request_phase
        options[:scope] ||= DEFAULT_SCOPE
        super
      end

      def raw_info
        fields = "id,username,account_type"
        @raw_info ||= access_token.get("me?fields=#{fields}").parsed
      end
    end
  end
end
