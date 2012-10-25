pdf.repeat :all do
   # header
	pdf.bounding_box([0,735], :width => 550, :height => 40) do
  		pdf.stroke_bounds
	end
   pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width do
       	pdf.font "Helvetica"
		pdf.font_size 12
       	pdf.text "Action Group List", :align => :center, :style => :bold
   end

	pdf.bounding_box([0,700], :width => 735, :height => 20) do
		pdf.font_size 8
		pdf.table([["Short Name","Name","Quantity","Rate"]],
			:column_widths => {0 => 100, 1 => 350, 2 => 50, 3 => 50}, :row_colors => ["d5d5d5"])
	end
end

pdf.font_size 8

pdf.bounding_box([0,680], :width => 735, :height => 670) do
 	@grouplist.each do|u|
		pdf.table([["#{u.short_name}","#{u.name}","#{u.quantity}","#{u.rate}"]],
 			:column_widths => {0 => 100, 1 => 350, 2 => 50, 3 => 50}, :row_colors => ["ffffff"])
	end
end