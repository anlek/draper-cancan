require File.expand_path("../../spec_helper", __FILE__)
require 'draper/cancan'

class TestModel; self; end

class TestDecorator < Draper::Base 
  decorates :TestModel
  include Draper::CanCan
end

describe Draper::CanCan do
  
  subject{ TestDecorator.new(source) }
  let(:source){ TestModel.new }
  before(:each) { subject.stubs(:h).returns({}) }
  
  { :creatable => :create, 
    :editable => :edit, 
    :updatable => :update,
    :destroyable => :destroy,
    :readable => :read, 
    :managable => :manage}.each do |cmd, test_value|
      describe "#{cmd}?" do
        it "#{test_value} is doable" do
          subject.h.expects(:can?).with(test_value, source).returns(true)
          subject.send("#{cmd}?").must_equal(true)
        end
        it "#{test_value} is not doable" do
          subject.h.expects(:can?).with(test_value, source).returns(false)
          subject.send("#{cmd}?").must_equal(false)
        end
      end
   end
    
  it "is able to edit" do
    subject.h.expects(:can?).with(:edit, source).returns(true)
    subject.able_to?(:edit).must_equal(true)
  end
  
  it "is unable to be edited" do
    subject.h.expects(:can?).with(:edit, source).returns(false)
    subject.able_to?(:edit).must_equal(false)
  end
end
