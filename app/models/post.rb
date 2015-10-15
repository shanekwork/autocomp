class Post < ActiveRecord::Base
attr_accessor :post_subject

	def self.search(search)
		if search.present?
			rank = <<-RANK
				ts_rank(to_tsvector(keyword), plainto_tsquery(#{sanitize(search)})) + 
				ts_rank(to_tsvector(subject), plainto_tsquery(#{sanitize(search)})) +
				
			RANK
			#rank above ranks items on relevence
			#where("name @@ ? OR subject @@ ? OR title @@ ?", search, search, search).order("#{rank} desc")
			# to query words not directly beside each other in query up above only for pg
			where("keyword ILIKE ? OR subject ILIKE ?", "%#{search}%", "%#{search}%")
		else
			all
		end
	end

end
