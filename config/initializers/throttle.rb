require 'redis'

redis_config = YAML.load(File.join(Rails.root, "config", "redis.yml"))
REDIS = Redis.new(host: redis_config["host"], port: redis_config["port"])

THROTTLE_TIME_WINDOW = 15 * 60
THROTTLE_MAX_REQUESTS = 60