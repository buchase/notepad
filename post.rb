class Post

  # Метод post_types класса Post, возвращает всех известных ему детей класса
  # Post в виде массива классов.
  def self.post_types
    [Memo, Link, Task]
  end

  # Метод create класса Post динамически (в зависимости от параметра) создает
  # объект нужного класса (Memo, Task или Link) из набора возможных детей,
  # получая список с помощью метода post_types, объявленного выше.
  def self.create(type_index)
    return post_types[type_index].new
  end

  def initialize
    @created_at = Time.now
    @text = nil

  end

  def read_from_console

  end

  def to_strings

  end

  def save
    file = File.new(file_path, 'w:UTF-8')


    for item in to_strings do
      file.puts(item)
    end

    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__)

    # Метод strftime
    # формирует строку типа "2016-12-27_12-08-31.txt".

    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")

    return current_path + "/" + file_name
  end
end
