module Draper 
  module CanCan
    module InstanceMethods
      def creatable?
        able_to?(:create)
      end

      def updatable?
        able_to?(:update)
      end
      def editable?
        able_to?(:edit)
      end
      
      def managable?
        able_to?(:manage)
      end
      def readable?
        able_to?(:read)
      end
      
      def destroyable?
        able_to?(:destroy)
      end
      alias :deletable? :destroyable?
      
      def able_to?(action, *args)
        h.can?(action, model, *args)
      end
      def unable_to?(action, *args)
        h.cannot?(action, model, *args)
      end
      
    end
    
    def self.included(receiver)
      receiver.send :include, InstanceMethods 
    end
  end
end