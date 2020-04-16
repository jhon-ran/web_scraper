#This program scraps the names & emails from a town hall district in France. 
#It places them into a Hash.
require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_city

  city_names = []
  page = "https://www.annuaire-des-mairies.com/val-d-oise.html"

  region = Nokogiri::HTML(open(page))
  return city_names = region.xpath("//a[contains(@class, 'lientxt')]/text()").map {|x| x.to_s.downcase.gsub(" ", "-") }
end

def get_email (city_names)

  city_emails = []

  for n in 0...city_names.length

    page_url_ville = "https://www.annuaire-des-mairies.com/95/#{city_names[n]}.html"

    ville_page = Nokogiri::HTML(open(page_url_ville))

    # Exception for empty emails
    begin
      city_emails << ville_page.xpath("//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()").to_s
    rescue => e

      city_emails << " "
    end
  end

  return city_emails
end

puts Hash[get_city.zip(get_email(get_city))]