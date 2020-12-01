class Reservation < ApplicationRecord
  validates :start_date, {presence: true, uniqueness: true}
  validate :start_check
  validate :start_cannot


  # 開始時間と現在日時の比較
  def start_check
    errors.add(:start_date, "は現在の時刻より前に時間になっています") if self.start_date < Time.now
  end

  def start_cannot
    errors.add(:start_date, "は営業時間外です") if  Time.parse(self.start_date.strftime("%Y/%m/%d %H:%M")).hour < 10 || Time.parse(self.start_date.strftime("%Y/%m/%d %H:%M")).hour > 18
  end



  belongs_to :enduser
end