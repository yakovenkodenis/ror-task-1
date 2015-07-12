require 'prime'

# tasks
class RorTask1
  # Напишите программу, которая для заданного натурального числа num определяет
  # количество вхождений числа 3 в разложение заданного числа на простые сомножители.
  def how_many_threes(num)
    primes = Prime.take_while { |n| n < num**0.5 }
    devisors = []
    primes.each_with_index do |_, i|
      next if num % primes[i] != 0
      devisors << primes[i]
      break if num / primes[i] == 1
      num /= primes[i]
      redo
    end
    devisors.count(3)
  end

  # Дан текст. Определите максимальное из имеющихся в нем чисел.
  def max_number_in_text(text)
    n = text.scan(/[\+|\-]?\d+(?:\.\d+)?/).map(&:to_f).max
    (n % 1).zero? ? n.to_i : n
  end

  # Дан целочисленный массив. Необходимо вывести вначале его элементы с четными 
  # индексами, а затем - с нечетными.
  def even_odd_elements(arr)
    arr.each_with_index { |_, i| puts arr[i] if i.even? }
    arr.each_with_index { |_, i| puts arr[i] if i.odd? }
  end

  # Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний 
  # элемент. Первый и последний элементы массива не изменять.
  def even_elements_addition(arr)
    (1..arr.size - 2).each { |i| arr[i] += arr[-1] if arr[i].odd? }
    arr
  end

  # Дан целочисленный массив, содержащий по крайней мере два нуля. Вывести сумму чисел 
  # из данного массива, расположенных между первыми двумя нулями.
  def sum_between_zeros(arr)
    puts arr.slice(arr.index(0) + 1, arr.size)
      .take_while { |i| i != 0 }.reduce(0, :+)
  end
end
