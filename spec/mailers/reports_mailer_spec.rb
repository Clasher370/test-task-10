require 'rails_helper'

describe ReportsMailer do
  let!(:user) { create(:user_with_twenty_posts) }

  let(:collection) do
    User.posts_and_comments_count(start_date, end_date)
  end

  let(:mail) { described_class.report_email(collection, test_mail) }

  context 'is have correct' do
    it 'subject' do
      expect(mail.subject).to eq 'Report'
    end

    it 'to' do
      expect(mail.to).to eq [test_mail]
    end

    it 'from' do
      expect(mail.from).to eq ['report@example.com']
    end
  end

  describe 'letter structure include' do
    context 'th with' do
      ['Nickname', 'Email', 'Posts count', 'Comments count'].each do |attr|
        it "#{attr}" do
          expect(mail.body.encoded).to match "<th>#{attr}</th>"
        end
      end
    end

    context 'td with user' do
      it "nickname" do
        expect(mail.body.encoded).to match user.nickname
      end

      it "email" do
        expect(mail.body.encoded).to match user.email
      end

      it "count" do
        expect(mail.body.encoded).to match collection[0].posts_count.to_s
      end
    end
  end
end
