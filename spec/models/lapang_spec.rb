require 'rails_helper'

RSpec.describe Lapang, type: :model do
  it 'validasi gagal' do
    lap = Lapang.new
    lap.nama_lapang = ''
    lap.valid?
    lap.errors[:nama_lapang].should include("can't be blank")
  end

  it 'validari berhasil' do
    lap = Lapang.new
    lap.nama_lapang = 'Lapang 1'
    lap.valid?
    lap.errors[:nama_lapang].should_not include("can't be blank")
  end

end
