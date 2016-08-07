class Subject
  include ActiveModel::Model

  attr_accessor :id, :code, :name, :credits, :cycle, :room, :description, :hours, :created_at, :updated_at, :url

  BASE_URL = 'https://api-university.herokuapp.com/subjects'
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
        subject: {
            id: self.id,
            code: self.code,
            name: self.name,
            credits: self.credits,
            cycle: self.cycle,
            room: self.room,
            description: self.description,
            hours: self.hours,
        }
    }
  end

  def self.all
    response = HTTParty.get( path, headers: HEADERS )
    response.parsed_response.map do |subject|
      new( subject )
    end
  end

  def self.find( id )
    response = HTTParty.get( path("/#{id}"), headers: HEADERS )
    new( response.parsed_response )
  end

  def save
    HTTParty.post( self.class.path, query: attributes, headers: HEADERS )
  end

  def update
    HTTParty.put( self.class.path("/#{id}"), query: attributes, headers: HEADERS )
  end

  def destroy
    HTTParty.delete( self.class.path("/#{id}"), headers: HEADERS )
  end
end