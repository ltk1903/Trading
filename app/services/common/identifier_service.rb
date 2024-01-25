# Common::IdentifierService.new.generate(User, 0)
class Common::IdentifierService
  attr_reader :period, :charsets, :options, :identifier

  def initialize(options = {})
    @period     = options[:period]
    @charsets   = options[:charsets] || 'abcdefIJKLMNOPQghijklmwxyzABCDEFGHRSTUVWXYZ01234nopqrstuv56789'
    @options    = options
    @identifier = Identifier.new(shard_bits: 1, seq_bits: 1, period: period)
    # @identifier = Identifier.new(shard_bits: 2, seq_bits: 8, period: period)
  end
  
  def generate(model_klass, shard = 0)
    identifier.generate(ActiveRecord::Base.connection.execute("SELECT nextval('#{model_klass.table_name}_id_seq') as seq")[0]['seq'], shard)
  end

  def created_at(id)
    identifier.created_at(id)
  end

  def shard(id)
    identifier.shard(id)
  end

  def seq(id)
    identifier.seq(id)
  end

  def encode_id(id)
    Base62.encode(id, keys: charsets)
  end

  def decode_id(encoded)
    Base62.decode(encoded, keys: charsets)
  end
end
