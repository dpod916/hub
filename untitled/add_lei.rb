load 'config/environment.rb'
Rails.application.eager_load!

doc = File.open("20170823-GLEIF-concatenated.xml") { |f| Nokogiri::XML(f) }
root = doc.root
puts root
root.each do |child|
  puts child
end
@lou_sources = root.at_xpath('LOUSource')
@lou_sources.each do |lou_source|
  @lou_lei = lou_source.at_xpath('LOULEI').content
  lou = LocalOperatingUnit.where(lei: @lou_lei).first_or_initialize
  @lou_name = lou_source.at_xpath('LOUName').content
  @lou_record_count = lou_source.at_xpath('RecordCount').content
  @lou_content_date = lou_source.at_xpath('ContentDate').content
  @attempted_download = lou_source.at_xpath('LastAttemptedDownloadDate').content
  @successful_download = lou_source.at_xpath('LastSuccessfulDownloadDate').content
  @valid_download = lou_source.at_xpath('LastValidDownloadDate').content
  lou.update_attributes(lei: @lou_lei, name: @lou_name,
                        record_count: @lou_record_count,
                        content_data: @lou_content_date,
                        last_attempted_download_date: @attempted_download,
                        last_successful_download_date: @successful_download,
                        last_valid_download_date: @valid_download)
  puts @lou_name
end

@leis = root.at_xpath('LEIRecord')
@leis.each do |lei|
  @lei = lei.at_xpath('LEI').content
  @entity = lei.at_xpath('Entity')
  @name = @entity.at_xpath('LegalName').content
  puts @name
  entity = LegalEntity.where(lei: @lei).first_or_initialize
  entity.legal_name = @entity.at_xpath('LegalName').content
  entity.business_register_id = @entity.at_xpath('BusinessRegisterEntityID')
  entity.legal_jurisdiction = @entity.at_xpath('/LegalJurisdiction').content
  entity.legal_form = @entity.at_xpath('LegalForm').content
  entity.entity_status = @entity.at_xpath('EntityStatus').content
  entity.save

  @registration = @entity.at_xpath('Registration')
  registration = Registration.new
  registration.initial_registration_date = @registration.at_xpath('InitialRegistrationDate').content
  registration.last_update_date = @registration.at_xpath('LastUpdateDate').content
  registration.registration_status = @registration.at_xpath('RegistrationStatus').content
  registration.next_renewal_date = @registration.at_xpath('NextRenewalDate').content
  registration.local_operating_unit = LocalOperatingUnit.where(lei: @registration.at_xpath('ManagingLOU').content).first
  registration.validation_sources = @registration.at_xpath('ValidationSources').content
  registration.legal_entity = entity
  registration.save

  @legal_address = @entity.at_xpath('LegalAddress')
  legal_address = Address.new
  legal_address.type = "legal"
  legal_address.first_line = @legal_address.at_xpath('Line1').content
  legal_address.city = @legal_address.at_xpath('City').content
  legal_address.region = @legal_address.at_xpath('Region').content
  legal_address.country = @legal_address.at_xpath('Country').content
  legal_address.postal_code = @legal_address.at_xpath('PostalCode').content
  legal_address.legal_entity = entity
  legal_address.save

  @headquarter_address = @entity.at_xpath('HeadquartersAddress')
  headquarter_address = Address.new
  headquarter_address.first_line = @headquarter_address.at_xpath('Line1').content
  headquarter_address.city = @headquarter_address.at_xpath('City').content
  headquarter_address.region = @headquarter_address.at_xpath('Region').content
  headquarter_address.country = @headquarter_address.at_xpath('Country').content
  headquarter_address.postal_code = @headquarter_address.at_xpath('PostalCode').content
  headquarter_address.legal_entity = entity
  headquarter_address.save
end

