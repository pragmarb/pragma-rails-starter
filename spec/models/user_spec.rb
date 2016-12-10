RSpec.describe User do
  subject { build_stubbed(:user) }

  it 'is valid' do
    expect(subject).to be_valid
  end
end
