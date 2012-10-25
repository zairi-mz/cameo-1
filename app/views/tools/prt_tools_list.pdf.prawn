pdf.repeat :all do
   # header
	pdf.bounding_box([0,550], :width => 735, :height => 40) do
  		pdf.stroke_bounds
	end
   pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width do
       	pdf.font "Helvetica"
		pdf.font_size 12
       	pdf.text "Tools & Facilities List", :align => :center, :style => :bold
   end

	pdf.bounding_box([0,510], :width => 735, :height => 20) do
		pdf.font_size 8
		pdf.table([["Tools Code","Tools Name","Manufacturer Tool No","Supplier","Manufacturer"]],
			:column_widths => {0 => 80, 1 => 265, 2 => 190, 3 => 100, 4 => 100, 5 => 50}, :row_colors => ["d5d5d5"])
	end
end

pdf.font_size 8

pdf.bounding_box([0,490], :width => 735, :height => 500) do
 	@toollist.each do|u|
		if !u.supplier_id.nil?
			@s = Address.find(:first, :conditions => ['id=?', u.supplier_id])
			s_name = @s.company
		else
			s_name = " "
		end
		if !u.manufacturer_id.nil?
			@m = Address.find(:first, :conditions => ['id=?', u.manufacturer_id])
			m_name = @m.company
		else
			m_name = " "
		end
		pdf.table([["#{u.tool_code}","#{u.name}","#{u.tool_no}","#{s_name}","#{m_name}"]],
 			:column_widths => {0 => 80, 1 => 265, 2 => 190, 3 => 100, 4 => 100}, :row_colors => ["ffffff"])
	end
end