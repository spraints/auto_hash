class AutoHash < Hash
  def initialize
    super { |h,k| MaybeNestedHash.new(h, k) }
  end

  class BlankSlate
    instance_methods.each { |m| undef_method m unless m =~ /^__/ }
  end

  class MaybeNestedHash < BlankSlate
    def initialize(hash, key)
      @hash = hash
      @key = key
      @delegate = nil
    end

    def [](key)
      MaybeNestedHash.new(self, key)
    end

    def []=(key, value)
      if @delegate.nil?
        @delegate = AutoHash.new
        @hash[@key] = @delegate
      end
      @delegate[key] = value
    end

    def method_missing(m, *args, &block)
      @delegate.__send__(m, *args, &block)
    end
  end
end
