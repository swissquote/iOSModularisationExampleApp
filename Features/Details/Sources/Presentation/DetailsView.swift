import CommonDomain
import SwiftUI

protocol DetailsNavigationDelegate: AnyObject {
    func details(didSelect event: Event)
    func detailsDidTapAddEvent()
}

struct DetailsView: View {
    // Strong reference: the view keeps its coordinator alive.
    let navigationDelegate: DetailsNavigationDelegate
    let viewModel: DetailsViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Color.secondary
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)
                    .overlay {
                        AsyncImage(url: viewModel.city.imageURL) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                            case .empty:
                                ProgressView()
                            default:
                                EmptyView()
                            }
                        }
                    }
                    .clipped()

                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.city.name)
                        .font(.largeTitle.bold())
                    Text("Canton \(viewModel.city.canton)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(20)

                Divider()
                    .padding(.horizontal, 20)

                Text("Events")
                    .font(.title2.bold())
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 12)

                VStack(spacing: 0) {
                    ForEach(viewModel.events) { event in
                        Button {
                            navigationDelegate.details(didSelect: event)
                        } label: {
                            EventRow(event: event)
                        }
                        .buttonStyle(.plain)

                        if event.id != viewModel.events.last?.id {
                            Divider()
                                .padding(.leading, 20)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.city.name)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    navigationDelegate.detailsDidTapAddEvent()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .task {
            await viewModel.load()
        }
    }
}

private struct EventRow: View {
    let event: Event

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(spacing: 2) {
                Text(event.date, format: .dateTime.day())
                    .font(.title2.bold())
                Text(event.date.formatted(.dateTime.month(.abbreviated)).uppercased())
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .frame(width: 44)

            VStack(alignment: .leading, spacing: 4) {
                Text(event.title)
                    .font(.headline)
                Text(event.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
    }
}
