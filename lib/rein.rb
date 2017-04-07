require "active_record"
require "active_record/connection_adapters/abstract_mysql_adapter"

require "rein/constraint/options"
require "rein/constraint/primary_key"
require "rein/constraint/foreign_key"
require "rein/constraint/inclusion"
require "rein/constraint/numericality"
require "rein/constraint/presence"
require "rein/type/enum"
require "rein/view"
require "rein/schema"
require "rein/default/generator"
require "rein/default/gen_random_uuid"

module ActiveRecord
  module ConnectionAdapters # :nodoc:
    class MysqlAdapter < AbstractAdapter # :nodoc:
      include Rein::Constraint::PrimaryKey
      include Rein::Constraint::ForeignKey
      include Rein::View
    end

    class Mysql2Adapter < AbstractMysqlAdapter # :nodoc:
      include Rein::Constraint::PrimaryKey
      include Rein::Constraint::ForeignKey
      include Rein::View
    end

    class PostgreSQLAdapter < AbstractAdapter # :nodoc:
      include Rein::Constraint::PrimaryKey
      include Rein::Constraint::ForeignKey
      include Rein::Constraint::Inclusion
      include Rein::Constraint::Numericality
      include Rein::Constraint::Presence
      include Rein::Type::Enum
      include Rein::View
      include Rein::Schema
      include Rein::Default::Generator
      include Rein::Default::GenRandomUUID
    end
  end
end
