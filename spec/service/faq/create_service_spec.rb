require_relative './../../spec_helper.rb'

describe FaqModule::CreateService do
  before do
    @company = create(:company)
    @question = FFaker::Lorem.sentense
    @answer = FFaker::Lorem.sentense
    @hashtags = "#{FFaker::Lorem.word}, #{FFaker::Lorem.word}"
  end

  describe '#call' do
    context "without hashtag params" do
      it "will receive a error" do
        @createService = FaqModule::CreateService.new({"question" => @question, "answer" => @answer})
        response = @createService.call()
        expect(response).to match("Hashtag Obrigatória")
      end
    end

    context "Wish Valid Params" do
      before do
        @createService = FaqModule::CreateService.new({"question" => @question, "answer" => @answer, "hashtags" => @hashtags})
        @response = @createService.call()
      end

      it "receive success message" do
        expect(@response).to match("Criado com sucesso")
      end

      it "Question and asnwer is present in database" do
        expect(Faq.last.question).to match(@question)
        expect(Faq.last.answer).to match(@answer)
      end

      it "hashtags are created" do
        expect(@hashtags.split(/[\s,]+/).first).to match(Hashtag.first.name)
        expect(@hashtags.split(/[\s,]+/).last).to match(Hashtag.last.name)
      end
    end
  end
end