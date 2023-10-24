extension CDDetailCard: Identifiable {
    func toConvert() -> DetailCardModel {
        DetailCardModel(tempreature: tempreature, image: image ?? "imageError", weatherdescription: discription ?? "descriptionError", location: name ?? "locationError", tempreatureInfo: String(Int(tempreature) - 273).appending("c"))
    }
}
