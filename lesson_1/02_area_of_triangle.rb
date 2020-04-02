# Программа должна запрашивать основание и высоту треуголиника
# и возвращать его площадь

puts 'Введите длину основания треугольника'
triangle_base = gets.chomp.to_f
puts 'Введите высоту треугольника'
triangle_height = gets.chomp.to_f
area_of_triangele = 0.5 * triangle_base * triangle_height
puts "Площадь треугольника = #{area_of_triangele}"
