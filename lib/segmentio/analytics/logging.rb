require 'logger'

module Segmentio
  class Analytics
    module Logging
      class << self
        def logger
          @logger ||= if defined?(Rails)
                        Rails.logger
                      else
                        logger = Logger.new STDOUT
                        logger.progname = 'Segmentio::Analytics'
                        logger
                      end
        end

        def logger= logger
          @logger = logger
        end
      end

      def self.included base
        class << base
          def logger
            Logging.logger
          end
        end
      end

      def logger
        Logging.logger
      end
    end
  end
end
