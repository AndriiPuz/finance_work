module StaticPagesHelper
  FEATURES_DATA = [
    { img: "features/1.png", title: "100% Secured data"},
    { img: "features/2.png", title: "1 Million+ users"},
    { img: "features/3.png", title: "100K+ 5-star Reviews"},
    { img: "features/4.png", title: "App of the day"}
  ]

  def dump_data
    FEATURES_DATA
  end
end
