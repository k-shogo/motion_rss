describe 'Item' do

  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Item entity' do
    Item.entity_description.name.should == 'Item'
  end
end
