pdf.repeat :all do
   # header
	pdf.bounding_box([0,550], :width => 735, :height => 40) do
  		pdf.stroke_bounds
	end
   pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width do
       	pdf.font "Helvetica"
		pdf.font_size 12
       	pdf.text "Address List", :align => :center, :style => :bold
   end

	pdf.bounding_box([0,510], :width => 735, :height => 20) do
		pdf.font_size 8
		pdf.table([["Name","Address","Telephone No.","Fax No.","Email","Web Page"]],
			:column_widths => {0 => 145, 1 => 150, 2 => 100, 3 => 100, 4 => 120, 5 => 120}, :row_colors => ["d5d5d5"])
	end
end

pdf.font_size 8

pdf.bounding_box([0,490], :width => 735, :height => 500) do
 	@addlist.each do|u|
		pdf.table([["#{u.company}","#{u.address}","#{u.phone}","#{u.fax}","#{u.email}","#{u.web}"]],
 			:column_widths => {0 => 145, 1 => 150, 2 => 100, 3 => 100, 4 => 120, 5 => 120}, :row_colors => ["ffffff"])
	end
end