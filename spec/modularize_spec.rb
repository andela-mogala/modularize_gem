require 'spec_helper'

describe Modularize do
  it 'has a version number' do
    expect(Modularize::VERSION).not_to be nil
  end

  describe '.create' do

    context 'with single module name as argument' do
      it 'creates a single module' do
        expect(defined? Fruit).to be_nil
        Modularize.create('Fruit')
        expect(defined? Fruit).to_not be_nil
      end
    end

    context 'with more than one module name in the args string' do
      it 'creates a hierarchy of modules' do
        expect(defined?(Animals::Cats::Bombay)).to be_nil
        Modularize.create('Animals::Cats::Bombay')
        expect(defined?(Animals::Cats::Bombay)).to_not be_nil
      end
    end
  end
end
