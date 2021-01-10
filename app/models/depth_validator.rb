module Validators
  class DepthValidator < ActiveModel::Validator
    def validate(record)
      record.errors.add :depth, 'too deep' if record.depth > 6
    end
  end
end
