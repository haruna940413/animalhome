class Pet < ApplicationRecord
  attachment :animal_image

  belongs_to :genre
  has_many :reservations

  enum age:{ blank: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9, ten: 10,
            eleven: 11, twelve: 12, thirteen: 13, fourteen: 14, fifteen: 15, sixteen: 16, seventeen: 17, eighteen: 18, nineteen: 19, twenty: 20}, _prefix: true
  enum sex:{ blank: 0, male: 1, female: 2 }, _prefix: true
  enum size: { blank: 0, small: 1, medium: 2, large: 3,cat: 4 }, _prefix: true
  enum vaccine_status: {  blank: 0, before: 1, after: 2}, _prefix: true
  enum castration_status: { blank: 0, before: 1, after: 2 }
  enum single_status: { blank: 0, ok: 1, ng: 2 }, _prefix: true
  enum older_status: { blank: 0, ok: 1, ng: 2 }, _prefix: true
  enum pet_status: { blank: 0, invite: 1, stop: 2, decide: 3 }, _prefix: true
  enum prefectures:{
      blank: 0,
      hokkaido:1,aomori:2,iwate:3,miyagi:4,akita:5,yamagata:6,fukushima:7,
      ibaraki:8,tochigi:9,gunnma:10,saitama:11,chiba:12,tokyo:13,kanagawa:14,
      niigata:15,toyama:16,ishikawa:17,fukui:18,yamanashi:19,nagano:20,
      gifu:21,shizuoka:22,aichi:23,mie:24,
      shiga:25,kyoto:26,osaka:27,hyogo:28,nara:29,wakayama:30,
      tottori:31,shimane:32,okayama:33,hiroshima:34,yamaguchi:35,
      tokushima:36,kagawa:37,ehime:38,kochi:39,
      fukuoka:40,saga:41,nagasaki:42,kumamoto:43,oita:44,miyazaki:45,kagoshima:46,okinawa:47
    }, _prefix: true

  validates :name, presence: true
  validates :kind, presence: true
  validates :detail, presence: true

  validates :age, inclusion: {in: Pet.ages.keys }
  validates :sex, inclusion: {in: Pet.sexes.keys }
  validates :size, inclusion: {in: Pet.sizes.keys }
  validates :vaccine_status, inclusion: {in: Pet.vaccine_statuses.keys }
  validates :castration_status, inclusion: {in: Pet.castration_statuses.keys }
  validates :single_status, inclusion: {in: Pet.single_statuses.keys }
  validates :older_status, inclusion: {in: Pet.older_statuses.keys }
  validates :prefectures, inclusion: {in: Pet.prefectures.keys }
  validates :pet_status, inclusion: {in: Pet.pet_statuses.keys }

end
