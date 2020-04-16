require 'pry'
require 'dotenv'
require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))


#def get_townhall_email(page)

@emails = []
page.css("a.lientxt").each do |email|
  @emails << email
  end
puts @emails




#/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]

#Avernes
# /html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]

#http://www.annuaire-des-mairies.com/val-de-marne.html

#https://www.annuaire-des-mairies.com/95/avernes.html

#table.table:nth-child(1) > tbody:nth-child(3) > #tr:nth-child(4) > td:nth-child(2)



#def get_townhall_email(page)
  #email_array = []
  #return email_array = page.xpath("//*[contains(@id, 'deputes-list')]/div/ul/li/a/text()").map {|x| x.to_s }
#end


