require File.dirname(__FILE__) + '/spec_helper'

describe Templater::TemplateProxy do
  
  it "should convert itself to a template" do
    generator = mock('a generator')
    generator.stub!(:source_root).and_return('/source/root')
    generator.stub!(:destination_root).and_return('/destination/root')
    template = mock('a template')
    
    proxy = Templater::TemplateProxy.new(:model) do
      source('/source/path')
      destination('/destination/path')
    end
    
    Templater::Template.should_receive(:new).with(generator, :model, '/source/root/source/path', '/destination/root/destination/path').and_return(template)
    
    proxy.to_template(generator)
  end
  
end