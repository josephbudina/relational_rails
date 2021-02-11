CoffeeRoast.destroy_all
CoffeeCompany.destroy_all

comp1 = CoffeeCompany.create!(name: 'Round Mountain Coffee',
                              address: '2850 Prince St.',
                              zipcode: 72034,
                              local: true)

comp1.coffee_roast.create!(name: 'Pinnacle',
                          origin: 'test',
                          elevation: 1000,
                          fresh: true)
comp1.coffee_roast.create!(name: 'Ouachita',
                          origin: 'test 2',
                          elevation: 2000,
                          fresh: true)

comp2 = CoffeeCompany.create!(name: 'Onyx Coffee Labs',
                              address: '101 E Walnut St.',
                              zipcode: 721414,
                              local: false)

comp2.coffee_roast.create!(name: 'Southern Weather',
                          origin: 'Colombia/Ethiopia',
                          elevation: 1850,
                          fresh: true)
comp2.coffee_roast.create!(name: 'Geometry',
                          origin: 'Colombia/Ethiopia',
                          elevation: 2100,
                          fresh: true)
comp2.coffee_roast.create!(name: 'Monarch',
                          origin: 'Colombia/Ethiopia',
                          elevation: 1800,
                          fresh: false)

comp3 = CoffeeCompany.create!(name: 'Blue Sail Coffee',
                              address: '1028 E Front St.',
                              zipcode: 72034,
                              local: true)
