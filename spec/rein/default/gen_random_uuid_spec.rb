require "spec_helper"

RSpec.describe Rein::Default::GenRandomUUID do
  subject(:adapter) { Class.new { include Rein::Default::GenRandomUUID }.new }

  before { allow(adapter).to receive(:execute) }

  describe "#set_default_uuid" do
    it "creates an enum type" do
      expect(adapter).to receive(:enable_extension).with("pgcrypto")
      expect(adapter)
        .to receive(:execute)
        .with("ALTER TABLE products ALTER COLUMN sku SET DEFAULT gen_random_uuid()")

      adapter.set_default_uuid(:products, :sku)
    end
  end
end
