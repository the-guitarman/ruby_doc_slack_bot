require_relative '../lib/message'

RSpec.describe Message, "#answer" do
  #context "with no strikes or spares" do
    it "geets you, if you greet with 'bot hi' first" do
      message = Message.instance.answer("test-user", "bot   hi")
      expect(message).to eq "Hi <@test-user>!"
    end

    it "points you to type in a ruby class, module or method name for an empty message" do
      message = Message.instance.answer("test-user", " ")
      expect(message).to eq "Sorry <@test-user>, please ask me for a ruby class, module or method!"
    end

    it "points you to type in a ruby class, module or method name for a useless input" do
      message = Message.instance.answer("test-user", "abcdefg")
      expect(message).to eq "Sorry <@test-user>, please ask me for a ruby class, module or method!"
    end

    it "returns information from ri docs for a ruby class, module or methode name" do
      message = Message.instance.answer("test-user", "Array#first")
      expect(message).to match(/Returns the first element, or the first n elements/)
    end
  #end
end
