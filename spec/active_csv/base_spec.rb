require 'rspec'
require 'active_csv/base'
require 'csv'

describe ActiveCSV::Base do

  it "can be initialized with nothing" do
    active_csv = ActiveCSV::Base.new
    expect(active_csv).to be_kind_of(ActiveCSV::Base)
  end

  describe "attribute readers" do
    it "defines an attribute reader for every column in the csv" do
      row = CSV::Row.new(["name", "age"], ["joe", "24"])

      active_csv = ActiveCSV::Base.new(row)

      expect(active_csv.name).to eq("joe")
      expect(active_csv.age).to eq("24")
    end

    it "responds to a method missing" do
      row = CSV::Row.new(["name", "age"], ["joe", "24"])

      active_csv = ActiveCSV::Base.new(row)

      expect(active_csv.respond_to?(:bar)).to eq(false)
      expect(active_csv.respond_to?(:age)).to eq(true)
    end
  end

  describe ".file_path" do
    it "allows you to set the file path to the CSV" do
      pending
      klass = Class.new(ActiveCSV::Base) do
        self.file_path = "foo"
      end
      expect(klass.file_path).to eq("foo")
    end
  end

end