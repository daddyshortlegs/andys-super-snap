protocol GameStatusPresenter {
    func displayStatus(message: String)
    func updateCurrentCardView(drawnCard: String?)
    func updatePreviousCardView(drawnCard: String?)
}
