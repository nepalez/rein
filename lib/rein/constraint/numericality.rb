module Rein
  module Constraint
    # This module contains methods for defining numericality constraints.
    module Numericality
      include Rein::Constraint::Options

      OPERATORS = {
        greater_than: :>,
        greater_than_or_equal_to: :>=,
        equal_to: :"=",
        not_equal_to: :"!=",
        less_than: :<,
        less_than_or_equal_to: :<=
      }.freeze

      def add_numericality_constraint(table, attribute, options = {})
        name = constraint_name(table, attribute, options)

        conditions = OPERATORS.slice(*options.keys).map do |key, operator|
          value = options[key]
          [attribute, operator, value].join(" ")
        end.join(" AND ")

        conditions = conditions_with_if(conditions, options)

        execute("ALTER TABLE #{table} ADD CONSTRAINT #{name} CHECK (#{conditions})")
      end

      def remove_numericality_constraint(table, attribute, options = {})
        name = constraint_name(table, attribute, options)
        execute("ALTER TABLE #{table} DROP CONSTRAINT #{name}")
      end
    end
  end
end
