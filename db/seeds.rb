data = [
  {
    name: 'Vespa Elegante',
    description: 'An elegant vespa for the young at heart',
    imageUrl: 'https://www.pngfind.com/pngs/m/687-6871175_vespa-elegante-hd-png-download.png'
  },
  {
    name: 'Vespa Gts 300 Ie Abs',
    description: 'Navigate through the rocky terrain with style',
    imageUrl: 'https://www.vhv.rs/dpng/d/315-3153674_gtv-300-i-vespa-gts-300-ie-abs.png'
  },
  {
    name: 'Vespa 946 Malaysia',
    description: 'Malaysians love it, simple, elegant, reliable',
    imageUrl: 'https://www.pngfind.com/pngs/m/187-1875767_scooter-vespa-946-malaysia-price-hd-png-download.png'
  },
  {
    name: 'Vespa Gts 300 2018',
    description: 'The Vespa Gts 300 2018 combines speed and fuel efficiency for a penny',
    imageUrl: 'https://www.vhv.rs/dpng/d/87-875820_vespa-gts-300-2018-hd-png-download.png'
  },
  {
    name: 'Vespa S 125 Orange',
    description: 'Perfect for a cool evening with the one you love',
    imageUrl: 'https://www.pngfind.com/pngs/m/428-4286831_vespa-s-vespa-s-125-orange-hd-png.png'
  }
]

data.each do |el|
  Automobile.create(name: el[:name], description: el[:description], imageUrl: el[:imageUrl])
end