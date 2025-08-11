require "./LibShoco.cr"

module Shoco
  class Exception < Exception
  end

  class Api
    def self.compress(input : String) : Bytes?
      r = Bytes.new input.size
      w = LibShoco.compress input.to_unsafe, input.size, r.to_unsafe, r.size
      return nil if w == r.size + 1
      raise Exception.new "shoco_compress(#{input.to_unsafe}, #{input.size}, #{r.to_unsafe}, #{r.size}) returned #{w}" if w > r.size
      w > 0 ? r[..w - 1] : "".to_slice
    end

    def self.decompress(input : Bytes) : String
      return "" if input.empty?
      r = Bytes.new input.size * 2
      w = LibShoco.decompress input.to_unsafe, input.bytesize, r.to_unsafe, r.size
      raise Exception.new "shoco_compress(#{input.to_unsafe}, #{input.size}, #{r.to_unsafe}, #{r.size}) returned #{w}" if w > r.size
      String.new r[..w - 1]
    end
  end
end
