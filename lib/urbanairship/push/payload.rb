module Urbanairship
  module Push
    module Payload
      require 'ext/hash'
      include Urbanairship::Common

      # Notification Object for a Push Payload
      # def notification(alert: nil, ios: nil, android: nil, amazon: nil,
      #                  blackberry: nil, wns: nil, mpns: nil, actions: nil,
      #                  interactive: nil)
      def notification(options = {})
        alert = options.fetch(:alert, nil)
        ios = options.fetch(:ios, nil)
        android = options.fetch(:android, nil)
        amazon = options.fetch(:amazon, nil)
        blackberry = options.fetch(:blackberry, nil)
        wns = options.fetch(:wns, nil)
        mpns = options.fetch(:mpns, nil)
        actions = options.fetch(:actions, nil)
        interactive = options.fetch(:interactive, nil)
        payload = {
          alert: alert,
          actions: actions,
          ios: ios,
          android: android,
          amazon: amazon,
          blackberry: blackberry,
          wns: wns,
          mpns: mpns,
          interactive: interactive
        }.compact
        fail ArgumentError, 'Notification body is empty' if payload.empty?
        payload
      end

      # iOS specific portion of Push Notification Object
      # def ios(alert: nil, badge: nil, sound: nil, extra: nil, expiry: nil,
      #         category: nil, interactive: nil, content_available: nil)
      def ios(options = {})
        alert = options.fetch(:alert, nil)
        badge = options.fetch(:badge, nil)
        sound = options.fetch(:sound, nil)
        extra = options.fetch(:extra, nil)
        expiry = options.fetch(:expiry, nil)
        category = options.fetch(:category, nil)
        interactive = options.fetch(:interactive, nil)
        content_available = options.fetch(:content_available, nil)
        {
          alert: alert,
          badge: badge,
          sound: sound,
          extra: extra,
          expiry: expiry,
          category: category,
          interactive: interactive,
          'content-available' => content_available
        }.compact
      end

      # Amazon specific portion of Push Notification Object
      # def amazon(alert: nil, consolidation_key: nil, expires_after: nil,
      #            extra: nil, title: nil, summary: nil, interactive: nil)
      #   {
      #     alert: alert,
      #     consolidation_key: consolidation_key,
      #     expires_after: expires_after,
      #     extra: extra,
      #     title: title,
      #     summary: summary,
      #     interactive: interactive
      #   }.compact
      # end

      # Android specific portion of Push Notification Object
      # def android(alert: nil, collapse_key: nil, time_to_live: nil,
      #             extra: nil, delay_while_idle: nil, interactive: nil)
      def android(options = {})
        alert = options.fetch(:alert, nil)
        collapse_key = options.fetch(:collapse_key, nil)
        time_to_live = options.fetch(:time_to_live, nil)
        extra = options.fetch(:extra, nil)
        delay_while_idle = options.fetch(:delay_while_idle, nil)
        interactive = options.fetch(:interactive, nil)

        {
          alert: alert,
          collapse_key: collapse_key,
          time_to_live: time_to_live,
          extra: extra,
          delay_while_idle: delay_while_idle,
          interactive: interactive
        }.compact
      end

      # BlackBerry specific portion of Push Notification Object
      # def blackberry(alert: nil, body: nil, content_type: 'text/plain')
      #   { body: alert || body, content_type: content_type }
      # end

      # WNS specific portion of Push Notification Object
      # def wns_payload(alert: nil, toast: nil, tile: nil, badge: nil)
      #   payload = {
      #     alert: alert,
      #     toast: toast,
      #     tile: tile,
      #     badge: badge
      #   }.compact
      #   fail ArgumentError, 'Must specify one message type' if payload.size != 1
      #   payload
      # end

      # MPNS specific portion of Push Notification Object
      # def mpns_payload(alert: nil, toast: nil, tile: nil)
      #   payload = {
      #     alert: alert,
      #     toast: toast,
      #     tile: tile
      #   }.compact
      #   fail ArgumentError, 'Must specify one message type' if payload.size != 1
      #   payload
      # end

      # Rich Message specific portion of Push Notification Object
      # def message(title: required('title'), body: required('body'), content_type: nil, content_encoding: nil,
      #             extra: nil, expiry: nil, icons: nil, options: nil)
      #   {
      #     title: title,
      #     body: body,
      #     content_type: content_type,
      #     content_encoding: content_encoding,
      #     extra: extra,
      #     expiry: expiry,
      #     icons: icons,
      #     options: options
      #   }.compact
      # end

      # Interactive Notification portion of Push Notification Object
      # def interactive(type: required('type'), button_actions: nil)
      #   fail ArgumentError, 'type must not be nil' if type.nil?
      #   { type: type, button_actions: button_actions }.compact
      # end

      def all
        'all'
      end

      # Target specified device types
      def device_types(types)
        types
      end

      # Expiry for a Rich Message
      # def options(expiry: required('expiry'))
      #   { expiry: expiry }
      # end

      # Actions for a Push Notification Object
      # def actions(add_tag: nil, remove_tag: nil, open_: nil, share: nil,
      #             app_defined: nil)
      def actions(options = {})
        add_tag = options.fetch(:add_tag, nil)
        remove_tag = options.fetch(:remove_tag, nil)
        open = options.fetch(:open, nil)
        share = options.fetch(:share, nil)
        app_defined = options.fetch(:app_defined, nil)

        {
          add_tag: add_tag,
          remove_tag: remove_tag,
          open: open_,
          share: share,
          app_defined: app_defined
        }.compact
      end
    end
  end
end
