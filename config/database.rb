configure :test do
  set :database, {
    adapter: 'postgresql',
    encoding: 'utf8',
    database: 'onebitbot_test',
    pool: 5,
    username: 'postgres',
    host: 'postgres'
    password: '123123'
  }
end

configure :development do
  set :database, {
    adapter: 'postgresql',
    encoding: 'utf8',
    database: 'onebitbot_development',
    pool: 5,
    username: 'postgres',
    host: 'postgres',
    password: '123123'
  }
end