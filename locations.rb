load 'config/environment.rb'
Rails.application.eager_load!
# apis = ['AIzaSyDq00IrmPcH7_MH6DDTdyJ07oFT-xH8Xwo', 'AIzaSyDaGQnUF6MAV7fMa7R4zRu-nlMQWsGCFtE',  
#         'AIzaSyBRY9xz4uez74AomduySEPtnLfgxhe0alo', 'AIzaSyB_Kp8AXEW6JLFfaaMi5dTrjjB6eJ0To9c', 
#         'AIzaSyCsprHSHVxYBN18Cyp1WNCUm1E_5WHEhog', 'AIzaSyBDkpd5jd4rGJPXjKzDgCe1uBRg2jsQpZc',
#         'AIzaSyDzpaRkSx83cFOb_gYP2JEhTb3XLd6OB8Y', 'AIzaSyDTF9sWy1Dx41aAiKWUCZ91l6jvF0q5eAU']
# i = 6
# @client = GooglePlaces::Client.new(apis.at(i))
# Location.all.each do |location|
#     spots = @client.spots_by_query("Bunge near #{location.city}, #{location.country} #{location.zip_code}", detail: true)
#     spot = spots.first
#     unless spot.nil?
#         location.latitude = spot.lat
#         location.longitude = spot.lng
#         location.formatted_address = spot.formatted_address
#         location.formatted_phone_number = spot.formatted_phone_number
#         location.save
#         puts "#{location.address} changed to #{location.formatted_address}"
#     end
# end

# Location.all.each do |location|
#     if location.formatted_address.length > 1
#         location.postal_code  = geo.postal_code 
#         geo = Geocoder.search(location.location_name).first
#         unless geo.nil?
#             location.latitude = geo.latitude
#             location.longitude = geo.longitude
#             location.address = geo.address
#             location.city = geo.city
#             location.state = geo.state
#             location.state_code = geo.state_code
#             location.postal_code  = geo.postal_code 
#             location.country = geo.country
#             location.country_code = geo.country_code
#             location.save
#             puts "#{location.address} changed to #{location.formatted_address}"
#         end 
# end 

# Location.where(formatted_address: "").each do |location|
#     geo = Geocoder.search(location.location_name).first
#     unless geo.nil?
#         location.latitude = geo.latitude
#         location.longitude = geo.longitude
#         location.address = geo.address
#         location.city = geo.city
#         location.state = geo.state
#         location.state_code = geo.state_code
#         location.postal_code  = geo.postal_code 
#         location.country = geo.country
#         location.country_code = geo.country_code
#         location.formatted_address = location.address 
# 		location.save
#         puts "#{location.location_name} changed to #{location.formatted_address}"
#     end 
# end

Location.all.each do |location|
	unless location.longitude.nil?
		location.address = location.formatted_address
		location.save 
	end
end

    
