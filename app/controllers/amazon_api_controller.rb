class AmazonApiController < ApplicationController


  def index

  end

# private

  # def search_by_keyword(keywords)
    # params = {
    #   "Service" => "AWSECommerceService",
    #   "Operation" => "ItemSearch",
    #   "AWSAccessKeyId" => ACCESS_KEY_ID,
    #   "AssociateTag" => "leavyourrevie-20",
    #   "SearchIndex" => "All",
    #   "Keywords" => keywords,
    #   "ResponseGroup" => "Images,ItemAttributes,Offers"
    # }
    # return params

  # end


  # def request_url(params)
  #   # Set current timestamp if not set
  #   params["Timestamp"] = Time.now.gmtime.iso8601 if !params.key?("Timestamp")
  #
  #   # Generate the canonical query
  #   canonical_query_string = params.sort.collect do |key, value|
  #     [URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")), URI.escape(value.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))].join('=')
  #   end.join('&')
  #
  #   # Generate the string to be signed
  #   string_to_sign = "GET\n#{ENDPOINT}\n#{REQUEST_URI}\n#{canonical_query_string}"
  #
  #   # Generate the signature required by the Product Advertising API
  #   signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), SECRET_KEY, string_to_sign)).strip()
  #
  #   # Generate the signed URL
  #   request_url = "http://#{ENDPOINT}#{REQUEST_URI}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"
  #
  #   puts "Signed URL: \"#{request_url}\""
  #
  #   response = HTTParty.get(request_url)
  #
  #
  #   @item_hash = response["ItemSearchResponse"]["Items"]["Item"]
  #
  #   return @item_hash
  #
  #   puts @item_hash
  #
  # end


end
