require 'rspec'

twice = ->(function, arg) do
  function.(function.(arg))
end.curry

dbl = ->(number) { number * 2 }
puts twice.(dbl, 2)

RSpec.describe 'twice' do
  let(:function) { double :function }
  let(:arg) { double :arg }

  it 'calls the function twice with arguments' do
    expect(function).to receive(:call).twice
    twice.(function, arg)
  end

  it 'pipes the result of the first call to the second call' do
    first_result = double

    expect(function).to receive(:call)
      .with(arg)
      .and_return(first_result)
    expect(function).to receive(:call)
      .with(first_result)

    twice.(function, arg)
  end

  it 'is curried' do
    result = double
    allow(function).to receive(:call) { result }
    expect(twice.(function).(arg)).to eq(result)
  end
end
