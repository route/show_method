module ShowMethod
  class Error < StandardError; end

  def self.command
    editor = ENV['EDITOR'] || 'vi'
    command = case editor
              when 'mvim', 'vim', 'vi', 'emacs', 'nano'
                '%{editor} +%{line} %{file}'
              when 'mate'
                '%{editor} -l %{line} %{file}'
              when 'subl'
                '%{editor} %{file}:%{line}'
              end
    raise Error, "Editor #{editor} isn't supported" unless command
    [command, editor]
  end

  def self.method_location(object, name)
    file, line = object.method(name).source_location
    raise Error, "Method `#{name}` is written on C language" unless file
    [file, line]
  end

  def show_method(name)
    file, line = ShowMethod.method_location(self, name)
    command, editor = ShowMethod.command
    system(command % { :editor => editor, :line => line, :file => file })
  rescue ShowMethod::Error => error
    warn error.message
  end
  alias :s :show_method
end

Object.send :include, ShowMethod
