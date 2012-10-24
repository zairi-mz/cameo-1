pdf.repeat :all do
   # header
	pdf.bounding_box([0,550], :width => 735, :height => 40) do
  		pdf.stroke_bounds
	end
   pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width do
       	pdf.font "Helvetica"
		pdf.font_size 12
       	pdf.text "Equipment List", :align => :center, :style => :bold
   end

	pdf.bounding_box([0,510], :width => 735, :height => 20) do
		pdf.font_size 8
		pdf.table([["Eqpt No","Eqpt Name","Location","Type No","Serial No","Specfication"]],
			:column_widths => {0 => 80, 1 => 215, 2 => 80, 3 => 80, 4 => 80, 5 => 200}, :row_colors => ["d5d5d5"])
	end
end

pdf.font_size 8

pdf.bounding_box([0,490], :width => 735, :height => 500) do
 	@complist.each do|u|
		if !u.location_id.nil?
			@loc = Location.find(:first, :conditions => ['id=?', u.location_id])
			loc_name = @loc.name
		else
			loc_name = " "
		end
 		pdf.table([["#{u.comp_code}","#{u.comp_name}","#{loc_name}","#{u.type_no}","#{u.serial_no}","#{u.tech_description}"]],
 			:column_widths => {0 => 80, 1 => 215, 2 => 80, 3 => 80, 4 => 80, 5 => 200}, :row_colors => ["ffffff"])
	end
end