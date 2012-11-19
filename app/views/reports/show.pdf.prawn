
pdf.text @main_title, :align => :center, :size => 18, :style => :bold, :spacing => 16
pdf.text " "
pdf.text @static_contents[:intro_title], :spacing => 16
pdf.text " "
pdf.text @static_contents[:introduction], :spacing => 16
pdf.text " "
pdf.text @school_intro_title, :spacing => 16
pdf.text " "
pdf.text @school_intro, :spacing => 16
pdf.text " "
pdf.text @school_intro_second, :spacing => 16
pdf.text " "
pdf.text @school_intro_third, :spacing => 16
pdf.text " "
pdf.text @static_contents[:objectives_title], :spacing => 16


pdf.text " "
pdf.text @static_contents[:eval_title]
pdf.text " "
pdf.text @eval_intro_first
pdf.text " "
pdf.text @eval_intro_second
pdf.text " "
pdf.text @eval_intro_third
pdf.text " "
pdf.text @strength_weakness_title
pdf.text " "
pdf.text @static_contents[:strength_weakness_intro]
pdf.text " "
pdf.text @static_contents[:strength_intro]


pdf.text " "
pdf.text @static_contents[:weakness_intro]

pdf.text " "
pdf.text @static_contents[:summary]
pdf.text " "
pdf.text @ambassadorNoteTitle

