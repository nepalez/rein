module Rein
  module Default
    # This module contains methods for adding default value
    # using gen_random_uuid() from "pgcrypto" package in v9.4+
    #
    # @see https://www.postgresql.org/docs/9.4/static/pgcrypto.html
    #
    # @example
    #   set_default_uuid :products, :sku
    #
    module GenRandomUUID
      include Generator

      def set_default_uuid(table_name, column_name)
        enable_extension "pgcrypto"
        set_default_generator table_name, column_name, "gen_random_uuid()"
      end
    end
  end
end
