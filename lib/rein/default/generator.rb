module Rein
  module Default
    # This module contains methods for adding default value
    # as an arbitrary function
    #
    # @example
    #   set_default_generator :products, :sku, "gen_random_uuid()"
    #
    # To remove default use standard syntax from ActiveRecord::Migration library
    #
    # @example
    #   change_column :products, :sku, :string, default: nil
    #
    module Generator
      def set_default_generator(table_name, column_name, default_function)
        execute "ALTER TABLE #{table_name} " \
                "ALTER COLUMN #{column_name} " \
                "SET DEFAULT #{default_function}"
      end
    end
  end
end
