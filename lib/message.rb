require 'singleton'

class Message
  include Singleton

  attr_reader :user, :message

  def answer(user, message)
    @user    = user
    @message = message || ''
    self.send(method_name)
  end

  def bot_hi
    "Hi <@#{@user}>!"
  end

  def method_missing(method_name, *args, &block)
    if @message.strip.empty? or @message.start_with?('Sorry')
      no_docs_found
    else
      ri_answer
    end
  end

  private

  def method_name
    @message.gsub(/\s+/, '_').to_sym
  end

  def ri_answer
    answer = `ri #{@message}`
    if answer.empty?
      answer = no_docs_found
    end
    answer
  end

  def no_docs_found
    "Sorry <@#{@user}>, please ask me for a ruby class, module or method!"
  end
end
