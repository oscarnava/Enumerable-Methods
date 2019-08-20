# Enumerable methods
#### By Oscar Nava Trujillo aka _«Monstruo»_
A collection of methods that mimic functionality of a subset of actual methods from enumerables in Ruby.
The involved methods are:
* **each** as _my_each_
* **each_with_index** as _my_each_with_index_
* **select** as _my_select_
* **all?** as _my_all?_
* **any?** as _my_any?_
* **none?** as _my_none?_
* **count** as _my_count_
* **map** as _my_map_
* **inject** as _my_inject_

This project includes some tests that execute both in Arrays and Hashes, and the results of all cases are compared to the results of the actual methods so that we can be 100% sure they are returning the same result in type and content as the originals.

To run tests, in a terminal execute: 
```
ruby enumerable.test.rb
```
