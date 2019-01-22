class ApplicationController < ActionController::API

#  before_action :set_locale

  require 'net/https'
  require 'uri'
  require 'cgi'
  require 'json'
  require 'securerandom'

  def set_locale
    I18n.default_locale = params[:locale] || I18n.default_locale
  end



  def translate(original_text, locale)
    # **********************************************
    # *** Update or verify the following values. ***
    # **********************************************

    # Replace the key string value with your valid subscription key.
    key = '5c27571546514868bb053fadffcddfd1'

    host = 'https://api.cognitive.microsofttranslator.com'
    path = '/translate?api-version=3.0'

    # Translate to German and Italian.
    params = "&to=" + locale.to_s

    uri = URI (host + path + params)

    text = ActionController::Base.helpers.sanitize(original_text.to_s.gsub /"/, '|')
    puts "Original text "
    puts text
    content = '[{"Text" : "' + text + '"}]'

    request = Net::HTTP::Post.new(uri)
    request['Content-type'] = 'application/json'
    request['Content-length'] = content.length
    request['Ocp-Apim-Subscription-Key'] = key
    request['X-ClientTraceId'] = SecureRandom.uuid
    request.body = content



    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request (request)
    end

    result = response.body.force_encoding("utf-8")


    json = JSON.parse(result)
    puts json
    return json[0]["translations"][0]["text"]
  end
end
