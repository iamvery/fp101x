require 'rspec'

def twice(function, *args)
  function.(function.(*args))
end

dbl = ->(number) { number * 2 }
puts twice(dbl, 2)

RSpec.describe 'twice' do
  let(:function) { double :function }

  it 'calls the function twice with arguments' do
    expect(function).to receive(:call).twice
    twice(function)
  end

  it 'pipes the result of the first call to the second call' do
    args = [double, double]
    first_result = double

    expect(function).to receive(:call)
      .with(*args)
      .and_return(first_result)
    expect(function).to receive(:call)
      .with(first_result)

    twice(function, *args)
  end
end
