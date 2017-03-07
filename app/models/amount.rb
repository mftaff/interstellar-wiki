class Amount < ActiveRecord::Base
    def self.default
        7_99 # should return $7.99 as the amount to charge
    end
end
