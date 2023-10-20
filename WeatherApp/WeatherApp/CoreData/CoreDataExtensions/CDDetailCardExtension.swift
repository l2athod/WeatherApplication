extension CDDetailCard: Identifiable {
    func toConvert() -> DetailCardModel {
        DetailCardModel(tempreature: tempreature, image: image!, weatherdescription: discription!, location: name!)
    }
}
