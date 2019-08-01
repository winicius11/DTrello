object dtrello_demo_principal: Tdtrello_demo_principal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'DTrello Demo - juceliusdevelop@gmaiil.com'
  ClientHeight = 442
  ClientWidth = 1170
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grp_organization: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 225
    Height = 436
    Align = alLeft
    Caption = 'Organizations'
    TabOrder = 0
    object grdpnl_organization: TGridPanel
      Left = 2
      Top = 15
      Width = 221
      Height = 66
      Align = alTop
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = btn_active_org
          Row = 0
        end
        item
          Column = 1
          Control = btn_insert_org
          Row = 0
        end
        item
          Column = 0
          Control = btn_edit_org
          Row = 1
        end
        item
          Column = 1
          Control = btn_delete_org
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 0
      object btn_active_org: TButton
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 108
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Active'
        TabOrder = 0
        OnClick = btn_active_orgClick
      end
      object btn_insert_org: TButton
        AlignWithMargins = True
        Left = 111
        Top = 1
        Width = 109
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Insert'
        TabOrder = 1
        OnClick = btn_insert_orgClick
      end
      object btn_edit_org: TButton
        AlignWithMargins = True
        Left = 1
        Top = 34
        Width = 108
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Edit'
        TabOrder = 2
        OnClick = btn_edit_orgClick
      end
      object btn_delete_org: TButton
        AlignWithMargins = True
        Left = 111
        Top = 34
        Width = 109
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Delete'
        TabOrder = 3
        OnClick = btn_delete_orgClick
      end
    end
    object dbg_organization: TDBGrid
      Left = 2
      Top = 81
      Width = 221
      Height = 353
      Align = alClient
      BorderStyle = bsNone
      DataSource = ds_organization
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object grp_board: TGroupBox
    AlignWithMargins = True
    Left = 234
    Top = 3
    Width = 225
    Height = 436
    Align = alLeft
    Caption = 'Boards'
    TabOrder = 1
    object GridPanel1: TGridPanel
      Left = 2
      Top = 15
      Width = 221
      Height = 66
      Align = alTop
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = btn_active_bor
          Row = 0
        end
        item
          Column = 1
          Control = btn_insert_bor
          Row = 0
        end
        item
          Column = 0
          Control = btn_edit_bor
          Row = 1
        end
        item
          Column = 1
          Control = btn_delete_bor
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 0
      object btn_active_bor: TButton
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 108
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Active'
        TabOrder = 0
        OnClick = btn_active_borClick
      end
      object btn_insert_bor: TButton
        AlignWithMargins = True
        Left = 111
        Top = 1
        Width = 109
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Insert'
        TabOrder = 1
        OnClick = btn_insert_borClick
      end
      object btn_edit_bor: TButton
        AlignWithMargins = True
        Left = 1
        Top = 34
        Width = 108
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Edit'
        TabOrder = 2
        OnClick = btn_edit_borClick
      end
      object btn_delete_bor: TButton
        AlignWithMargins = True
        Left = 111
        Top = 34
        Width = 109
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Delete'
        TabOrder = 3
        OnClick = btn_delete_borClick
      end
    end
    object dbg_boads: TDBGrid
      Left = 2
      Top = 81
      Width = 221
      Height = 353
      Align = alClient
      BorderStyle = bsNone
      DataSource = ds_board
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object grp_list: TGroupBox
    AlignWithMargins = True
    Left = 465
    Top = 3
    Width = 225
    Height = 436
    Align = alLeft
    Caption = 'Lists'
    TabOrder = 2
    object GridPanel2: TGridPanel
      Left = 2
      Top = 15
      Width = 221
      Height = 66
      Align = alTop
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = btn_active_lis
          Row = 0
        end
        item
          Column = 1
          Control = btn_insert_lis
          Row = 0
        end
        item
          Column = 0
          Control = btn_edit_lis
          Row = 1
        end
        item
          Column = 1
          Control = btn_delete_lis
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 0
      object btn_active_lis: TButton
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 108
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Active'
        TabOrder = 0
        OnClick = btn_active_lisClick
      end
      object btn_insert_lis: TButton
        AlignWithMargins = True
        Left = 111
        Top = 1
        Width = 109
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Insert'
        TabOrder = 1
        OnClick = btn_insert_lisClick
      end
      object btn_edit_lis: TButton
        AlignWithMargins = True
        Left = 1
        Top = 34
        Width = 108
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Edit'
        TabOrder = 2
        OnClick = btn_edit_lisClick
      end
      object btn_delete_lis: TButton
        AlignWithMargins = True
        Left = 111
        Top = 34
        Width = 109
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Delete'
        TabOrder = 3
        Visible = False
      end
    end
    object dbg_lists: TDBGrid
      Left = 2
      Top = 81
      Width = 221
      Height = 353
      Align = alClient
      BorderStyle = bsNone
      DataSource = ds_list
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object grp_card: TGroupBox
    AlignWithMargins = True
    Left = 696
    Top = 3
    Width = 225
    Height = 436
    Align = alLeft
    Caption = 'Cards'
    TabOrder = 3
    object GridPanel3: TGridPanel
      Left = 2
      Top = 15
      Width = 221
      Height = 66
      Align = alTop
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = btn_active_car
          Row = 0
        end
        item
          Column = 1
          Control = btn_insert_car
          Row = 0
        end
        item
          Column = 0
          Control = btn_edit_car
          Row = 1
        end
        item
          Column = 1
          Control = btn_delete_car
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 0
      object btn_active_car: TButton
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 108
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Active'
        TabOrder = 0
        OnClick = btn_active_carClick
      end
      object btn_insert_car: TButton
        AlignWithMargins = True
        Left = 111
        Top = 1
        Width = 109
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Insert'
        TabOrder = 1
        OnClick = btn_insert_carClick
      end
      object btn_edit_car: TButton
        AlignWithMargins = True
        Left = 1
        Top = 34
        Width = 108
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Edit'
        TabOrder = 2
        OnClick = btn_edit_carClick
      end
      object btn_delete_car: TButton
        AlignWithMargins = True
        Left = 111
        Top = 34
        Width = 109
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Delete'
        TabOrder = 3
        OnClick = btn_delete_carClick
      end
    end
    object dbg_cards: TDBGrid
      Left = 2
      Top = 81
      Width = 221
      Height = 353
      Align = alClient
      BorderStyle = bsNone
      DataSource = ds_card
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 927
    Top = 3
    Width = 225
    Height = 436
    Align = alLeft
    Caption = 'Members'
    TabOrder = 4
    object GridPanel4: TGridPanel
      Left = 2
      Top = 15
      Width = 221
      Height = 66
      Align = alTop
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = Button1
          Row = 0
        end
        item
          Column = 1
          Control = Button2
          Row = 0
        end
        item
          Column = 0
          Control = Button3
          Row = 1
        end
        item
          Column = 1
          Control = Button4
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 0
      object Button1: TButton
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 108
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Active'
        TabOrder = 0
        OnClick = btn_active_carClick
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 111
        Top = 1
        Width = 109
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Insert'
        TabOrder = 1
        OnClick = btn_insert_carClick
      end
      object Button3: TButton
        AlignWithMargins = True
        Left = 1
        Top = 34
        Width = 108
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Edit'
        TabOrder = 2
        OnClick = btn_edit_carClick
      end
      object Button4: TButton
        AlignWithMargins = True
        Left = 111
        Top = 34
        Width = 109
        Height = 31
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = 'Delete'
        TabOrder = 3
        OnClick = btn_delete_carClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 81
      Width = 221
      Height = 353
      Align = alClient
      BorderStyle = bsNone
      DataSource = ds_members
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object mtb_organization: TFDMemTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'name'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'displayName'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'desc'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'descData'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'idBoards'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'idEnterprise'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'invited'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'invitations'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'limits'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'memberships'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'prefs'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'powerUps'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'products'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'billableMemberCount'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'activeBillableMemberCount'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'billableCollaboratorCount'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'url'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'website'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'logoHash'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'logoUrl'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'premiumFeatures'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'enterpriseJoinRequest'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'availableLicenseCount'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'maximumLicenseCount'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ixUpdate'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 91
    Top = 163
  end
  object mtb_board: TFDMemTable
    FieldDefs = <
      item
        Name = 'name'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'desc'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'descData'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'closed'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'idOrganization'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'limits'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'pinned'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'shortLink'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'powerUps'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'dateLastActivity'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'idTags'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'datePluginDisable'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'creationMethod'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ixUpdate'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'id'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'starred'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'url'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'prefs'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'subscribed'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'labelNames'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'dateLastView'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'shortUrl'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'memberships'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 282
    Top = 171
  end
  object mtb_list: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 537
    Top = 179
  end
  object mtb_card: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 736
    Top = 195
  end
  object ds_organization: TDataSource
    DataSet = mtb_organization
    Left = 107
    Top = 235
  end
  object ds_board: TDataSource
    DataSet = mtb_board
    Left = 282
    Top = 243
  end
  object ds_list: TDataSource
    DataSet = mtb_list
    Left = 537
    Top = 243
  end
  object ds_card: TDataSource
    DataSet = mtb_card
    Left = 752
    Top = 267
  end
  object Organizations1: TOrganizations
    Authenticator = Authenticator2
    DataSet = mtb_organization
    Left = 75
    Top = 331
  end
  object Boards1: TBoards
    Authenticator = Authenticator2
    DataSet = mtb_board
    IdOrganization = '52a5b010b958b54d7d0015b8'
    Left = 290
    Top = 307
  end
  object Lists1: TLists
    Authenticator = Authenticator2
    DataSet = mtb_list
    Left = 561
    Top = 307
  end
  object Cards1: TCards
    Authenticator = Authenticator2
    DataSet = mtb_card
    Left = 744
    Top = 331
  end
  object Authenticator1: TAuthenticator
    User = 'winiciusmoreira'
    Key = '8e95f857762402db873892fa6f5c38b4'
    Token = '0e12b3d57f92d8dde0599936e85f17a7edc1cc806c9ac127efe59180fcfa0a51'
    Left = 346
    Top = 107
  end
  object Members1: TMembers
    Authenticator = Authenticator2
    DataSet = mtb_members
    IdBoard = '52a5d97e4f9973d24300434f'
    Left = 986
    Top = 307
  end
  object mtb_members: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 962
    Top = 171
  end
  object ds_members: TDataSource
    DataSet = mtb_members
    Left = 970
    Top = 243
  end
  object Authenticator2: TAuthenticator
    User = 'winiciusmoreira'
    Key = '8e95f857762402db873892fa6f5c38b4'
    Token = '0e12b3d57f92d8dde0599936e85f17a7edc1cc806c9ac127efe59180fcfa0a51'
    Left = 154
    Top = 107
  end
end
