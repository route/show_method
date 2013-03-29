class Object
  def show_method(name)
    editor = ENV['EDITOR']
    file, line = method(name).source_location
    `#{editor} -l #{line} #{file}`
  end
  alias :s :show_method
end
