@[Link(ldflags: "#{__DIR__}/shoco/shoco.o")]
lib LibShoco
  fun compress = shoco_compress(in : LibC::Char*, len : LibC::SizeT, out : LibC::Char*, bufsize : LibC::SizeT) : LibC::SizeT
  fun decompress = shoco_decompress(in : LibC::Char*, len : LibC::SizeT, out : LibC::Char*, bufsize : LibC::SizeT) : LibC::SizeT
end
