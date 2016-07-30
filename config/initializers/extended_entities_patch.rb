module Twitter
  module Entities
    # @return [Array<Twitter::Media>]
    def media
      extended_entities(MediaFactory, :media)
    end

    private

    # @param klass [Class]
    # @param key [Symbol]
    def extended_entities(klass, key)
      if @attrs[:extended_entities].nil?
        []
      else
        @attrs[:extended_entities].fetch(key.to_sym, []).collect do |entity|
          klass.new(entity)
        end
      end
    end
  end
end
