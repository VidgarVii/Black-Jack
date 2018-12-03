module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(instance, validate, param = nil)
      @validations ||= []
      @validations << { attr: instance, type: validate, option: param }
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def validate!
      self.class.validations.each do |validators|
        method = "validate_#{validators[:type]}"
        check_instatnce = instance_variable_get("@#{validators[:attr]}")
        param = validators[:option]
        send(method, check_instatnce, param)
      end
    end

    def validate_presence(instance, _param)
      raise 'Значение не должно быть пустым' if instance.to_s.empty? || instance.nil?
    end

    def validate_min_money(instance, param)
      raise "У #{instance.name} нет денег" if instance.money < param
    end
  end
end
