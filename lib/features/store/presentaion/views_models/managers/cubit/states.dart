abstract class StoreStates{}
class StoreInitialState extends StoreStates{}


///database
class StoreCreateDatabaseState extends StoreStates{}
class StoreInsertDatabaseState extends StoreStates{}
class StoreGetDatabaseLoadingState extends StoreStates{}
class StoreGetDatabaseState extends StoreStates{}
class StoreUpdateDatabaseState extends StoreStates{}
class StoreDeleteDatabaseState extends StoreStates{}
///database







///Qr_code
class controllerQrCodeState extends StoreStates{}
class scaneQrCodeState extends StoreStates{}

///Qr_code






///searchProduct
class searchProductCountState extends StoreStates{}
class searchStoreViewstate extends StoreStates{}
class ImagePickerstate extends StoreStates{}
///searchProduct






///takeImageGellary
class takeImageGellaryState extends StoreStates{}
class takeImageCameraState extends StoreStates{}
///takeImageGellary








///api
class GetProductTreeLoadingState extends StoreStates{}
class GetProductTreeSuccessState extends StoreStates{}
class GetProductTreeErrorState extends StoreStates{}


///api

