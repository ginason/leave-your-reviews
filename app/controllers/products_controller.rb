# require 'active_support/core_ext/hash'
# require 'time'
# require 'uri'
# require 'openssl'
# require 'base64'

class ProductsController < ApplicationController

  ENDPOINT = "webservices.amazon.com"
  REQUEST_URI = "/onca/xml"


  def index

    @products = Product.all

    params = {
      "Service" => "AWSECommerceService",
      "Operation" => "ItemSearch",
      "AWSAccessKeyId" => ACCESS_KEY_ID,
      "AssociateTag" => "leavyourrevie-20",
      "SearchIndex" => "All",
      "Keywords" => "laptop computer macbook",
      "ResponseGroup" => "Images,ItemAttributes,Offers"
    }

    # Set current timestamp if not set
    params["Timestamp"] = Time.now.gmtime.iso8601 if !params.key?("Timestamp")

    # Generate the canonical query
    canonical_query_string = params.sort.collect do |key, value|
      [URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")), URI.escape(value.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))].join('=')
    end.join('&')

    # Generate the string to be signed
    string_to_sign = "GET\n#{ENDPOINT}\n#{REQUEST_URI}\n#{canonical_query_string}"

    # Generate the signature required by the Product Advertising API
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), SECRET_KEY, string_to_sign)).strip()

    # Generate the signed URL
    request_url = "http://#{ENDPOINT}#{REQUEST_URI}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"

    puts "Signed URL: \"#{request_url}\""

    response = HTTParty.get(request_url)

    # item_array=[]
    @item_hash = response["ItemSearchResponse"]["Items"]["Item"]
    # for i in 0..5
    #   item_array.push(item_hash[i])
    # end

    # puts item_array.inspect, item_array.size
    @amazon_array = []
    @amazon_hash = {}
    @item_hash.map do |item|
      # new_hash["ASIN"]=item["ASIN"]
      puts item["LargeImage"].to_h["URL"]
      @amazon_hash["img_url"] = item["LargeImage"].to_h["URL"]
      puts item["ItemAttributes"]["Brand"]
      @amazon_hash["brand"] = item["ItemAttributes"]["Brand"]
      puts item["ItemAttributes"]["Title"]
      @amazon_hash["description"]=item["ItemAttributes"]["Title"]
      puts item["OfferSummary"]["LowestNewPrice"].to_h["FormattedPrice"]
      @amazon_hash["price"]=item["OfferSummary"]["LowestNewPrice"].to_h["FormattedPrice"]
      puts item["DetailPageURL"]
      @amazon_hash["url"]=item["DetailPageURL"]
      puts item["ASIN"]
      @amazon_hash["id"]=item["ASIN"]
      @amazon_array.push(@amazon_hash)
      @amazon_hash = {}
      puts "======================="

    end
    puts @amazon_array.inspect

    # img_hash = response["ItemSearchResponse"]["Items"]["Item"]["SmallImage"]


    # item_hash.map do |item|
      # new_hash["ASIN"]=item["ASIN"]
      # puts item_hash["LargeImage"]["URL"]
      # puts item_hash["ItemAttributes"]["Brand"]
      # puts item_hash["ItemAttributes"]["Title"]
      # puts item_hash["OfferSummary"]["LowestNewPrice"]["FormattedPrice"]
      # puts item_hash["DetailPageURL"]
      # puts item_hash["ASIN"]
      # puts "======================="

    # end

    # img_hash.map do |img|
    #   puts img["URL"]
    # end

    puts "?????"
    puts "?????"
    # puts response["ItemSearchResponse"]["Items"]["Item"]["Item"]["SmallImage"]["URL"]
  end

  def show
    @product = Product.find(params[:id])
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)

    flash[:note] = "Your have successfully created a product."
    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    @product.assign_attributes(product_params)

    if @product.save
      redirect_to product_path
    else
      render :edit
    end
  end
  def destroey

  end

  private

  def product_params
    params.require(:product).permit(:name, :url, :description, :price)
  end
end
