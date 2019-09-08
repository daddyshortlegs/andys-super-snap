protocol GameStatusPresenter {
    func displayStatus(message: String)
    func updateCurrentCardView(drawnCard: String?)
    func updatePreviousCardView(drawCard: String?)
}
