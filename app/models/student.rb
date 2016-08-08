class Student
  include ActiveModel::Model

  attr_accessor :id, :code, :identification, :full_name, :date_of_birth, :email, :phone_number, :created_at, :updated_at, :url

  BASE_URL = 'https://api-university.herokuapp.com/students'
  HEADERS = {
      'token' => '7b06d11e-d6da-41e9-8090-eaf680c1d225'
  }


  def self.path( request_path = '' )
    BASE_URL + request_path + '.json'
  end

  def pesisted?
    self.id.present?
  end

  def attributes
    {
        student: {
            id: self.id,
            code: self.code,
            identification: self.identification,
            full_name: self.full_name,
            date_of_birth: self.date_of_birth,
            email: self.email,
            phone_number: self.phone_number,
        }
    }
  end

  def self.all
    response = HTTParty.get( path, headers: HEADERS )
    response.parsed_response.map do |student|
      new( student )
    end
  end

  def self.find( id )
    response = HTTParty.get( path("/#{id}"), headers: HEADERS )
    new( response.parsed_response )
  end

  def save
    response = HTTParty.post( self.class.path, query: attributes, headers: HEADERS )
  end

  def update
    response = HTTParty.put( self.class.path("/#{id}"), query: attributes, headers: HEADERS )
  end

  def destroy
    HTTParty.delete( self.class.path("/#{id}"), headers: HEADERS )
  end
end