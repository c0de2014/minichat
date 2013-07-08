//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include "main.h"
#include <iostream.h>
#include <string>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

bool server=false;

TForm1 *Form1;
//---------------------------------------------------------------------------

__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
 Panel1->Visible=false;
 Panel2->Visible=true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::verbindeClick(TObject *Sender)
{
 if (Name->Text!="")
 {
  server=false;
  Label4->Visible=true;
  Panel2->Visible=false;
  ClientSocket1->Address=IP->Text;
  ClientSocket1->Port=StrToInt(PORT->Text);
  ClientSocket1->Active=true;
 }
 else ShowMessage("Namen eingeben!");
}
//---------------------------------------------------------------------------

void __fastcall TForm1::serveClick(TObject *Sender)
{
 if (Name->Text!="")
 {
  server=true;
  Label3->Visible=true;
  Panel2->Visible=false;
  ServerSocket1->Port=StrToInt(PORT->Text);
  ServerSocket1->Active=true;
 }
 else ShowMessage("Namen eingeben!");
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ClientSocket1Error(TObject *Sender,
      TCustomWinSocket *Socket, TErrorEvent ErrorEvent, int &ErrorCode)
{
 Form1->Panel2->Visible=true;
 Form1->Panel1->Visible=false;
 Label4->Visible=false;
 //Exception abfangen
 ErrorCode = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ServerSocket1ClientError(TObject *Sender,
      TCustomWinSocket *Socket, TErrorEvent ErrorEvent, int &ErrorCode)
{
 //Exception abfangen
 ErrorCode = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ServerSocket1ClientRead(TObject *Sender,
      TCustomWinSocket *Socket)
{
 int i=0,count=0;
 String daten;
 daten=Socket->ReceiveText();
 ausgabe->Lines->Add(daten);
 count=ServerSocket1->Socket->ActiveConnections;
 for (i=0;i<count;i++)
 {
  ServerSocket1->Socket->Connections[i]->SendText(daten);
 }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ClientSocket1Read(TObject *Sender,
      TCustomWinSocket *Socket)
{
 ausgabe->Lines->Add(Socket->ReceiveText());
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sendClick(TObject *Sender)
{
 int i=0,count=0;
 if (eingabe->Text!="")
 {
  if (server)
  {
   ausgabe->Lines->Add(Name->Text + ": " + eingabe->Text);
   count=ServerSocket1->Socket->ActiveConnections;
   for (i=0;i<count;i++)
   {
    ServerSocket1->Socket->Connections[i]->SendText(Name->Text + ": " + eingabe->Text);
   }
  }
  else
   ClientSocket1->Socket->SendText(Name->Text +": " + eingabe->Text);
  eingabe->Text="";
  FocusControl(eingabe);
 }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::eingabeKeyPress(TObject *Sender, char &Key)
{
 int i=0,count=0;
 if ((Key==VK_RETURN)&&(eingabe->Text!=""))
 {
  if (server)
  {
   ausgabe->Lines->Add(Name->Text + ": " + eingabe->Text);
   count=ServerSocket1->Socket->ActiveConnections;
   for (i=0;i<count;i++)
   {
    ServerSocket1->Socket->Connections[i]->SendText(Name->Text + ": " + eingabe->Text);
   }
  }
  else
   ClientSocket1->Socket->SendText(Name->Text + ": " + eingabe->Text);
  eingabe->Text="";
 }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ServerSocket1Accept(TObject *Sender,
      TCustomWinSocket *Socket)
{
 Label3->Visible=false;
 Panel1->Visible=true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ClientSocket1Connect(TObject *Sender,
      TCustomWinSocket *Socket)
{
 ClientSocket1->Socket->SendText(Name->Text +" connected");
 Panel1->Visible=true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ClientSocket1Disconnect(TObject *Sender,
      TCustomWinSocket *Socket)
{
 ausgabe->Lines->Add("Verbindung zum Server abgebrochen..");
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
 ClientSocket1->Socket->SendText(Name->Text +" disconnected");
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NameChange(TObject *Sender)
{
 Form1->Caption="Chat [" + Name->Text +"]";
}
//---------------------------------------------------------------------------


