pdf.repeat :all do
   # header
	pdf.bounding_box([0,550], :width => 735, :height => 40) do
  		pdf.stroke_bounds
	end
   pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width do
       	pdf.font "Helvetica"
		pdf.font_size 12
       	pdf.text "Planned Work List", :align => :center, :style => :bold
   end

	pdf.bounding_box [pdf.bounds.left, 525], :width  => pdf.bounds.width do
       	pdf.font "Helvetica"
		pdf.font_size 10
       	pdf.text "#{$fdate} - #{$tdate}", :align => :center, :style => :bold
   	end

	pdf.bounding_box([0,510], :width => 735, :height => 20) do
		pdf.font_size 8
		pdf.table([["Equipment","Code","Job Description","Next Date"]],
			:column_widths => {0 => 250, 1 => 50, 2 => 375, 3 => 60}, :row_colors => ["d5d5d5"])
	end
end

pdf.font_size 8

pdf.bounding_box([0,490], :width => 735, :height => 500) do
 	$maintplan.each do|u|
 		pdf.table([["#{u.component.comp_code}  #{u.component.comp_name}","#{u.code}","#{u.description}","#{u.next_date}"]],
 			:column_widths => {0 => 250, 1 => 50, 2 => 375, 3 => 60 }, :row_colors => ["ffffff"])
	end
end