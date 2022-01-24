class Memo < Post

  def read_from_console
    puts "Новая заметка (все, что пишите до строчки \"end\"):"

    line = nil
    @text = []

    while line != "end" do
      line = STDIN.gets.chomp
      @text << line
    end

    #удаляем последнюю строчку, т.к. это ключевое слово "end"
    @text.pop
  end

  def to_strings
    # Сгенерируем строку с датой создания заметки
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r"

    # Возвращаем массив @text с добавление в начало (методом массива unshift)
    @text.unshift(time_string)
  end
end
