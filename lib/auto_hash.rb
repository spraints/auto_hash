class AutoHash < Hash
  def initialize
    super { |h,k| h[k] = AutoHash.new }
  end
end
