# frozen_string_literal: true

require './my_enumerable.rb'
require 'test/unit'
extend Test::Unit::Assertions # rubocop:disable Style/MixinUsage

def array_tests(test_array)
  # print 'Testing array: ', test_array, "\n"

  enum = test_array.each
  test_array.my_each { |parm| assert_equal parm, enum.next }

  enum = test_array.each_with_index
  test_array.my_each_with_index { |*parms| assert_equal parms, enum.next }

  assert_equal(test_array.my_select(&:even?), test_array.select(&:even?))
  assert_equal(test_array.my_select { |n| n > 5 }, test_array.select { |n| n > 5 })

  assert_equal(test_array.my_all?(&:positive?), test_array.all?(&:positive?))
  assert_equal(test_array.my_all? { |n| n > 7 }, test_array.all? { |n| n > 7 })

  assert_equal(test_array.my_any?(&:positive?), test_array.any?(&:positive?))
  assert_equal(test_array.my_any?(&:negative?), test_array.any?(&:negative?))

  assert_equal(test_array.my_none?(&:negative?), test_array.none?(&:negative?))
  assert_equal(test_array.my_none? { |n| n > 7 }, test_array.none? { |n| n > 7 })

  assert_equal(test_array.my_count, test_array.count)
  assert_equal(test_array.my_count(5), test_array.count(5))
  assert_equal(test_array.my_count(50), test_array.count(50))
  assert_equal(test_array.my_count(&:even?), test_array.count(&:even?))

  my_array_proc = proc { |n| 7.0 / n }

  assert_equal(test_array.my_map { |n| n**n }, test_array.map { |n| n**n })
  assert_equal(test_array.my_map(my_array_proc), test_array.map(&my_array_proc))

  assert_equal(test_array.my_inject { |acc, n| acc + n }, test_array.inject { |acc, n| acc + n })
  assert_equal(test_array.my_inject(1000) { |acc, n| acc - n }, test_array.inject(1000) { |acc, n| acc - n })
  assert_equal(test_array.my_inject(&:+), test_array.inject(&:+))
  assert_equal(test_array.my_inject(1000, &:*), test_array.inject(1000, &:*))

  true
end

def hash_tests(test_hash)
  # print 'Testing hash: ', test_hash, "\n"

  enum = test_hash.each
  test_hash.my_each { |parms| assert_equal parms, enum.next }

  enum = test_hash.each_with_index
  test_hash.my_each_with_index { |parms, idx| assert_equal [parms, idx], enum.next }

  assert_equal(test_hash.my_select { |_, val| val.odd? }, test_hash.select { |_, val| val.odd? })

  assert_equal(test_hash.my_all? { |_, val| val.positive? }, test_hash.all? { |_, val| val.positive? })
  assert_equal(test_hash.my_all? { |_, val| val > 7 }, test_hash.all? { |_, val| val > 7 })

  assert_equal(test_hash.my_any? { |_, val| val.positive? }, test_hash.any? { |_, val| val.positive? })
  assert_equal(test_hash.my_any? { |_, val| val.even? }, test_hash.any? { |_, val| val.even? })

  assert_equal(test_hash.my_none? { |_, val| val.negative? }, test_hash.none? { |_, val| val.negative? })
  assert_equal(test_hash.my_none? { |_, val| val.odd? }, test_hash.none? { |_, val| val.odd? })

  assert_equal(test_hash.my_count, test_hash.count)

  assert_equal(test_hash.my_count(5), test_hash.count(5))
  assert_equal(test_hash.my_count([:one, 1]), test_hash.count([:one, 1]))
  assert_equal(test_hash.my_count { |_, n| n.even? }, test_hash.count { |_, n| n.even? })

  my_hash_proc = proc { |key, n| key.object_id / n }

  assert_equal(test_hash.my_map { |key, n| key.object_id * n }, test_hash.map { |key, n| key.object_id * n })
  assert_equal(test_hash.my_map(my_hash_proc), test_hash.map(&my_hash_proc))

  assert_equal(test_hash.my_inject { |a, b| a[1] += b[1]; a }, # rubocop:disable Style/Semicolon
               test_hash.inject { |a, b| a[1] += b[1]; a }) # rubocop:disable Style/Semicolon
  assert_equal(test_hash.my_inject(1000) { |acc, pair| acc - pair.last },
               test_hash.inject(1000) { |acc, pair| acc - pair.last })
  true
end

assert_equal(multiply_els([2, 4, 5]), 40)

array_tests [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array_tests [1, 10, 3, 4, 2, 7, 8, 9, 5, 6]
array_tests([])

puts '+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
puts '| Array tests were successful! |'
puts '+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
puts ' '

hash_tests one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9, ten: 10
hash_tests one: 10, six: 5, seven: 4, nine: 2, ten: 1, zero: 99, eight: 3, four: 7, five: 6, two: 9, three: 8
hash_tests({})

puts '+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
puts '| Hash tests were successful!  |'
puts '+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
