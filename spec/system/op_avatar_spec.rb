# frozen_string_literal: true

RSpec.describe "OP Avatar" do
  fab!(:theme) { upload_theme_component }
  fab!(:op, :user)
  fab!(:other_user, :user)
  fab!(:topics) do
    Fabricate
      .times(2, :topic, user: op)
      .tap do |topics|
        topics.each do |t|
          PostCreator.new(op, topic_id: t.id, raw: "this is the op").create
          PostCreator.new(other_user, topic_id: t.id, raw: "this is a reply").create
        end
      end
  end

  it "renders the OP avatar instead of the most recent poster", mobile: true do
    visit "/latest"

    expect(page).to have_css(".topic-list-data [data-user-card=#{op.username}]", count: 2)
  end
end
