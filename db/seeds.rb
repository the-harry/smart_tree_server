garden = Garden.create(host: 'regiao_01', latitude: -33.686082, longitude: 32.686082)
Garden.create(host: 'regiao_02', latitude: -33.684756, longitude: 32.986082)
Garden.create(host: 'regiao_03', latitude: -33.643522, longitude: 32.680987)

tree = Tree.create(register: 1, popular_name: 'Copaiba',
                   scientific_name: 'Copaifera langsdorffii Desf',
                   origin: 'Brazil', extra_info: "Essa espécie popularmente "\
                   "conhecida com antibiótico da mata, é muito utilizada na "\
                   "Amazônia com fins medicinais" ,near_age: 98,
                   latitude: -33.684756, longitude: -33.684756,
                   garden_id: garden.id)

prune = Prune.create(prune_type: 'Manutenção', notes: 'Poda efetuada',
                     tree_id: tree.id)
