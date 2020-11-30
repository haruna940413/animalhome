json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :enduser_id
  json.start reservation.start_date
  json.url reservation_url(reservation, format: :html)
end