unless Criterion.exists?
  trading_criterions = [
    # trend: - có xu hướng rõ ràng - xu hướng thuận theo sóng chính  - đồng thuận các khung thời gian - Atlcoin cùng xu hướng với BTC
    # có xu hướng rõ ràng
    {
      name: 'trend có xu hướng rõ ràng',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :trend,
      translations_attributes: [
        {
          title: 'Thị trường đang có xu hướng rõ ràng (20-20-60)',
          content: "Trường 20% rõ xu hướng, 20% xu hướng không rõ ràng, 60% không có xu hướng",
          locale: :vi,
        },
        {
          locale: :en,
          title: 'Thị trường đang có xu hướng rõ ràng (20-20-60)',
          content: "Trường 20% rõ xu hướng, 20% xu hướng không rõ ràng, 60% không có xu hướng",
        }
      ]
    },
    # # xu hướng thuận theo sóng chính
    # {
    #   name: 'trend xu hướng thuận theo sóng chính',
    #   order_type: :trading,
    #   defined_by: :system,
    #   action_type: :create_new,
    #   is_required: true,
    #   section: :trend,
    #   translations_attributes: [
    #     {
    #       title: 'Giá đi theo đúng với xu hướng sóng chính',
    #       content: 'Trường 10% tăng, 10% giảm, 80% Sideway',
    #       locale: :vi,
    #     },
    #     {
    #       locale: :en,
    #       title: 'Giá đi theo đúng với xu hướng sóng chính',
    #       content: 'Trường 10% tăng, 10% giảm, 80% Sideway',
    #     }
    #   ]
    # },
    # đồng thuận các khung thời gian
    {
      name: 'trend - đồng thuận các khung thời gian',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :trend,
      translations_attributes: [
        {
          title: 'Đồng thuận các khung thời gian',
          content: 'Sóng đồng thuận ở các khung thời gian H1 H2 H4 H12 1D 4D 1W',
          locale: :vi,
        },
        {
          title: 'Đồng thuận các khung thời gian',
          content: 'Sóng đồng thuận ở các khung thời gian H1 H2 H4 H12 1D 4D 1W',
          locale: :en,
        }
      ]
    },
    # Atlcoin cùng xu hướng với BTC
    {
      name: 'trend Atlcoin cùng xu hướng với BTC',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :trend,
      translations_attributes: [
        {
          title: 'Atlcoin cùng xu hướng với BTC',
          content: 'Luôn luôn giao dịch Altcoin theo xu hướng sóng của BTC',
          locale: :vi,
        },
        {
          title: 'Atlcoin cùng xu hướng với BTC',
          content: 'Luôn luôn giao dịch Altcoin theo xu hướng sóng của BTC',
          locale: :en,
        }
      ]
    },
    # giá ở vùng entry dự tính
    {
      name: 'trend giá ở vùng entry dự tính',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      section: :trend,
      translations_attributes: [
        {
          title: 'Giá đang ở đúng vùng entry',
          content: 'Gía vào lệnh đúng vùng entry đã xác định',
          locale: :vi,
        },
        {
          title: 'Giá đang ở đúng vùng entry',
          content: 'Gía vào lệnh đúng vùng entry đã xác định',
          locale: :en,
        }
      ]
    },
    # giá không bị cản bỏi kháng cự mạnh
    {
      name: 'trend giá không bị cản bỏi kháng cự mạnh',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      section: :trend,
      translations_attributes: [
        {
          title: 'Giá không nằm dưới kháng cự mạnh',
          content: 'Xét đa khung thời gian, giá không bị cảng bởi một vùng kháng cự mạnh ở trên',
          locale: :vi,
        },
        {
          title: 'Giá không nằm dưới kháng cự mạnh',
          content: 'Xét đa khung thời gian, giá không bị cảng bởi một vùng kháng cự mạnh ở trên',
          locale: :en,
        }
      ]
    },

    # entry - form RSI - giao cắt 2 đường trung bình Baseline - Có stoploss rõ ràng - ROI > 2xSL - xác nhận đóng nến khi vào lệnh - giá ở vùng entry dự tính
    # form RSI
    {
      name: 'entry form RSI',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :entry,
      translations_attributes: [
        {
          title: 'Sóng tạo đúng form RSI',
          content: 'Các mô hình chuẩn của RSI được tạo bởi chỉ báo',
          locale: :vi,
        },
        {
          locale: :en,
          title: 'Sóng tạo đúng form RSI',
          content: 'Các mô hình chuẩn của RSI được tạo bởi chỉ báo',
        }
      ]
    },
    # giao cắt 2 đường trung bình Baseline
    {
      name: 'entry giao cắt 2 đường trung bình Baseline',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :entry,
      translations_attributes: [
        {
          title: 'Giao cắt 2 đường trung bình Baseline',
          content: 'Điểm vào lệnh ở điểm giao cắt 2 đường trung bình Baseline',
          locale: :vi,
        },
        {
          locale: :en,
          title: 'Giao cắt 2 đường trung bình Baseline',
          content: 'Điểm vào lệnh ở điểm giao cắt 2 đường trung bình Baseline',
        }
      ]
    },
    # Có stoploss rõ ràng
    {
      name: 'entry có stoploss rõ ràng',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      section: :entry,
      translations_attributes: [
        {
          title: 'Vào lệnh có stoploss an toàn',
          content: 'Điểm Stoploss dưới vùng giá có hổ trợ tốt',
          locale: :vi,
        },
        {
          title: 'Vào lệnh có stoploss an toàn',
          content: 'Điểm Stoploss dưới vùng giá có hổ trợ tốt',
          locale: :en,
        }
      ]
    },
    # ROI > 2xSL
    {
      name: 'entry ROI > 2xSL',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      section: :entry,
      translations_attributes: [
        {
          title: 'Tỉ lệ lãi ROI lệnh cao hơn X2 Stoploss',
          content: 'Tỉ lệ thắng lệnh cao hơn X2 so với tỉ lệ stoploss',
          locale: :vi,
        },
        {
          title: 'Tỉ lệ lãi ROI lệnh cao hơn X2 Stoploss',
          content: 'Tỉ lệ thắng lệnh cao hơn X2 so với tỉ lệ stoploss',
          locale: :en,
        }
      ]
    },
    # xác nhận đóng nến khi vào lệnh
    {
      name: 'entry xác nhận đóng nến khi vào lệnh',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      section: :entry,
      translations_attributes: [
        {
          title: 'Xác nhận đóng nến ở khung thời gian vào lệnh',
          content: 'Chỉ vào lệnh khi đóng nến để xác nhận thị trường đi theo đúng nhận định',
          locale: :vi,
        },
        {
          title: 'Xác nhận đóng nến ở khung thời gian vào lệnh',
          content: 'Chỉ vào lệnh khi đóng nến để xác nhận thị trường đi theo đúng nhận định',
          locale: :en,
        }
      ]
    },
    

    # 3 - ==== Mental: bình thường - hương phấn - lo lắng - thiếu tập trung - không tĩnh táo  ======
    # bình thường
    {
      name: 'mental bình thường',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :mental,
      translations_attributes: [
        {
          title: 'Trạng thái tâm lý bình thường',
          content: 'Tâm lý ở trạng thái bình thường',
          locale: :vi,
        },
        {
          title: 'Trạng thái tâm lý bình thường',
          content: 'Tâm lý ở trạng thái bình thường',
          locale: :en,
        }
      ]
    },
    # hương phấn
    {
      name: 'mental hương phấn',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :mental,
      translations_attributes: [
        {
          title: 'Tâm trạng hưng phấn sau TP',
          content: 'Tâm trạng quá hương phấn sau khi vừa mới chốt lãi hoặc thị trường đang rất FOMO',
          locale: :vi,
        },
        {
          title: 'Tâm trạng hưng phấn sau TP',
          content: 'Tâm trạng quá hương phấn sau khi vừa mới chốt lãi hoặc thị trường đang rất FOMO',
          locale: :en,
        }
      ]
    },
    # lo lắng
    {
      name: 'mental lo lắng',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :mental,
      translations_attributes: [
        {
          title: 'Tâm trạng lo lắng sau stoploss',
          content: 'Không quá 3 lệnh bị stoploss trong ngày
          ',
          locale: :vi,
        },
        {
          title: 'Tâm trạng lo lắng sau stoploss',
          content: 'Không quá 3 lệnh bị stoploss trong ngày',
          locale: :en,
        }
      ]
    },
    # không tĩnh táo
    {
      name: 'mental thiếu tập trung',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :mental,
      translations_attributes: [
        {
          title: 'Vào lệnh lúc trong người thiếu tập trung',
          content: 'Phải vào lệnh lúc đầu óc hoàn toàn tĩnh táo có thể do rượu bia hay mất ngủ',
          locale: :vi,
        },
        {
          title: 'Vào lệnh lúc trong người thiếu tập trung',
          content: 'Phải vào lệnh lúc đầu óc hoàn toàn tĩnh táo có thể do rượu bia hay mất ngủ',
          locale: :en,
        }
      ]
    },
    
    # 4- === Market: sideway -  uptrend - take profit - downtrend ===== 
    # sideway
    {
      name: 'market sideway',
      defined_by: :system,
      action_type: :create_new,
      order_type: :trading,
      is_required: false,
      section: :market,
      translations_attributes: [
        {
          title: 'Giá đang ở vùng tích luỹ',
          content: 'Không được vào lệnh khi giá đang ở vùng phân phối chốt lời của cá mập',
          locale: :vi,
        },
        {
          title: 'Giá đang ở vùng tích luỹ',
          content: 'Không được vào lệnh khi giá đang ở vùng phân phối chốt lời của cá mập',
          locale: :en,
        }
      ]
    },
    # uptrend
    {
      name: 'market uptrend',
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      order_type: :trading,
      section: :market,
      translations_attributes: [
        {
          title: 'Giá đang ở vùng tăng trưởng',
          content: 'Xét đa khung thời gian, xem giá đang ở vùng tăng trưởng để có lợi nhuận cao',
          locale: :vi,
        },
        {
          title: 'Giá đang ở vùng tăng trưởng',
          content: 'Xét đa khung thời gian, xem giá đang ở vùng tăng trưởng để có lợi nhuận cao',
          locale: :en,
        }
      ]
    },
    # take profit
    {
      name: 'market take profit',
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      order_type: :trading,
      section: :market,
      translations_attributes: [
        {
          title: 'Giá đang ở vùng chốt lãi',
          content: 'Xét đa khung thời gian, xem giá đang ở vùng chốt lãi để tránh vào lệnh khả năng bị stoploss cao',
          locale: :vi,
        },
        {
          title: 'Giá đang ở vùng chốt lãi',
          content: 'Xét đa khung thời gian, xem giá đang ở vùng chốt lãi để tránh vào lệnh khả năng bị stoploss cao',
          locale: :en,
        }
      ]
    },
    # downtrend
    {
      name: 'market downtrend',
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      order_type: :trading,
      section: :market,
      translations_attributes: [
        {
          title: 'Giá đang ở vùng giảm Downtrend',
          content: 'Xét đa khung thời gian, xem giá đang ở vùng giảm Downtrend để không vào lệnh LONG',
          locale: :vi,
        },
        {
          title: 'Giá đang ở vùng giảm Downtrend',
          content: 'Xét đa khung thời gian, xem giá đang ở vùng giảm Downtrend để không vào lệnh LONG',
          locale: :en,
        }
      ]
    },
  ]


  trading_criterions.each do |trading_criterion|
    Criterion.create(trading_criterion)
  end
end
