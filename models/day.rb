require_relative('../db/sql_runner')

class Day

  attr_reader( :id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO days (
      name
    ) VALUES (
      '#{@name}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM days"
    results = SqlRunner.run(sql)
    return results.map { |hash| Day.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM days"
    SqlRunner.run(sql)
  end
end