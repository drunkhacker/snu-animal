require 'streamer/sse'

class StreamController < ApplicationController
  before_filter :authorized?
  include ActionController::Live

  def notification
    response.headers['Content-Type'] = 'text/event-stream'
    sse = Streamer::SSE.new(response.stream)
    redis = Redis.new
    redis.subscribe("post.#{params[:post_id]}.comment") do |on|
      on.message do |event, data|
        sse.write(data, event: 'comment')
      end
    end
    render nothing: true
  rescue IOError
    # Client disconnected
    logger.info "Disconnected"
  ensure
    logger.info "Nomally closed"
    redis.quit
    sse.close
  end
end
