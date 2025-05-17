module RubyVM::ZJIT
  # Assert that any future ZJIT compilation will return a function pointer
  def self.assert_compiles
    Primitive.rb_zjit_assert_compiles
  end

  # Check if \ZJIT is enabled.
  def self.enabled?
    Primitive.cexpr! 'RBOOL(rb_zjit_enabled_p)'
  end

  # Enable \ZJIT compilation.
  def self.enable(call_threshold: nil, num_profiles: nil)
    return false if enabled?

    if Primitive.cexpr! 'RBOOL(rb_yjit_enabled_p)'
      warn("Only one JIT can be enabled at the same time.")
      return false
    end

    Primitive.rb_zjit_enable(call_threshold, num_profiles)
  end
end
