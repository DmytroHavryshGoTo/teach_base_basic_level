=begin
Пользователь вводит 3 коэффициента a, b и с. Программа вычисляет дискриминант (D)
и корни уравнения (x1 и x2, если они есть) и выводит значения дискриминанта и корней на экран
=end

puts "Введите коефициенты a,b,c через запятую: "
weights = gets.chomp.split(',').map(&:to_i)
discriminant = weights[1] ** 2 - 4 * weights[0] * weights[2]
if discriminant < 0
  puts "Корней нет"
elsif discriminant == 0
  x = (Math.sqrt(discriminant) - weights[1]) / 2.0 * weights[0]
  puts "В уравнении один корень = #{x}"
else
  x1 = (Math.sqrt(discriminant) - weights[1]) / 2.0 * weights[0]
  x2 = (-Math.sqrt(discriminant) - weights[1]) / 2.0 * weights[0]
  puts "Корни уравнения: x1 = #{x1}, x2 = #{x2}"
end
