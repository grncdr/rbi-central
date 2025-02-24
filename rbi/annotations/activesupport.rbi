# typed: strict

module ActiveSupport::Testing::Declarative
  sig { params(name: String, block: T.proc.bind(T.untyped).void).void }
  def test(name, &block); end
end

class ActiveSupport::EnvironmentInquirer
  sig { returns(T::Boolean) }
  def development?; end

  sig { returns(T::Boolean) }
  def production?; end

  sig { returns(T::Boolean) }
  def test?; end

  # @method_missing: delegated to String through ActiveSupport::StringInquirer
  sig { returns(T::Boolean) }
  def staging?; end
end

module ActiveSupport::Testing::SetupAndTeardown::ClassMethods
  sig { params(args: T.untyped, block: T.nilable(T.proc.bind(T.untyped).void)).void }
  def setup(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.bind(T.untyped).void)).void }
  def teardown(*args, &block); end
end

class ActiveSupport::TestCase
  sig { params(args: T.untyped, block: T.nilable(T.proc.bind(T.attached_class).void)).void }
  def self.setup(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.bind(T.attached_class).void)).void }
  def self.teardown(*args, &block); end

  sig { params(name: String, block: T.proc.bind(T.attached_class).void).void }
  def self.test(name, &block); end
end

class ActiveSupport::TimeWithZone
  # @shim: Methods on ActiveSupport::TimeWithZone are delegated to `Time` using `method_missing
  include ::DateAndTime::Zones
  # @shim: Methods on ActiveSupport::TimeWithZone are delegated to `Time` using `method_missing
  include ::DateAndTime::Calculations
end

class Object
  sig { returns(T::Boolean) }
  def blank?; end

  sig { returns(T::Boolean) }
  def present?; end
end

class Hash
  sig { returns(T::Boolean) }
  def extractable_options?; end
end

class Array
  sig { params(position: Integer).returns(T.self_type) }
  def from(position); end

  sig { params(position: Integer).returns(T.self_type) }
  def to(position); end

  sig { params(elements: T.untyped).returns(T::Array[T.untyped]) }
  def including(*elements); end

  sig { params(elements: T.untyped).returns(T.self_type) }
  def excluding(*elements); end

  sig { params(elements: T.untyped).returns(T.self_type) }
  def without(*elements); end

  sig { returns(T.nilable(Elem)) }
  def second; end

  sig { returns(T.nilable(Elem)) }
  def third; end

  sig { returns(T.nilable(Elem)) }
  def fourth; end

  sig { returns(T.nilable(Elem)) }
  def fifth; end

  sig { returns(T.nilable(Elem)) }
  def forty_two; end

  sig { returns(T.nilable(Elem)) }
  def third_to_last; end

  sig { returns(T.nilable(Elem)) }
  def second_to_last; end

  sig { params(options: T::Hash[T.untyped, T.untyped]).returns(String) }
  def to_sentence(options = {}); end

  sig { params(format: Symbol).returns(String) }
  def to_fs(format = :default); end

  sig { params(format: Symbol).returns(String) }
  def to_formatted_s(format = :default); end

  sig { returns(String) }
  def to_xml; end

  sig { returns(T::Hash[T.untyped, T.untyped]) }
  def extract_options!; end

  sig do
    type_parameters(:FillType)
      .params(
        number: Integer,
        fill_with: T.type_parameter(:FillType),
        block: T.nilable(T.proc.params(group: T::Array[T.any(Elem, T.type_parameter(:FillType))]).void),
      )
      .returns(T::Array[T::Array[T.any(Elem, T.type_parameter(:FillType))]])
  end
  def in_groups(number, fill_with = T.unsafe(nil), &block); end

  sig do
    type_parameters(:FillType)
      .params(
        number: Integer,
        fill_with: T.type_parameter(:FillType),
        block: T.nilable(T.proc.params(group: T::Array[T.any(Elem, T.type_parameter(:FillType))]).void),
      )
      .returns(T::Array[T::Array[T.any(Elem, T.type_parameter(:FillType))]])
  end
  def in_groups_of(number, fill_with = T.unsafe(nil), &block); end

  sig do
    params(value: T.untyped, block: T.nilable(T.proc.params(element: Elem).returns(T.untyped)))
      .returns(T::Array[T::Array[Elem]])
  end
  def split(value = nil, &block); end

  sig { params(object: T.untyped).returns(T::Array[T.untyped]) }
  def self.wrap(object); end

  sig { returns(T.untyped) }
  def extract!; end

  sig { returns(ActiveSupport::ArrayInquirer) }
  def inquiry; end
end
