class Career
  include ActiveModel::Model
  include ActiveModel::Validations
  validates_presence_of :code, :name, :quantity_credits, :semester

  attr_accessor :id, :code, :name, :quantity_credits, :amount, :semester, :created_at, :updated_at, :url

  BASE_URL = 'https://api-university.herokuapp.com/careers'
  HEADERS_API = {
      'token' => 'ef69a868-9912-43f6-9808-b86908ff64cb'
  }


  def self.path( request_path = '' )
    BASE_URL + request_path + '.json'
  end

  def persisted?
    self.id.present?
  end

  def self.endpoint
    raise 'Not implemented'
  end

  def self.all
    response = HTTParty.get( path, headers: HEADERS_API )
    response.parsed_response.map do |career|
      new( career )
    end
  end

  def self.find( id )
    response = HTTParty.get( path("/#{id}"), headers: HEADERS_API )
    elem = new( response.parsed_response )
  end

  def save
    HTTParty.post( self.class.path, query: attributes, headers: HEADERS_API )
  end

  def update
    HTTParty.put( self.class.path("/#{id}"), query: attributes, headers: HEADERS_API )
  end

  def destroy
    HTTParty.delete( self.class.path("/#{id}"), headers: HEADERS_API )
  end

  def attributes
    {
        career: {
            id: self.id,
            code: self.code,
            name: self.name,
            quantity_credits: self.quantity_credits,
            amount: self.amount,
            semester: self.semester,
        }
    }
  end
end