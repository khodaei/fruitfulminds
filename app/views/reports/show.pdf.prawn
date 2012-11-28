pdf.text " "
pdf.text @main_title, :align => :center, :size => 18, :style => :bold
pdf.text " "
pdf.text " "
pdf.text @static_contents[:intro_title], :size => 14, :style => :bold
pdf.text " "
pdf.text @static_contents[:introduction]
pdf.text " "
pdf.text @school_intro_title, :size => 14, :style => :bold
pdf.text " "
pdf.text @school_intro
pdf.text " "
pdf.text @school_intro_second
pdf.text " "
pdf.text @school_intro_third
pdf.text " "
pdf.text @static_contents[:objectives_title], :size => 14, :style => :bold
pdf.text " "





pdf.table(@objectivesTable, :header => true)



pdf.text " "
pdf.text @static_contents[:eval_title], :size => 14, :style => :bold
pdf.text " "
pdf.text @eval_intro_first
pdf.text " "
pdf.text @eval_intro_second
pdf.text " "
pdf.text @eval_intro_third
pdf.text " "
pdf.text @strength_weakness_title, :size => 14, :style => :bold
pdf.text " "
pdf.text @static_contents[:strength_weakness_intro]
pdf.text " "
pdf.text @static_contents[:strength_intro], :size => 14, :style => :bold
pdf.text " "


@strengths.each do |key, strength|
  pdf.text "#{strength}"
end

pdf.text " "
pdf.text @static_contents[:weakness_intro], :size => 14, :style => :bold

@weaknesses.each do |key, weakness|
  pdf.text "#{weakness}"
end


pdf.text " "
pdf.text @static_contents[:summary]
pdf.text " "
pdf.text @ambassadorNoteTitle, :size => 14, :style => :bold
pdf.text " "
pdf.text @reportNote3

