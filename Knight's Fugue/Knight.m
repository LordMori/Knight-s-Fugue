//
//  Knight.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/26/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "Knight.h"

@implementation Knight

- (id)initWithDictionary:(NSDictionary *)knightDict {
    self = [super init];
    if (self) {
        self.name = knightDict[@"name"];
        self.class = knightDict[@"class"];
        self.morality = knightDict[@"morality"];
        self.dexterityLvl = knightDict[@"dexLvl"];
        self.intelligenceLvl = knightDict[@"intLvl"];
        self.strengthLvl = knightDict[@"strLvl"];
        self.healthLvl = knightDict[@"htLvl"];
        self.hitpointsLvl = knightDict[@"hpLvl"];
        self.willpowerLvl = knightDict[@"willLvl"];
        self.perception = knightDict[@"perLvl"];
        self.fatigueLvl = knightDict[@"fatLvl"];
        self.moveLvl = knightDict[@"moveLvl"];
        self.speedLvl = knightDict[@"spdLvl"];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    if(self.name == nil){
        self.name = @"";
    }
    if(self.class == nil){
        self.class = @"";
    }
    if(self.morality == nil){
        self.morality = @"";
    }
    if(self.dexterityLvl == nil){
        self.dexterityLvl = @0;
    }
    if(self.strengthLvl == nil){
        self.strengthLvl = @0;
    }
    if(self.intelligenceLvl == nil){
        self.intelligenceLvl = @0;
    }
    if(self.healthLvl == nil){
        self.healthLvl = @0;
    }
    if(self.hitpointsLvl == nil){
        self.hitpointsLvl = @0;
    }
    if(self.perception== nil){
        self.perception = @0;
    }
    if(self.moveLvl == nil){
        self.moveLvl = @0;
    }
    if(self.speedLvl == nil){
        self.speedLvl = @0;
    }
    if(self.willpowerLvl == nil){
        self.willpowerLvl = @0;
    }
    if(self.fatigueLvl == nil){
        self.fatigueLvl = @0;
    }
    
    return @{
             @"name": self.name,
             @"class": self.class,
             @"morality": self.morality,
             @"dexLvl": self.dexterityLvl,
             @"strLvl": self.strengthLvl,
             @"intLvl": self.intelligenceLvl,
             @"willLvl": self.willpowerLvl,
             @"htLvl": self.healthLvl,
             @"hpLvl": self.hitpointsLvl,
             @"fatLvl": self.fatigueLvl,
             @"perLvl": self.perception,
             @"moveLvl": self.moveLvl,
             @"spdLvl": self.speedLvl,
             };
}

- (void)setRandomName {
    NSArray *randomNames = @[@"Abaet", @"Abarden", @"Aboloft",
                             @"Acamen", @"Achard", @"Ackmard",
                             @"Adeen", @"Aerden", @"Afflon",
                             @"Aghon", @"Agnar", @"Ahalfar",
                             @"Ahburn", @"Ahdun", @"Aidan",
                             @"Airen", @"Airis", @"Albright",
                             @"Aldaren", @"Alderman", @"Aldren",
                             @"Alexander", @"Alkirk", @"Allso",
                             @"Amerdan", @"Amitel", @"Anfar",
                             @"Anumi", @"Anumil", @"Asden",
                             @"Asdern", @"Asen", @"Aslan",
                             @"Atar", @"Atgur", @"Atlin",
                             @"Auchfor", @"Auden", @"Ault",
                             @"Ayrie", @"Aysen",
                        
                             @"Bacohl", @"Badeek", @"Baduk",
                             @"Balati", @"Baradeer", @"Barkydle",
                             @"Basden", @"Bayde", @"Beck",
                             @"Bedic", @"Beeron", @"Bein",
                             @"Beson", @"Besur", @"Besurlde",
                             @"Bewul", @"Biedgar", @"Bildon",
                             @"Bisto", @"Bithon", @"Boal",
                             @"Boaldelr", @"Bolrock", @"Brakdern",
                             @"Breanon", @"Bredere", @"Bredin",
                             @"Bredock", @"Breen", @"Brighton",
                             @"Bristan", @"Buchmeid", @"Bue",
                             @"Busma", @"Buthomar", @"Bydern",
                             
                             @"Caelholdt", @"Cainon", @"Calden",
                             @"Camchak", @"Camilde", @"Cardon",
                             @"Casden", @"Cayold", @"Celbahr",
                             @"Celorn", @"Celthric", @"Cemark",
                             @"Cerdern", @"Cespar", @"Cether",
                             @"Cevelt", @"Chamon", @"Chesmarn",
                             @"Chidak", @"Cibrock", @"Cipyar",
                             @"Ciroc", @"Codern", @"Colthan",
                             @"Connell", @"Cordale", @"Cos",
                             @"Cosdeer", @"Cuparun", @"Cusmirk",
                             @"Cydare", @"Cylmar", @"Cythnar",
                             @"Cyton",
                             
                             @"Daburn", @"Daermod", @"Dak",
                             @"Dakamon", @"Dakkone", @"Dalburn",
                             @"Dalmarn", @"Dapvhir", @"Darkboon",
                             @"Darkkon", @"Darko", @"Darkspur",
                             @"Darmor", @"Darpick", @"Dasbeck",
                             @"Dask", @"Deathmar", @"Defearon",
                             @"Derik", @"Derrin", @"Desil",
                             @"Dessfar", @"Dinfar", @"Dismer",
                             @"Doceon", @"Dochrohan", @"Dokoran",
                             @"Dorn", @"Dosoman", @"Drakoe",
                             @"Drakone", @"Drandon", @"Drit",
                             @"Dritz", @"Drophar", @"Dryden",
                             @"Dryn", @"Duba", @"Dukran",
                             @"Duran", @"Durmark", @"Dusaro",
                             @"Dyfar", @"Dyten",
                             
                             @"Eard", @"Eckard", @"Efamar",
                             @"Efar", @"Egmardern", @"Eiridan",
                             @"Ekgamut", @"Eli", @"Elik",
                             @"Elson", @"Elthin", @"Enbane",
                             @"Endor", @"Enidin", @"Enoon",
                             @"Enro", @"Erikarn", @"Erim",
                             @"Eritai", @"Escariet", @"Espardo",
                             @"Etar", @"Etburn", @"Etdar",
                             @"Ethen", @"Etmere", @"Etran",
                             @"Eythil",
                             
                             @"Faoturk", @"Faowind", @"Fearlock",
                             @"Fenrirr", @"Fetmar", @"Feturn",
                             @"Ficadon", @"Fickfylo", @"Fildon",
                             @"Firedorn", @"Firiro", @"Floran",
                             @"Folmard", @"Fraderk", @"Fronar",
                             @"Fydar", @"Fyn",
                             
                             @"Gafolern", @"Gai", @"Galain",
                             @"Galiron", @"Gametris", @"Gauthus",
                             @"Gemardt", @"Gemedern", @"Gemedes",
                             @"Gerirr", @"Geth", @"Gib",
                             @"Gibolock", @"Gibolt", @"Gith",
                             @"Gom", @"Gosford", @"Gothar",
                             @"Gothikar", @"Gresforn", @"Grimie",
                             @"Gryn", @"Gundir", @"Gustov",
                             @"Guthale", @"Gybol", @"Gybrush",
                             @"Gyin",
                             
                             @"Halmar", @"Harrenhal", @"Hasten",
                             @"Hectar", @"Hecton", @"Heramon",
                             @"Hermenze", @"Hermuck", @"Hezak",
                             @"Hildale", @"Hildar", @"Hileict",
                             @"Hydale", @"Hyten",
                             
                             @"Iarmod", @"Idon", @"Ieli",
                             @"Ieserk", @"Ikar", @"Ilgenar",
                             @"Illilorn", @"Illium", @"Ingel",
                             @"Ipedorn", @"Irefist", @"Ironmark",
                             @"Isen", @"Ithric",
                             
                             @"Jackson", @"Jalil", @"Jamik",
                             @"Janus", @"Jayco", @"Jaython",
                             @"Jesco", @"Jespar", @"Jethil",
                             @"Jex", @"Jib", @"Jibar",
                             @"Jin", @"Juktar", @"Julthor",
                             @"Jun", @"Justal",
                             
                             @"Kafar", @"Kaldar", @"Kellan",
                             @"Keran", @"Kesad", @"Kesmon",
                             @"Kethren", @"Kib", @"Kibidon",
                             @"Kiden", @"Kilbas", @"Kilburn",
                             @"Kildarien", @"Kimdar", @"Kinorn",
                             @"Kip", @"Kirder", @"Kodof",
                             @"Kolmorn", @"Kyrad",
                             
                             @"Lackus", @"Lacspor", @"Laderic",
                             @"Lafornon", @"Lahorn", @"Laracal",
                             @"Ledale", @"Leit", @"Lephar",
                             @"Lephidiles", @"Lerin", @"Lesphares",
                             @"Letor", @"Lidorn", @"Lin",
                             @"Liphanes", @"Loban", @"Lox",
                             @"Ludokrin", @"Luphildern", @"Lupin",
                             @"Lurd",
                             
                             @"Macon", @"Madarlon", @"Mafar",
                             @"Marc", @"Marderdeen", @"Mardin",
                             @"Markard", @"Markdoon", @"Marklin",
                             @"Mashasen", @"Mathar", @"Medarin",
                             @"Medin", @"Mellamo", @"Meowol",
                             @"Merdon", @"Meridan", @"Merkesh",
                             @"Mesah", @"Mes'ard", @"Mesophan",
                             @"Mesoton", @"Mezo", @"Michael",
                             @"Mick", @"Mickal", @"Migorn",
                             @"Milo", @"Miphates", @"Mi'talrythin",
                             @"Mitar", @"Modric", @"Modum",
                             @"Mudon", @"Mufar", @"Mujarin",
                             @"Mylo", @"Mythik", @"Mythil",
                             
                             @"Nadeer", @"Nalfar", @"Namorn",
                             @"Naphates", @"Neowyld", @"Nidale",
                             @"Nikpal", @"Nikrolin", @"Niktohal",
                             @"Niro", @"Noford", @"Nothar",
                             @"Nuthor", @"Nuwolf", @"Nydale",
                             @"Nythil",
                             
                             @"O’tho", @"Ocarin", @"Occelot",
                             @"Occhi", @"Odaren", @"Odeir",
                             @"Ohethlic", @"Okar", @"O'Maniron",
                             @"Omarn", @"Orin", @"Ospar",
                             @"Othelen", @"Oxbaren",
                             
                             @"Padan", @"Palid", @"Papur",
                             @"Peitar", @"Pelphides", @"Pender",
                             @"Pendus", @"Perder", @"Perol",
                             @"Phairdon", @"Phemedes", @"Phexides",
                             @"Phoenix", @"Picon", @"Pictal",
                             @"Picumar", @"Pildoor", @"Pixdale",
                             @"Ponith", @"Poran", @"Poscidion",
                             @"Prothalon", @"Puthor", @"Pyder",
                             
                             @"Qeisan", @"Qidan", @"Quiad",
                             @"Quid", @"Quiss", @"Qupar",
                             @"Qysan",
                             
                             @"Radag'mal", @"Randar", @"Raysdan",
                             @"Rayth", @"Reaper", @"Resboron",
                             @"Reth", @"Rethik", @"Rhithik",
                             @"Rhithin", @"Rhysling", @"Riandur",
                             @"Rikar", @"Rismak", @"Riss",
                             @"Ritic", @"Rogeir", @"Rogist",
                             @"Rogoth", @"Rophan", @"Rulrindale",
                             @"Rydan", @"Ryfar", @"Ryodan",
                             @"Rysdan", @"Rythen", @"Rythern",
                             
                             @"Sabal", @"Sadareen", @"Safilix",
                             @"Samon", @"Samot", @"Sasic",
                             @"Scoth", @"Scythe", @"Secor",
                             @"Sed", @"Sedar", @"Senick",
                             @"Senthyril", @"Serin", @"Sermak",
                             @"Seryth", @"Sesmidat", @"Seth",
                             @"Setlo", @"Shade", @"Shadowbane",
                             @"Shane", @"Shard", @"Shardo",
                             @"Shillen", @"Silco", @"Sildo",
                             @"Sil'forrin", @"Silpal", @"Sithik",
                             @"Soderman", @"Sothale", @"Staph",
                             @"Stenwulf", @"Steven", @"Suktor",
                             @"Suth", @"Sutlin", @"Syr",
                             @"Syth",	@"Sythril",
                             
                             @"Talberon", @"Telpur", @"Temil",
                             @"Temilfist", @"Tempist", @"Teslanar",
                             @"Tespar", @"Tessino", @"Tethran",
                             @"Thiltran", @"Tholan", @"Tibers",
                             @"Tibolt", @"Ticharol", @"Tilner",
                             @"Tithan", @"Tobale", @"Tol’Solie",
                             @"Tolle", @"Tolsar", @"Toma",
                             @"Tothale", @"Tousba", @"Towerlock",
                             @"Tuk", @"Tuscanar", @"Tusdar",
                             @"Tyden",
                             
                             @"Uerthe", @"Ugmar", @"Uhrd",
                             @"Undin", @"Updar", @"Uther",
                             
                             @"Vaccon", @"Vacone", @"Valkeri",
                             @"Valynard", @"Vectomon", @"Veldahar",
                             @"Vespar", @"Vethelot", @"Victor",
                             @"Vider", @"Vigoth", @"Vilan",
                             @"Vildar", @"Vinald", @"Vinkolt",
                             @"Virde", @"Voltain", @"Volux",
                             @"Voudim", @"Vythethi",
                             
                             @"Wak’dern", @"Walkar", @"Wanar",
                             @"Wekmar", @"Werymn", @"Weshin",
                             @"William", @"Willican", @"Wilte",
                             @"Wiltmar", @"Wishane", @"Witfar",
                             @"Wrathran", @"Wraythe", @"Wuthmon",
                             @"Wyder", @"Wyeth", @"Wyvorn",
                             
                             @"Xander", @"Xavier", @"Xenil",
                             @"Xex", @"Xithyl", @"Xuio",
                             
                             @"Y’reth", @"Yabaro", @"Yepal",
                             @"Yesirn", @"Yssik", @"Yssith",
                             
                             @"Zak", @"Zakarn", @"Zecane",
                             @"Zeke", @"Zerin", @"Zessfar",
                             @"Zidar", @"Zigmal", @"Zile",
                             @"Zilocke", @"Zio", @"Zoru",
                             @"Zotar", @"Zutar", @"Zyten"];
    
    int nameIndex = arc4random_uniform((int)[randomNames count]);
    
    self.name = [randomNames objectAtIndex:nameIndex];
}

@end
