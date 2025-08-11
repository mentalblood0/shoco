require "spec"
require "../src/shoco.cr"

describe Shoco do
  ["test", "testtttttttt", "t", "", "1234"].each do |input|
    it "can compress/decompress \"#{input}\"" do
      Shoco::Api.decompress(Shoco::Api.compress(input).not_nil!).should eq input
    end
  end
  ["ф", "ффффффф"].each do |input|
    it "can not compress/decompress \"#{input}\"" do
      Shoco::Api.compress(input).should eq nil
    end
  end
end
