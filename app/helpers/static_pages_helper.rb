module StaticPagesHelper
  FEATURES_DATA = [
    { img: "features/1.png", title: "100% Secured data"},
    { img: "features/2.png", title: "1 Million+ users"},
    { img: "features/3.png", title: "100K+ 5-star Reviews"},
    { img: "features/4.png", title: "App of the day"}
  ]

  FEATRURE_CARDS = [
    { img: "cards/1.png", title: "Multiple devices" , text: "Safely synchronize across devices with Bank standard security." },
    { img: "cards/2.png", title: "Recurring transaction" , text: "Get notified of recurring bills and transactions before due date" },
    { img: "cards/3.png", title: "Travel mode" , text: "All currencies supported with up-to-date exchange rate." },
    { img: "cards/4.png", title: "Saving plan" , text: "Keep track on savings process to meet your financial goals." },
    { img: "cards/5.png", title: "Debt and loan" , text: "Manage your debts, loans and payment process in one place." },
    { img: "cards/6.png", title: "Scan receipt" , text: "Take pictures of your receipts to auto-process and organize them." }
  ]

  def dump_data
    FEATURES_DATA
  end

  def card_data
    FEATRURE_CARDS
  end
end
