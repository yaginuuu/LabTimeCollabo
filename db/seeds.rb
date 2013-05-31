#coding:utf-8

Lab = %w(猪俣研 CA研 澤本研 村田研 高田1研 高田2研 菅原1研 菅原2研 佐々木研 渡邊研 阿部研 伊藤研 柴田研 村山研 CG研 布川研 石亀研 藤田研 小方研)
Lab.each{ |n| Laboratory.create(:name => n)}

puts "Lab push complete!!"

