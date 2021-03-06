program TokoBajuDotCom;

{KAMUS}
{Tipe Bentukan}
type
	StokBaju = record
		NamaBaju 			: string;
		KategoriBaju 		: string;
		GenderPemakai 		: string;
		WarnaBaju			: string;
		BeratPerBajuKg		: real;
		BahanBaju			: string;
		Harga				: integer;
		KetersediaanUkuranS	: integer;
		KetersediaanUkuranM	: integer;
		KetersediaanUkuranL	: integer;
		KetersediaanUkuranXL: integer;
		JumlahPembelian		: integer;
		GrosirDiscount		: integer;
	end;
	ekspedisi = record
		NamaEkspedisi 	: string;
		JenisLayanan 	: string;
		NamaKota 		: string;
		BiayaKirimPerKg : string;
	end;
	cart = record
		NamaBaju 		: string;
		WarnaBaju 		: string;
		BeratPerBajuKg	: string;
		BahanBaju 		: string;
		Harga 			: string;
		JumlahBeliS 	: integer;
		JumlahBeliM		: integer;
		JumlahBeliL		: integer;
		JumlahBeliXL	: integer;
	end;
	transaksi = record
		NamaBaju 	: string;
		WarnaBaju	: string;
		BeratPerBajuKg 	: string;
		BahanBaju 	: string;
		Harga 		: string;
		JumlahBeliS 	: integer;
		JumlahBeliM 	: integer;
		JumlahBeliL 	: integer;
		JumlahBeliXL 	: integer;
		NamaEkspedisi 	: string;
		JenisLayanan 	: string;
		NamaKotaTujuan 	: string;
		BiayaKirimPerKg : string;
		LamaPengiriman 	: string;
		TanggalKirim 	: string;
	end;
	fStokBaju 	= file of StokBaju;
	fCart 		= file of Cart;
	fTransaksi 	= file of transaksi;

{Deklarasi Tipe Variabel}
var
	fileStokBaju 	: fStokBaju;
	fileCart	 	: fCart;
	fileTransaksi	: fTransaksi;
	arrStokBaju	 	: array [0..99] of StokBaju;
	arrCart 		: array [0..99] of cart;
	arrTransaksi 	: array [0..99] of transaksi;
	arrEkspedisi	: array [0..99] of ekspedisi;
	NeffSB, NeffTr, 
	NeffC 			: integer;
	pilihan			: integer;
	namabaju		: string;

{Subprogram Utama}
procedure load(var sb : fStokBaju; var arrSB : array of StokBaju; var NSB : integer;
var tr : fTransaksi; var arrTr : array of transaksi; var NTr : integer;
var c : fCart; var arrC : array of cart; var NC : integer);
var
	i : integer;
begin
	assign(sb, 'stokbaju.dat');
	reset(sb);
	i := 0;
	while not(EOF(sb)) do
	begin
		read(sb, arrSB[i]);
		i := i + 1;
		NSB := i;
	end;
	close(sb);
	
	assign(c, 'cart.dat');
	reset(c);
	i := 0;
	while not (EOF(c)) do
	begin
		read(c, arrC[i]);
		i := i + 1;
		NC := i;
	end;
	close(c);
	
	assign(tr, 'transaksi.dat');
	reset(tr);
	i := 0;
	while not (EOF(tr)) do
	begin
		read(tr, arrTr[i]);
		i := i + 1;
		NTr := i;
	end;
	close(tr);
end;

procedure showPopular;
begin

end;

procedure showDetailProduct(nama : string);
begin
	
end;

procedure searchClothesByKeyword;
begin

end;

procedure sortPrice;
begin
end;

procedure filterClothes;
begin
end;

procedure filterByPrice(arrSB : array of StokBaju; NSB : integer);
var
	i : integer;
	termurah, termahal : StokBaju;
