class LinkPreview
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE


	def self.preview(url)
	  link_preview = Hash.new
	  doc = Nokogiri::HTML(open(url))
	  metas = doc.css("meta")
	  metas.each do |meta|
	  	unless meta["property"].nil?
	  		link_preview[meta["property"].split(':')[1].to_sym] = meta["content"] if meta["property"].include?('og')
	  	end
	  end
	  return link_preview
    end


OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_PEER
end
