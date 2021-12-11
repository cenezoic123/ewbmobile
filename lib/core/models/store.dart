class Store {
  String storeNumber = 'ABC Bridal Shop';
  String ticketNo = 'TK-20-32-245';

  Store({required this.storeNumber, required this.ticketNo});

  Store.initial()
      :storeNumber = '',
        ticketNo = '';
}
