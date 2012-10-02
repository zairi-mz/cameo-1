pdf.bounding_box([15,700], :width => 500) do
	@i = 1
	@p = 0
	@q = 0
	for parts in @maintreport.parts
		pdf.font_size 14
		pdf.text "#{@i}. #{@maintreport.id} - #{parts.id} - #{parts.name} - #{parts.quantity}"
		@m = @maintreport.id
		@p = parts.id
		if parts.quantity.nil? then
			@q = 0
		else
			@q = parts.quantity
		end
		@pwpart = Planworkpart.find(:all, :conditions => ["maintreport_id=? and part_id=?", @m, @p])
		pwpart = @pwpart [0]
		if pwpart.quantity.nil? then
			@pq = @q
			
			@pq = @q - pwpart.quantity
	  	end
		pdf.text "Balance = #{@pq}"
		@i = @i + 1
	end
end

pdf.bounding_box([15,600], :width => 500) do
	@i = 1
	@pwq = 0
	for planworkparts in @maintreport.planworkparts
		pdf.font_size 14
		if planworkparts.quantity.nil? then
			@pwq = 0
		else
			@pwq = planworkparts.quantity
		end
		pdf.text "#{@i}. #{@maintreport.id} - #{planworkparts.part_id} - #{@pwq}"
		@i = @i + 1
	end
end
