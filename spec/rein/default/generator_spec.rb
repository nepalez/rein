require "spec_helper"

RSpec.describe Rein::Default::Generator do
  subject(:adapter) { Class.new { include Rein::Default::Generator }.new }

  before { allow(adapter).to receive(:execute) }

  describe "#set_default_generator" do
    it "creates an enum type" do
      expect(adapter)
        .to receive(:execute)
        .with("ALTER TABLE products ALTER COLUMN sku SET DEFAULT gen_random_uuid()")

      adapter.set_default_generator(:products, :sku, "gen_random_uuid()")
    end
  end
end
