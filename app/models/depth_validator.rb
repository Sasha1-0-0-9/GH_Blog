module Validators
  class DepthValidator < ActiveModel::Validator
    def validate(record)
      record.errors.add :depth, 'too deep' if record.depth > 4
    end
  end
end
