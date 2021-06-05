import 'package:alan/alan.dart';
import 'package:d_email_flutter_client/data/core/base.dart';
import 'package:d_email_flutter_client/proto/cosmos/address/tx.pb.dart';
import 'package:d_email_flutter_client/proto/cosmos/address/query.pbgrpc.dart';

import 'model.dart';

class DEmailAddressProvider extends BaseDEmailProvider {
  QueryClient? queryClient;

  DEmailAddressProvider(NetworkInfo demailNetworkInfo)
      : super(demailNetworkInfo) {
    this.queryClient = QueryClient(this.demailNetworkInfo.gRPCChannel);
  }

  Future<Address> createAddress(
      String mnemonic, String name, String pubKey) async {
    Wallet wallet = generateWallet(mnemonic);

    final message = MsgCreateAddress.create()
      ..creator = wallet.bech32Address
      ..name = name
      ..pubKey = pubKey;

    int trackID = 1;

    try {
      final response = await sendTransaction(wallet, message, true);

      if (response.isSuccessful) {
        trackID = getTrackIDFromCreateResponse(response);
      } else {
        throw Exception("Cannot generate address");
      }
    } catch (e) {
      throw e;
    }

    if (trackID == -1) {
      throw Exception("Cannot find trackID");
    }

    return Address(name, pubKey, trackID, 1);
  }

  Future<List<Address>> getAddresses(List<String> names) async {
    List<Address> result = [];

    for (int i = 0; i < names.length; i++) {
      final address = await getAddress(names[i]);
      result.add(address);
    }

    return result;
  }

  Future<Address> getAddress(String name) async {
    final response = await this
        .queryClient!
        .addressByName(QueryGetAddressByNameRequest(name: name));

    return Address(response.address.name, response.address.pubKey,
        response.address.trackID.toInt(), response.address.version.toInt());
  }

  int getTrackIDFromCreateResponse(TxResponse response) {
    int trackID = -1;

    response.logs.forEach((element) => {
          element.events.forEach((event) => {
                if (event.type == 'address')
                  {
                    event.attributes.forEach((attribute) {
                      if (attribute.key == 'trackID') {
                        trackID = int.parse(attribute.value);
                      }
                    })
                  }
              })
        });

    return trackID;
  }
}
