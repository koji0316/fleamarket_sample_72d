require 'rails_helper'

describe Item do
  describe '#create' do

    it "nameが無い場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "nameが20文字を超える場合は登録できないこと" do
      item = build(:item, name: "a" * 21)
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 20 characters)")
    end

    it "descriptionが無い場合は登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "descriptionが1000文字を超える場合は登録できないこと" do
      item = build(:item, description: "a" * 1001)
      item.valid?
      expect(item.errors[:description]).to include("is too long (maximum is 1000 characters)")
    end

    it "sizeが無い場合は登録できないこと" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("can't be blank")
    end

    it "statusが無い場合は登録できないこと" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    it "priceが無い場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "priceが300円未満の場合は登録できないこと" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "priceが9,999,999円を超える場合は登録できないこと" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "shipping_feeが無い場合は登録できないこと" do
      item = build(:item, shipping_fee: nil)
      item.valid?
      expect(item.errors[:shipping_fee]).to include("can't be blank")
    end

    it "shippingfromが無い場合は登録できないこと" do
      item = build(:item, shippingfrom_id: nil)
      item.valid?
      expect(item.errors[:shippingfrom_id]).to include("can't be blank")
    end

    it "shipping_daysが無い場合は登録できないこと" do
      item = build(:item, shipping_days: nil)
      item.valid?
      expect(item.errors[:shipping_days]).to include("can't be blank")
    end

    it "seller_idが無い場合は登録できないこと" do
      item = build(:item, seller_id: nil)
      item.valid?
      expect(item.errors[:seller_id]).to include("can't be blank")
    end

    it "category_idが無い場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "imageが無い場合は登録できないこと" do
      item = build(:item)
      item.valid?
      expect(item.errors[:photos]).to include("can't be blank")
    end

    it "全てを満たせば登録できること" do
      photo = build(:photo)
      item = build(:item, photos:[photo])
      expect(item).to be_valid
    end

  end
end
