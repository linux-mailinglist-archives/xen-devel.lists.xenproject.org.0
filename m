Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C7F619ADA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 16:02:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437682.692130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqyD3-0007e9-IM; Fri, 04 Nov 2022 15:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437682.692130; Fri, 04 Nov 2022 15:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqyD3-0007cH-Ek; Fri, 04 Nov 2022 15:02:17 +0000
Received: by outflank-mailman (input) for mailman id 437682;
 Fri, 04 Nov 2022 15:02:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKjc=3E=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oqyD1-0007cB-Qo
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 15:02:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9e759d9-5c51-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 16:02:13 +0100 (CET)
Received: from DU2PR04CA0329.eurprd04.prod.outlook.com (2603:10a6:10:2b5::34)
 by PR3PR08MB5641.eurprd08.prod.outlook.com (2603:10a6:102:91::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 15:02:11 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::a5) by DU2PR04CA0329.outlook.office365.com
 (2603:10a6:10:2b5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 15:02:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 15:02:11 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Fri, 04 Nov 2022 15:02:11 +0000
Received: from 41ae998e9f15.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2069500E-4114-4808-9D57-B75DC1220D5C.1; 
 Fri, 04 Nov 2022 15:02:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 41ae998e9f15.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 15:02:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6600.eurprd08.prod.outlook.com (2603:10a6:20b:33e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 15:02:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5813.008; Fri, 4 Nov 2022
 15:02:03 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a9e759d9-5c51-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FOKdxA64ApjICumSqneVN16i8MdvcCpRjUMKFbXGbX1e4I/MfmnP9ce57qqQCnMbIqYzKH35g+PIw2lSYGVVkDzZr91amalxAs+0CXRmh8yHZTZwPLtC5k/ngq2E01cu5XJqIXiHL1/i8BxqT9QKhLCSB+Qt13hmWKodaqRvk2EEMOzPpeZ48hmsDdDJmX0Qn4Rl786DJL3Z1Le07YqABvoxDqEHDDK6Dw/qNo7X0WO5pg4jGa6wa0wd1qhhVqH30o3/K3qV71Uke0Y51vfV7lWiu702vwLHMtUc4Hc+zLkLc7hIH3Ga6ukf5rJnbAsMjcrJTTdwC1sSUEAlnmDGSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyjY2hz+EbXzSl4D44BhXe26W7DX48s4evM5fZRhP98=;
 b=Og1tIplWrqUJtr6CE9VBjeG8JIB+lxaPpL+YDmcl5sEfj0RDCIlsAgLlrpv4zfoOnoh2aSOQQ/iYRH1gkZiUsLaxZ7kb+XDIGn/qcnvQDi50xrklUvXJTDeHoNuobfLnBFoQ0gOR/0OWMhEbwP1OtcRISiWmdrgtCqWL/DF+zPSozV+lYQtvA6Td3lHmYJvEN5yLW08aFCtWMc/ep5cb7s68s8ceNRa6RDVnWmLq8/m5YmkYqUl6BPz4/f7m5trGpWzItPCmADMXw/ga5tTKgTcrPH8RukJ66xFLZIR67V3ZyyH+5pqPFv8GSyvgRLBj0YWobfNObxpfZXfRH/msxg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyjY2hz+EbXzSl4D44BhXe26W7DX48s4evM5fZRhP98=;
 b=UGkjrZpcRpCHaeH8cwVbbtZaDPuDn9jwWw7Dag+zciLz24e8cXM5r4nSWPSTdmYcWNJCkm/iPWRm1Mm5H4jKzO4M2ZNv2Nm5MCHZNdOURpbUoMXXSn617bdZGeVdoqt4N0gV+60+Q3q8qdlRnPGUoxTBn9CURk+hf84Jo2z9XL0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUrBB7bL1zN0CsU8q0AEuWIVxGtw4h/s3HJYOw9wszmEIOBXhrhh8g3sll/j2BNw/ZmNnuKlKJczqR27xkMb6ccRB+Aap/1IL5Bfb4ubKXMIAmC7ozdD1OCRuWkSVWKLEPJ2FAsRvqt7ZMNvUZYqFFkEcms6o2IY6DVuCCTE9A1qw8jjs4L86YXurXdDGyYuSIUI7tzHqXUKqJoGO8AEkpJylmuBQ1zIvG2jYhvutOri4iQBHY7JelSzPw6BL/3lH6Biu9AZMaHb0J6Y9Pmi36k+bZpT3i5B+dYPv61V912NpZXCRuSnRcWPLFcJg78v5Fj5/PRNKFP+gMfPRgeOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyjY2hz+EbXzSl4D44BhXe26W7DX48s4evM5fZRhP98=;
 b=UMBiffAj0QtP4wMnZoUekQIlomosydovqLAt093K1RIHmLD/DAB4m9Hkl/aXlrf+H31+BzlM/SDNMRTghCJbFSkDRfdcXBnHowwnyJqaCm10RRghv2nX7OW3/tj1ztpQJ5D2KbmRY+YC4a7dI0I03xubp1hRzXTLofqav5Oljw+MCMQSO0jAGNb0z2rY4jdaDOKNL4gcxqz3pHs+qC0JuOL212DQY5haBnJGalWDst6wtLVofmQ7sF03XJgY5XNR1d9UP95lshorJELAe9s874V4FnyIdGTAiKIdpVBQ1tAFW+/dXFUSlUqlMHXoVhsI6md9BwouNy/2sb6Ni3/kyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyjY2hz+EbXzSl4D44BhXe26W7DX48s4evM5fZRhP98=;
 b=UGkjrZpcRpCHaeH8cwVbbtZaDPuDn9jwWw7Dag+zciLz24e8cXM5r4nSWPSTdmYcWNJCkm/iPWRm1Mm5H4jKzO4M2ZNv2Nm5MCHZNdOURpbUoMXXSn617bdZGeVdoqt4N0gV+60+Q3q8qdlRnPGUoxTBn9CURk+hf84Jo2z9XL0=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH for-4.17] Revert "x86/HVM: also dump stacks from
 show_execution_state()"
Thread-Topic: [PATCH for-4.17] Revert "x86/HVM: also dump stacks from
 show_execution_state()"
Thread-Index: AQHY8Fvo92EmCyvfk0qQoQum7MnN2a4u2/HQ
Date: Fri, 4 Nov 2022 15:02:03 +0000
Message-ID:
 <AS8PR08MB79917C9EA8129A237B82740C923B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221104144337.36844-1-roger.pau@citrix.com>
In-Reply-To: <20221104144337.36844-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 15F3AF82BFCA084FA0ACB542AAA6AD3F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6600:EE_|DBAEUR03FT049:EE_|PR3PR08MB5641:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bbb0e8-18da-4f45-0e6e-08dabe758cfa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cSlL97y5CKTx0/X9BySpFSUbBkIImj356dqiIRSqaDQryXbTaW5bOIFKgx70lOFF4OwnQPB0OF7U3BcEgYI/o916zt+1FE00szrJH5ilFql9p2nfWDjuC9qBpDeCK4kw6PcDw+azuUobtQ7US/63IqwCaVjkHbdCbFSnfoeiwnfsWY2SL5e1p9yQjPJPK3AoTTPUX4dJ5CFwoh/B0HxiO3GVBKVF1FgyKBUq8tlPIKTVZ9htl1OqlwZnY9oFKI5T50YACWSDWjl660jkDgdDrekaR+1ywIIrpLjftWMkDMM2+NdpTXcJ8GGJ0Y3Arv2c6HQiRmtB2T+iBLwUfCVFHJR6bib+avXgBImp/hwzuOCG0nLpZVBtuGzH+ElTQ/UmaGqMmdtCJ9UO+GhNOdNqwo0iPzI0jQ4T7zQmrFgXPJNTJGyViFPTw//APT7VBD/EybvAN9Aibxs8oCUi00rXaRrdnJo/YIAXPpNCTOqX5S3vCMwtFhaVLSiILqF+m4ikSxK5Z0gRCer0497O+qkYXl7CqbvEoas+EGV6Ilrjwq0P+468p2BlRp9eZ4eM6xWmPcSYMwcsGbxXdsgL7es8T3BF+5TtAu/CfPYN3BNxBOthZqmd51pMY/iYTcDKbhU6/ACrCk7UtqlnAjR9ciUe4Om+M6YkF1eLtN/6+CfCPyMQVIRyIVbjI9xGsfQkjSJ5OXvkGh1TtDjb0+m0dscgSoTsbxzOuOr9iWXlbsPQASVojYQpi3jefizIPY1q4wQZ4BxCyoYLO103MaYTICkz8w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199015)(41300700001)(110136005)(83380400001)(186003)(5660300002)(7696005)(2906002)(8676002)(6506007)(66556008)(4744005)(66946007)(66476007)(66446008)(64756008)(76116006)(52536014)(86362001)(316002)(26005)(55016003)(8936002)(9686003)(478600001)(33656002)(122000001)(38070700005)(71200400001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6600
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bba6a746-44b1-4d5b-a772-08dabe75883b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c3TJ0lVIDDjn1D5ci4PGf3Z2cWeO4siEAnfVQAKdAbYbDwLlceUZF+J8VunHGVz1Qw19281X+zvX1/0ZBPcyPg6TqwnlhgjqN+WvS20XYDT84Zara7Ne7q60bNYtFzxOfF7aY65pEmB5OE5ADtegip3sJ4zUch9+gLoZ++73hx7Pd/KanjORCo2G/R1g5ZvAh1QEM0HHtjjWosy27ns/DWc+FqxU3T/ubccbJFLdM4wvPflkhlmqjUrurpI0GYLVuYi1QRyxRvbQg6Ke08+zSL9qdWvhclJs5NwJzaxpzZCOvOaLhN24ZYTh+P1jj5lsdbRihn6qRQaJS55zpqbZcBQx6V1PKVSiB7Hu/Y4p7sri5JCKyzHNLF0oqCcVs1jIoaj6fyuiG/tfSKC900L3XKxJIc96moeb8fbu0keEUWQ645MuHxk5+Zuv/qM+2fvbKsxpp+H9ujcWq1KGmtLygumcwrdlfPGIFj3isinLt55OQB4XH2eB2CH/L5AKFEbZXSrXiYdSbmxCXY3Pmh4O7qLonL2TzC3xomtTBHTGVR6yCS6HSM1t41vG6MaxOWEEU8LajJGZ1rim/b5BMxJfHfxlSo35ToLYuCcCDANRqjI/iONPg7jXdUv/H6Th2G77FFLVHQnj6trCPOHK4w0EbbYp2ZdHLhMJVybsNrWlH04m9J177LfxMk6K489Ks0NKRqw/1bWtWkKrhzDVC9c+vMW6sZVCJWqg7ur73+/yN/22yBYFH1sHLKRLjbfDAeiVHWuQFSIL3O54XDyv4SkE0w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(47076005)(83380400001)(2906002)(86362001)(40480700001)(55016003)(33656002)(40460700003)(8676002)(26005)(70206006)(41300700001)(70586007)(356005)(81166007)(82310400005)(9686003)(36860700001)(316002)(110136005)(82740400003)(4744005)(52536014)(5660300002)(6506007)(7696005)(478600001)(8936002)(186003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 15:02:11.1839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bbb0e8-18da-4f45-0e6e-08dabe758cfa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5641

SGkgUm9nZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGZvci00
LjE3XSBSZXZlcnQgIng4Ni9IVk06IGFsc28gZHVtcCBzdGFja3MgZnJvbQ0KPiBzaG93X2V4ZWN1
dGlvbl9zdGF0ZSgpIg0KPiANCj4gVGhpcyByZXZlcnRzIGNvbW1pdCBhZGI3MTVkYjY5OGJjOGVj
M2I4OGMyNGViODhiMjFlOWRhNWI2YzA3Lg0KPiANCj4gVGhlIGR1bXBpbmcgb2Ygc3RhY2tzIGZv
ciBIVk0gZ3Vlc3RzIGlzIHByb2JsZW1hdGljLCBzaW5jZSBpdCByZXF1aXJlcw0KPiB0YWtpbmcg
dGhlIHAybSBsb2NrIGluIG9yZGVyIHRvIHdhbGsgdGhlIGd1ZXN0IHBhZ2UgdGFibGVzIGFuZCB0
aGUNCj4gcDJtLg0KPiANCj4gVGhlIHN1Z2dlc3RlZCBzb2x1dGlvbiB0byB0aGUgaXNzdWUgaXMg
dG8gaW50cm9kdWNlIGFuZCB1c2UgYSBsb2NrbGVzcw0KPiBwMm0gd2Fsa2VyLCB0aGF0IHJlbGll
cyBvbiBiZWluZyBleGVjdXRlZCB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQgaW4NCj4gb3JkZXIg
dG8gcHJldmVudCBhbnkgcDJtIHBhZ2VzIGZyb20gYmVpbmcgZnJlZWQgd2hpbGUgZG9pbmcgdGhl
DQo+IHdhbGsuDQo+IA0KPiBOb3RlIHRoYXQgbW9kaWZpY2F0aW9ucyBvZiBwMm0gZW50cmllcyBh
cmUgYWxyZWFkeSBkb25lIGF0b21pY2FsbHkgaW4NCj4gb3JkZXIgdG8gcHJldmVudCB0aGUgaGFy
ZHdhcmUgd2Fsa2VyIGZyb20gc2VlaW5nIHBhcnRpYWxseSB1cGRhdGVkDQo+IHZhbHVlcy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoN
CktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

