require 'rails_helper'

RSpec.describe Jadwal, type: :model do
  
  it 'validasi gagal' do
    jdw = Jadwal.new
    jdw.beg_time = ''
    jdw.valid?
    jdw.errors[:beg_time].should include("can't be blank")
  end

  it 'validari berhasil' do
    jdw = Jadwal.new
    jdw.beg_time = '2018/01/09'
    jdw.valid?
    jdw.errors[:beg_time].should_not include("can't be blank")
  end
end

