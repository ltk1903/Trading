unless Criterion.exists?
  trading_criterions = [
    {
      name: 'correct trend flow',
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
    {
      name: 'curent market status',
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
    {
      name: 'curent market flow',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :trend,
      translations_attributes: [
        {
          title: 'Giá đi theo đúng với xu hướng sóng chính',
          content: 'Trường 10% tăng, 10% giảm, 80% Sideway',
          locale: :vi,
        },
        {
          locale: :en,
          title: 'Giá đi theo đúng với xu hướng sóng chính',
          content: 'Trường 10% tăng, 10% giảm, 80% Sideway',
        }
      ]
    },
    {
      name: 'have stoploss point',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :entry,
      translations_attributes: [
        {
          title: 'Có điểm Stoploss rõ ràng',
          content: 'Chỉ vào lệnh khi điểm vào lệnh có xác định được điểm Stoploss rõ ràng, điểm giao cắt hai đường trung bình MA',
          locale: :vi,
        },
        {
          locale: :en,
          title: 'Có điểm Stoploss rõ ràng',
          content: 'Chỉ vào lệnh khi điểm vào lệnh có xác định được điểm Stoploss rõ ràng, điểm giao cắt hai đường trung bình MA',
        }
      ]
    },
    {
      name: '2 Baseline commit',
      title: 'Giá trên điểm giao cắt 2 đường trung bình',
      content: 'Điểm vào lệnh ở trên điểm giao cắt 2 đường trung bình để có điểm hổ trợ tốt',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :entry,
      translations_attributes: [
        {
          locale: :vi,
        },
        {
          locale: :en,
        }
      ]
    },
    {
      name: 'win percentage',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      section: :entry,
      translations_attributes: [
        {
          title: 'Tỉ lệ thắng lệnh > 80%',
          content: 'Tỉ lệ thắng lệnh phải trên 80%, mức rủi ro cao thì không nên vào lệnh',
          locale: :vi,
        },
        {
          title: 'Tỉ lệ thắng lệnh > 80%',
          content: 'Tỉ lệ thắng lệnh phải trên 80%, mức rủi ro cao thì không nên vào lệnh',
          locale: :en,
        }
      ]
    },
    
    {
      name: 'follow BTC flow',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :entry,
      translations_attributes: [
        {
          title: 'Vào lệnh Atlcoin cùng xu hướng với BTC',
          content: 'Luôn luôn giao dịch Altcoin theo xu hướng sóng của BTC',
          locale: :vi,
        },
        {
          title: 'Vào lệnh Atlcoin cùng xu hướng với BTC',
          content: 'Luôn luôn giao dịch Altcoin theo xu hướng sóng của BTC',
          locale: :en,
        }
      ]
    },

    {
      name: 'personal feeling',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :mental,
      translations_attributes: [
        {
          title: 'Tâm trạng lúc vào lệnh không quá hưng phấn hoặc vừa TP hay SL',
          content: 'Phải để tâm trạng ở trạng thái rất bình tĩnh mới được vào lệnh',
          locale: :vi,
        },
        {
          title: 'Tâm trạng lúc vào lệnh không quá hưng phấn hoặc vừa TP hay SL',
          content: 'Phải để tâm trạng ở trạng thái rất bình tĩnh mới được vào lệnh',
          locale: :en,
        }
      ]
    },
    {
      name: 'personal status',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :mental,
      translations_attributes: [
        {
          title: 'Vào lệnh lúc trong người không có Rượu hoặc Bia',
          content: 'Phải vào lệnh lúc đầu óc hoàn toàn tĩnh táo',
          locale: :vi,
        },
        {
          title: 'Vào lệnh lúc trong người không có Rượu hoặc Bia',
          content: 'Phải vào lệnh lúc đầu óc hoàn toàn tĩnh táo',
          locale: :en,
        }
      ]
    },
    {
      name: 'sleeping loss',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :mental,
      translations_attributes: [
        {
          title: 'Không vào lệnh sau một đêm dài mất ngủ',
          content: 'Chỉ vào lệnh khi tinh thần hoàn toàn tĩnh táo',
          locale: :vi,
        },
        {
          title: 'Không vào lệnh sau một đêm dài mất ngủ',
          content: 'Chỉ vào lệnh khi tinh thần hoàn toàn tĩnh táo',
          locale: :en,
        }
      ]
    },
    {
      name: 'Over limit',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: true,
      section: :mental,
      translations_attributes: [
        {
          title: 'Không vượt quá 3 lệnh Future và 5 lệnh Spot trong cùng thời điểm',
          content: 'Để kiểm soát và quản lý lệnh giao dịch tốt thì không nên vào quá nhiều lệnh trong cùng thời điểm',
          locale: :vi,
        },
        {
          title: 'Không vượt quá 3 lệnh Future và 5 lệnh Spot trong cùng thời điểm',
          content: 'Để kiểm soát và quản lý lệnh giao dịch tốt thì không nên vào quá nhiều lệnh trong cùng thời điểm',
          locale: :en,
        }
      ]
    },
    {
      name: 'ro percentage',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      section: :entry,
      translations_attributes: [
        {
          title: 'Tỉ lệ lãi RO trên lệnh có cao hơn X2 Stoploss',
          content: 'Tỉ lệ lãi trên lệnh phải cao hơn tỉ lệnh stoploss từ 2 lần trở lên thì mới nên vào lệnh',
          locale: :vi,
        },
        {
          title: 'Tỉ lệ lãi RO trên lệnh có cao hơn X2 Stoploss',
          content: 'Tỉ lệ lãi trên lệnh phải cao hơn tỉ lệnh stoploss từ 2 lần trở lên thì mới nên vào lệnh',
          locale: :en,
        }
      ]
    },
    {
      name: 'create new futrure when finished time frame',
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
    {
      name: 'correct entry area',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      section: :entry,
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
    {
      name: 'have no resistance point',
      order_type: :trading,
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      section: :entry,
      translations_attributes: [
        {
          title: 'Giá không nằm dưới kháng cự mạnh ở các khung thời gian',
          content: 'Xét đa khung thời gian, giá không bị cảng bởi một vùng kháng cự mạnh ở trên',
          locale: :vi,
        },
        {
          title: 'Giá không nằm dưới kháng cự mạnh ở các khung thời gian',
          content: 'Xét đa khung thời gian, giá không bị cảng bởi một vùng kháng cự mạnh ở trên',
          locale: :en,
        }
      ]
    },
    {
      name: 'shark pum dum',
      defined_by: :system,
      action_type: :create_new,
      order_type: :trading,
      is_required: false,
      section: :market_info,
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

    {
      name: 'shark pum dum',
      defined_by: :system,
      action_type: :create_new,
      is_required: false,
      order_type: :trading,
      section: :market_info,
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
  ]


  trading_criterions.each do |trading_criterion|
    Criterion.create(trading_criterion)
  end
end
