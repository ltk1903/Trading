# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create trade_criterions default
load File.join(Rails.root, 'db', 'require_data', 'new_trade_criterion.rb')






# trading_criterions = [
#   {
#     name: 'correct trend flow',
#     title: 'Đồng thuận các khung thời gian',
#     content: 'Sóng đồng thuận ở các khung thời gian H1 H2 H4 H12 1D 4D 1W',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: true,
#   },
#   {
#     name: 'curent market status',
#     title: 'Thị trường đang có xu hướng rõ ràng (20-20-60)',
#     content: "Trường 20% rõ xu hướng, 20% xu hướng không rõ ràng, 60% không có xu hướng",
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: true,
#   },
#   {
#     name: 'curent market flow',
#     title: 'Giá đi theo đúng với xu hướng sóng chính',
#     content: 'Trường 10% tăng, 10% giảm, 80% Sideway',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: true,
#   },
#   {
#     name: 'have stoploss point',
#     title: 'Có điểm Stoploss rõ ràng',
#     content: 'Chỉ vào lệnh khi điểm vào lệnh có xác định được điểm Stoploss rõ ràng, điểm giao cắt hai đường trung bình MA',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: true,
#   },
#   {
#     name: '2 Baseline commit',
#     title: 'Giá trên điểm giao cắt 2 đường trung bình',
#     content: 'Điểm vào lệnh ở trên điểm giao cắt 2 đường trung bình để có điểm hổ trợ tốt',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: true,
#   },
#   {
#     name: 'win percentage',
#     title: 'Tỉ lệ thắng lệnh > 80%',
#     content: 'Tỉ lệ thắng lệnh phải trên 80%, mức rủi ro cao thì không nên vào lệnh',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: false,
#   },
  
#   {
#     name: 'follow BTC flow',
#     title: 'Vào lệnh Atlcoin cùng xu hướng với BTC',
#     content: 'Luôn luôn giao dịch Altcoin theo xu hướng sóng của BTC',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: true,
#   },

#   {
#     name: 'personal feeling',
#     title: 'Tâm trạng lúc vào lệnh không quá hưng phấn hoặc vừa TP hay SL',
#     content: 'Phải để tâm trạng ở trạng thái rất bình tĩnh mới được vào lệnh',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: true,
#   },
#   {
#     name: 'personal status',
#     title: 'Vào lệnh lúc trong người không có Rượu hoặc Bia',
#     content: 'Phải vào lệnh lúc đầu óc hoàn toàn tĩnh táo',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: true,
#   },
#   {
#     name: 'sleeping loss',
#     title: 'Không vào lệnh sau một đêm dài mất ngủ',
#     content: 'Chỉ vào lệnh khi tinh thần hoàn toàn tĩnh táo',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: true,
#   },
#   {
#     name: 'Over limit',
#     title: 'Không vượt quá 3 lệnh Future và 5 lệnh Spot trong cùng thời điểm',
#     content: 'Để kiểm soát và quản lý lệnh giao dịch tốt thì không nên vào quá nhiều lệnh trong cùng thời điểm',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: true,
#   },
#   {
#     name: 'ro percentage',
#     title: 'Tỉ lệ lãi RO trên lệnh có cao hơn X2 Stoploss',
#     content: 'Tỉ lệ lãi trên lệnh phải cao hơn tỉ lệnh stoploss từ 2 lần trở lên thì mới nên vào lệnh',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: false,
#   },
#   {
#     name: 'create new futrure when finished time frame',
#     title: 'Xác nhận đóng nến ở khung thời gian vào lệnh',
#     content: 'Chỉ vào lệnh khi đóng nến để xác nhận thị trường đi theo đúng nhận định',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: false,
#   },
#   {
#     name: 'correct entry area',
#     title: 'Giá đang ở đúng vùng entry',
#     content: 'Gía vào lệnh đúng vùng entry đã xác định',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new
#   },
#   {
#     name: 'have no resistance point',
#     title: 'Giá không nằm dưới kháng cự mạnh ở các khung thời gian',
#     content: 'Xét đa khung thời gian, giá không bị cảng bởi một vùng kháng cự mạnh ở trên',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: false,
#   },
#   {
#     name: 'shark pum dum',
#     title: 'Giá đang ở vùng tích luỹ',
#     content: 'Không được vào lệnh khi giá đang ở vùng phân phối chốt lời của cá mập',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: false,
#   },

#   {
#     name: 'shark pum dum',
#     title: 'Giá đang ở vùng tăng trưởng',
#     content: 'Xét đa khung thời gian, xem giá đang ở vùng tăng trưởng để có lợi nhuận cao',
#     order_type: :trading,
#     defined_by: :system,
#     action_type: :create_new,
#     is_required: false,
#   },
# ]

