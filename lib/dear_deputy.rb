# This program scraps the list of all French deputies & places their names and emais into a Hash.
require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_names

  names = []
  page = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

  depute_page = Nokogiri::HTML(open(page))

  return names = depute_page.xpath("//*[contains(@id, 'deputes-list')]/div/ul/li/a/text()").map {|x| x.to_s }
end


def get_links

  deputes_name_array = []
  page = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

  depute_page = Nokogiri::HTML(open(page))

  return names = depute_page.xpath("//*[contains(@id, 'deputes-list')]/div/ul/li/a/@href").map {|x| x.to_s }
end


def get_emails (deputes_names)

  deputes_email_array = []

  # Don't go over 50 or it gets really slow
  for n in 0...30

    page = "http://www2.assemblee-nationale.fr/#{deputes_names[n]}"

  
    depute_page = Nokogiri::HTML(open(page))

    # Catching for error!
    begin
      deputes_email_array << depute_page.xpath("//*[contains(@class, 'deputes-liste-attributs')]/dd[4]/ul/li[2]/a/text()").to_s
    rescue => e

        deputes_email_array << " "
      end
  end

  return deputes_email_array
end

puts email_ville_result = Hash[get_names.zip(get_emails(get_links))]