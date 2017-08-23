json.extract! registration, :id, :initial_registration_date, :last_update_date, :registration_status, :next_renewal_date, :local_operating_unit_id, :validation_sources, :legal_entity_id, :created_at, :updated_at
json.url registration_url(registration, format: :json)