begin
	{inisialisasi}
	termurah := arrSB[1];
	termahal := arrSB[1];
	for i := 0 to (NSB - 1) do
	begin
		if arrSB[i].harga < termurah.harga then
		begin
			termurah := arrSB[i];
		end else
		begin
			termahal := arrSB[i];
		end
	end;
	
	writeln('Filter By Price : ');
	writeln('1. Harga Termurah ');
	writeln('2. Harga Termahal ');
	writeln;
	write('Pilihan : '); readln(pilihan);
	
	if pilihan = 1 then
	begin
		showDetailProduct(termurah.namaBaju);
	end else
	begin
		showDetailProduct(termahal.namaBaju);
	end
end;

procedure showExpedition;
begin
end;

procedure addToCart;
begin
	
end;

procedure removeFromCart;
begin
end;

function calculatePrice(arrEkspedisi : array of ekspedisi): integer;
var
	i : integer;
begin
	for i := 1 to NE do
	begin
		if (arrEkspedisi[i].namaEkspedisi = namaEkspedisi) and (arrEkspedisi[i].jenisLayanan = jenisLayanan) then
		begin
			tempEkspedisi := arrEkspedisi[i];
		end
	end;
	for i := 1 to NC do
	begin
		jumlahBeli := arrC[i].jumlahBeliS
	end;
end;

procedure checkout;
begin
end;

procedure showTransaction(arrTr : array of transaksi; NTr : integer);
var
	i : integer;
begin
	for i := 0 to (NTr - 1) do
	begin
		showDetailProduct(arrTr[i].namaBaju);
	end;
end;

procedure retur;
begin
end;

procedure exit(var sb : fStokBaju; var tr : fTransaksi; var c : fCart;
arrSB : array of StokBaju; arrTr : array of transaksi; arrC : array of cart;
NSB : integer; NTr : integer; NC : integer);
var
	i : integer;
begin
	{proses penyimpanan stok baju}
	reset(sb);
	for i := 0 to (NSB - 1) do
	begin
		write(sb, arrSB[i]);
	end;
	close(sb);
	
	{proses penyimpanan transaksi}
	reset(tr);
	for i := 0 to (NTr - 1) do
	begin
		write(tr, arrTr[i]);
	end;
	close(tr);
	
	{proses penyimpanan cart}
	reset(c);
	for i := 0 to (NC - 1) do
	begin
		write(c, arrC[i]);
	end;
	halt;
end;

procedure eksekusiPilihan(choice : integer);
begin
	case choice of
		1 : showPopular;
		2 : showDetailProduct(namaBaju);
		3 : searchClothesByKeyword;
		4 : sortPrice;
		5 : filterClothes;
		6 : filterByPrice(arrStokBaju, NeffSB);
		7 : showExpedition;
		8 : addToCart;
		9 : removeFromCart;
		10: calculatePrice;
		11: checkout;
		12: showTransaction(arrTransaksi, NeffTr);
		13: retur;
		14: exit(fileStokBaju, fileTransaksi, fileCart,
				 arrStokBaju, arrTransaksi, arrCart,
				 NeffSB, NeffTr, NeffC);
	end;
end;

{ALGORITMA UTAMA}
begin
	{Inisialisasi}
	load(fileStokBaju, arrStokBaju, NeffSb, fileTransaksi, arrTransaksi, NeffTr,
	fileCart, arrCart, NeffC);
	readln;
	
	writeln('--------------Welcome to TokoBaju.com!-------------------');
	writeln;
	repeat
		{menampilkan menu pilihan}
		writeln('Menu : ');
		writeln('1. Show Popular');
		writeln('2. Show Detail Product');
		writeln('3. Search Clothes By Keyword');
		writeln('4. Sort Price');
		writeln('5. Filter Clothes');
		writeln('6. Filter By Price');
		writeln('7. Show Expedition');
		writeln('8. Add To Cart');
		writeln('9. Remove From Cart');
		writeln('10.Calculate Price');
		writeln('11.Checkout');
		writeln('12.Show Transaction History');
		writeln('13. Retur');
		writeln('14. Exit');
		writeln;
		{membaca input user}
		write('Pilihan : '); readln(pilihan);
		
		{eksekusi fungsi/prosedur sesuai pilihan user}
		eksekusiPilihan(pilihan);
	until pilihan = 14;
end.
