object F_Customer: TF_Customer
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Scheda Cliente'
  ClientHeight = 521
  ClientWidth = 321
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object L_Notes: TLabel
    Left = 8
    Top = 315
    Width = 27
    Height = 13
    Caption = 'Note:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 168
    Top = 184
    Width = 95
    Height = 13
    Caption = 'Prossima Scadenza:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LE_name: TLabeledEdit
    Left = 8
    Top = 24
    Width = 249
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    EditLabel.Width = 172
    EditLabel.Height = 13
    EditLabel.Caption = 'Ragione Sociale (Cognome / Nome):'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnEnter = FieldEditColor
    OnExit = BindingFieldCheckValue
  end
  object LE_address: TLabeledEdit
    Left = 8
    Top = 72
    Width = 249
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = 'Indirizzo:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnEnter = FieldEditColor
    OnExit = FieldCheckValue
  end
  object LE_address_number: TLabeledEdit
    Left = 263
    Top = 72
    Width = 50
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#176' Civico:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnEnter = FieldEditColor
    OnExit = FieldCheckValue
  end
  object LE_address_city: TLabeledEdit
    Left = 64
    Top = 112
    Width = 193
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    EditLabel.Width = 43
    EditLabel.Height = 13
    EditLabel.Caption = 'Comune:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnEnter = FieldEditColor
    OnExit = FieldCheckUncommonValue
  end
  object LE_address_province: TLabeledEdit
    Left = 263
    Top = 112
    Width = 50
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'Provincia:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnEnter = FieldEditColor
    OnExit = FieldCheckUncommonValue
  end
  object LE_contact_phone: TLabeledEdit
    Left = 8
    Top = 160
    Width = 145
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = 'Numero di Telefono:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnEnter = FieldEditColor
    OnExit = FieldCheckValue
  end
  object LE_contact_fax: TLabeledEdit
    Left = 167
    Top = 160
    Width = 146
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'Numero di Fax:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnEnter = FieldEditColor
    OnExit = FieldCheckValue
  end
  object LE_tax_code: TLabeledEdit
    Left = 8
    Top = 248
    Width = 305
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 133
    EditLabel.Height = 13
    EditLabel.Caption = 'Codice Fiscale / Partita IVA:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnEnter = FieldEditColor
    OnExit = BindingFieldCheckValue
  end
  object LE_iban_code: TLabeledEdit
    Left = 8
    Top = 288
    Width = 305
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 63
    EditLabel.Height = 13
    EditLabel.Caption = 'Codice IBAN:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnEnter = FieldEditColor
    OnExit = FieldCheckValue
  end
  object M_notes: TMemo
    Left = 8
    Top = 331
    Width = 305
    Height = 151
    ScrollBars = ssVertical
    TabOrder = 12
  end
  object LE_id: TLabeledEdit
    Left = 263
    Top = 24
    Width = 50
    Height = 21
    Color = 16777088
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'ID Cliente:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 15
  end
  object BB_Save: TBitBtn
    Left = 8
    Top = 488
    Width = 145
    Height = 25
    Cursor = crHandPoint
    Caption = 'Salva'
    TabOrder = 13
    OnClick = BB_SaveClick
  end
  object BB_Cancel: TBitBtn
    Left = 168
    Top = 488
    Width = 145
    Height = 25
    Cursor = crHandPoint
    Caption = 'Annulla'
    TabOrder = 14
    OnClick = BB_CancelClick
  end
  object LE_address_zip: TLabeledEdit
    Left = 8
    Top = 112
    Width = 50
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'CAP:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnEnter = FieldEditColor
    OnExit = FieldCheckUncommonValue
  end
  object LE_contact_mail: TLabeledEdit
    Left = 8
    Top = 200
    Width = 145
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 71
    EditLabel.Height = 13
    EditLabel.Caption = 'Indirizzo eMail:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnEnter = FieldEditColor
    OnExit = FieldCheckValue
  end
  object DTP_deadline: TDateTimePicker
    Left = 168
    Top = 200
    Width = 145
    Height = 21
    Cursor = crHandPoint
    Date = 41342.515058206020000000
    Time = 41342.515058206020000000
    TabOrder = 9
  end
end
