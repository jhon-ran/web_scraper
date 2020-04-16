# This program scraps all the cryiptocurrencies 
# and places them into a Hash containing acronym & price.

require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rubygems'

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all'))


@prices = []
page.css('td:nth-child(5)').each do |price|
  @prices << price.text
  end
#puts @prices

@acronym = []
page.css('td:nth-child(3)').each do |acro|
  @acronym << acro.text 
  end
#puts @acronym

hash = Hash[@acronym.zip(@prices)] 

puts hash
