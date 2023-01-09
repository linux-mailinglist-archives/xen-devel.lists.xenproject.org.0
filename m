Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74161661F6C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 08:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473335.733869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEmuI-0005DT-Vz; Mon, 09 Jan 2023 07:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473335.733869; Mon, 09 Jan 2023 07:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEmuI-0005A9-SB; Mon, 09 Jan 2023 07:49:22 +0000
Received: by outflank-mailman (input) for mailman id 473335;
 Mon, 09 Jan 2023 07:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LgaK=5G=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pEmuG-0005A0-89
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 07:49:20 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2078.outbound.protection.outlook.com [40.107.103.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d8e83a7-8ff2-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 08:49:17 +0100 (CET)
Received: from FR3P281CA0204.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a5::9) by
 PA4PR08MB6144.eurprd08.prod.outlook.com (2603:10a6:102:e3::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Mon, 9 Jan 2023 07:49:14 +0000
Received: from VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a5:cafe::cc) by FR3P281CA0204.outlook.office365.com
 (2603:10a6:d10:a5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11 via Frontend
 Transport; Mon, 9 Jan 2023 07:49:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT016.mail.protection.outlook.com (100.127.144.158) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Mon, 9 Jan 2023 07:49:13 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Mon, 09 Jan 2023 07:49:12 +0000
Received: from 992d601173f9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7360FF9E-90E4-47EF-A60E-D7F9330BDBDF.1; 
 Mon, 09 Jan 2023 07:49:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 992d601173f9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Jan 2023 07:49:03 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by AS8PR08MB8086.eurprd08.prod.outlook.com (2603:10a6:20b:54b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 07:48:59 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 07:48:59 +0000
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
X-Inumbo-ID: 1d8e83a7-8ff2-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKAXuZ2ln55fEjAN4R5sFOXI/x6Y4sfBhXHBHo1uyiQ=;
 b=AAP78dGGludVtFDkbJmRU+EU6e6YOjd/rCBm22UCIU7GVRuT55Yg55n4qSc7LPvqCmfdl2MD9XfEy+DcTkE78KQqdiEQOAvykude1+13eANHJP4Vt07ysQWDdFpDFWUL5P48xecLdnwlJ+5IxZD5Hile3UFg/l2bTAUm8N5l2ZA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIUxU/SsqmBKeN11QdSKzPD1xdXXbivyP38+sSER05jXzK+5kaacysVwgG5c7HaYvjd85tKGNGxTwDzLWkNoGMU2uKBq835/09PBXR1S2jokcy0gHr/9X0klKmBtSxY/loGTINWQMl2NZPfci/bK5VGt8zSj3IsuHKEbJAKRcWOnpUGseLYiTBcKHSKBXYW4zUFKflWo4EDWZFxnMqDJzHombPYEQ6IHgd8gt5oxm8USVo0EJKbCDn06w7LcdRDpn/fRXxk1ppnAEBGrBHqQFuGL+fNvkTb0dpCT0vpbwhIZWrQLPXDG2uvN1uQsuSpGE9U27r5nVWX6iT65f6I9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKAXuZ2ln55fEjAN4R5sFOXI/x6Y4sfBhXHBHo1uyiQ=;
 b=KItY2d6wp3XmTl2tNndMyZcO3+pjdKwXp1+gRh4kwCbCzn8m/+IL6KwTyxXkfkSsitjdW+xrPSBHRKHUDPgvmp/pWP1Z4rC+0EZ5Lh7gqTJNV41xrP6g6EzrbxDdUGkaoAloCQOyIj2Z2l2+zEV1pQaZpUY9ZHEB+wqwG2YUK+J9KufIbwb1jeTYb+7WDW/uMoUOX0+6RsOCE1Xnz7RBoHCCXrYU/U6OlAWJwWYFxX1960meyyDA5Qv1Y6RpY25RELXcG0bt9h97R5J/dBKqp5Dogx0OqrVMDX+Bl5YvH8xrp5jU2JCLkK/zbplKZcjAASCJSTlEtoNuDdExdDVMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKAXuZ2ln55fEjAN4R5sFOXI/x6Y4sfBhXHBHo1uyiQ=;
 b=AAP78dGGludVtFDkbJmRU+EU6e6YOjd/rCBm22UCIU7GVRuT55Yg55n4qSc7LPvqCmfdl2MD9XfEy+DcTkE78KQqdiEQOAvykude1+13eANHJP4Vt07ysQWDdFpDFWUL5P48xecLdnwlJ+5IxZD5Hile3UFg/l2bTAUm8N5l2ZA=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 01/13] xen/arm: re-arrange the static shared memory
 region
Thread-Topic: [PATCH v1 01/13] xen/arm: re-arrange the static shared memory
 region
Thread-Index: AQHY+J1fJT59o0hz5k65YJBzZn+QX66Uu+KAgAFK6sA=
Date: Mon, 9 Jan 2023 07:48:59 +0000
Message-ID:
 <AM0PR08MB4530A8EA76480621255CEFC9F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-2-Penny.Zheng@arm.com>
 <dd5b93c3-51d1-40ad-88b4-5bbd54633651@xen.org>
In-Reply-To: <dd5b93c3-51d1-40ad-88b4-5bbd54633651@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 77C55A13AE0A2942AE889D654333364B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|AS8PR08MB8086:EE_|VI1EUR03FT016:EE_|PA4PR08MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 802ccaa4-56dc-481e-a91f-08daf216002c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qR+k8egtqPC5/4MXYyif4xA2C0CBn4RzLOh8XsZLZ3nh4b4KMrZRW8p3ocvAe+sQ1cUw4TxEzYpcCIJlhBJzoHuLPAbst0GfVUSxNvNM/sFcNg9qVPQLEGTDfsDD77Bd0PlKW3BTRCQZfBFAgtacvQIzShJb49dbldZlBVH4GM+rKUfSRSstN+4u+FSx7WaHI2+LcwC227Fc/w3+cuiaDTrBEsTFMgYzSRTljZRk67VHZCrW+Acsl+9HBC/dxoHueWfq0FIoedrla6NtMmjQNqkJ1lP3yEV6aY6mTwzTa1avxbH4imdNPDbrXSXGnBf9je1oOz5uUFN0+cL2ZfmMY/igIdo326AXnV78OzlJfQtO1e7ydajYIkZbdVwKyBoIiZH0eF5mcdg82k4M6GebpZMxbnySruzA2NlHKx208VseurrqT4aJArRdQBQY64eUFDN+wPK01dUfN4gVIAAM+XpKfjDb9F0Ftj0vrze1+lnpKfSYUXMmofiTebHME/dInBtkXaJeiUCaRt60GWzJ9cC2FITujYo4qswUjwQ9JM6OY9Nz2pSgzH/lvsyK7D0ADMtbNVAm6PfXoG+TTZSKZx+WH9wE6HTBNN5rkQmuCbWHyyS7usw7q2RvEkGWlPgXbPz3EVjUTNFBVYKmRspjxp6GNmtvW0/atdT2EoYflw49Kifix/TLcelhIbei5Qof
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199015)(86362001)(7696005)(478600001)(71200400001)(55016003)(316002)(54906003)(110136005)(38100700002)(122000001)(38070700005)(33656002)(186003)(26005)(53546011)(6506007)(9686003)(64756008)(41300700001)(76116006)(66946007)(66446008)(66476007)(66556008)(4326008)(5660300002)(8676002)(52536014)(2906002)(83380400001)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8086
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	24aaf046-90b7-479f-779c-08daf215f805
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+6AmQ5MuTUnkVHqRt2j/5BSsOLq6SAYZB3qcgHoa/lhAkJYpl5ul8uo38c/tvSWRfAnLRxc3dX3OEURfHrSvX+VKfKyUoPyC45UUuolEAW7wIV0VV5Bhkg/fzIyb+zto/vsV2bjLcxIr1fECtSlNmEkPFI9S7bzwk1ISvV1AQmbVeHXleAGq+xAzVZSeolY7c7hg6nIBb7o+TatBiQ4pqE7YzB4hFIa0svUgoLRZdILB6R+wX7B0bu4Q/VEWB/TK8H6MX1PykK1YKgLDc2o/uV6kzLvQgAf5wFQTr1yLTYvZazCt/f3DJ/P9o/2UnvUKjjzG6BZRO0BZhEWCXS0VYULe4TgyHmibPHibwwFu8z5E/WRkGrb/bBtMl0YzTI3Hh+BI/EXB8+CBCVPY/FXN+DR98M7bQd3v/9f+9W4jkIt4TwBmvMu558QndmBvjln5Lvxb9u3hnbjB1dNO8r60ecP6pK8R03lvSkk8/I7vQ7YVVgV5frNfFsH152lEUmsGVigmFfRJJ+3u1YFzVSSgZUEIqpmKKgOSEVrhGkP9yFVHj6zxPzZZADwKuY9bK2yurglTaFHr7hNdCJPK6FkwEkOL6iEEo9uj9RhmVm/LIb3U6t8tWoGCbhaWEUFxXX6XWCxavbjKJn1lg9FppsvX25MbYAunpcVbdqwJVv1VHGSlygj6UQ64j60MlDihuK9dqPNw/fjoj53+d5X7Nfx6Ag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(33656002)(478600001)(316002)(4326008)(8676002)(110136005)(54906003)(70586007)(36860700001)(70206006)(86362001)(83380400001)(81166007)(82740400003)(7696005)(40480700001)(107886003)(356005)(6506007)(186003)(26005)(55016003)(9686003)(53546011)(40460700003)(336012)(82310400005)(47076005)(52536014)(8936002)(5660300002)(2906002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 07:49:13.1069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 802ccaa4-56dc-481e-a91f-08daf216002c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6144

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4NCj4gU2VudDogU3VuZGF5LCBKYW51YXJ5IDgsIDIwMjMgNzo0NCBQTQ0K
PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9k
eW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIDAxLzEzXSB4
ZW4vYXJtOiByZS1hcnJhbmdlIHRoZSBzdGF0aWMgc2hhcmVkIG1lbW9yeQ0KPiByZWdpb24NCj4g
DQo+IEhpIFBlbm55LA0KPiANCg0KSGkgSnVsaWVuDQoNCj4gT24gMTUvMTEvMjAyMiAwMjo1Miwg
UGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gVGhpcyBjb21taXQgcmUtYXJyYW5nZXMgdGhlIHN0YXRp
YyBzaGFyZWQgbWVtb3J5IHJlZ2lvbnMgaW50byBhDQo+ID4gc2VwYXJhdGUgYXJyYXkgc2htX21l
bWluZm8uIEFuZCBzdGF0aWMgc2hhcmVkIG1lbW9yeSByZWdpb24gbm93DQo+IHdvdWxkDQo+ID4g
aGF2ZSBpdHMgb3duIHN0cnVjdHVyZSAnc2htX21lbWJhbmsnIHRvIGhvbGQgYWxsIHNobS1yZWxh
dGVkIG1lbWJlcnMsDQo+ID4gbGlrZSBzaG1faWQsIGV0YywgYW5kIGEgcG9pbnRlciB0byB0aGUg
bm9ybWFsIG1lbW9yeSBiYW5rICdtZW1iYW5rJy4NCj4gPiBUaGlzIHdpbGwgYXZvaWQgY29udGlu
dWluZyB0byBncm93ICdtZW1iYW5rJy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpo
ZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL2Jv
b3RmZHQuYyAgICAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0K
PiA+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAgICAgIHwgMzUgKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20va2VybmVsLmgg
fCAgMiArLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmggIHwgMTYgKysr
KysrKysrLS0tLQ0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCAzNCBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5j
IGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBpbmRleA0KPiA+IDYwMTRjMGY4NTIuLmNjZjI4MWNk
MzcgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYw0KPiA+ICsrKyBiL3hl
bi9hcmNoL2FybS9ib290ZmR0LmMNCj4gPiBAQCAtMzg0LDYgKzM4NCw3IEBAIHN0YXRpYyBpbnQg
X19pbml0IHByb2Nlc3Nfc2htX25vZGUoY29uc3Qgdm9pZCAqZmR0LA0KPiBpbnQgbm9kZSwNCj4g
PiAgICAgICBjb25zdCBfX2JlMzIgKmNlbGw7DQo+ID4gICAgICAgcGFkZHJfdCBwYWRkciwgZ2Fk
ZHIsIHNpemU7DQo+ID4gICAgICAgc3RydWN0IG1lbWluZm8gKm1lbSA9ICZib290aW5mby5yZXNl
cnZlZF9tZW07DQo+IA0KPiBBZnRlciB0aGlzIHBhdGNoLCAnbWVtJyBpcyBiYXJlbHkgZ29pbmcg
dG8gYmUgdXNlZC4gU28gSSB3b3VsZCByZWNvbW1lbmQgdG8NCj4gcmVtb3ZlIGl0IG9yIHJlc3Ry
aWN0IHRoZSBzY29wZS4NCj4NCg0KSG9wZSBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCB5b3UgYXJl
IHNheWluZyB0aGF0IGFsbCBzdGF0aWMgc2hhcmVkIG1lbW9yeSBiYW5rIHdpbGwgYmUNCmRlc2Ny
aWJlZCBhcyAic3RydWN0IHNobV9tZW1iYW5rIi4gVGhhdCdzIHJpZ2h0Lg0KSG93ZXZlciB3aGVu
IGhvc3QgYWRkcmVzcyBpcyBwcm92aWRlZCwgd2Ugc3RpbGwgbmVlZCBhbiBpbnN0YW5jZSBvZiAi
c3RydWN0IG1lbWJhbmsiDQp0byByZWZlciB0byBpbiAiYm9vdGluZm8ucmVzZXJ2ZWRfbWVtIi4g
T25seSBpbiB0aGlzIHdheSwgaXQgY291bGQgYmUgaW5pdGlhbGl6ZWQgcHJvcGVybHkgaW4NCmFz
IHN0YXRpYyBwYWdlcy4NClRoYXQncyB3aHkgSSBwdXQgYSAic3RydWN0IG1lbWJhbmsqIiBwb2lu
dGVyIGluICJzdHJ1Y3Qgc2htX21lbWJhbmsiIHRvIHJlZmVyIHRvIHRoZQ0Kc2FtZSBvYmplY3Qu
DQpJZiBJIHJlbW92ZWQgaW5zdGFuY2UgaW4gYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLCBhIGZldyBt
b3JlIHBhdGggbmVlZHMgdG8gYmUgdXBkYXRlZCwgbGlrZQ0KSW5pdF9zdGF0aWNtZW1fcGFnZXMs
IGR0X3VucmVzZXJ2ZWRfcmVnaW9ucywgZXRjDQogDQo+IFRoaXMgd2lsbCBtYWtlIGVhc2llciB0
byBjb25maXJtIHRoYXQgbW9zdCBvZiB0aGUgdXNlIG9mICdtZW0nIGhhdmUgYmVlbg0KPiByZXBs
YWNlZCB3aXRoICdzaG1fbWVtJyBhbmQgcmVkdWNlIHRoZSByaXNrIG9mIGNvbmZ1c2lvbiBiZXR3
ZWVuIHRoZSB0d28NCj4gKHRoZSBuYW1lIGFyZSBxdWl0ZSBzaW1pbGFyKS4NCj4gDQo+IFsuLi5d
DQo+IA0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiBpbmRleCBiZDMwZDM3OThjLi5jMGZkMTNmNmVk
IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+ICsrKyBi
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+IEBAIC03NTcsMjAgKzc1NywyMCBAQCBz
dGF0aWMgaW50IF9faW5pdA0KPiBhY3F1aXJlX25yX2JvcnJvd2VyX2RvbWFpbihzdHJ1Y3QgZG9t
YWluICpkLA0KPiA+ICAgew0KPiA+ICAgICAgIHVuc2lnbmVkIGludCBiYW5rOw0KPiA+DQo+ID4g
LSAgICAvKiBJdGVyYXRlIHJlc2VydmVkIG1lbW9yeSB0byBmaW5kIHJlcXVlc3RlZCBzaG0gYmFu
ay4gKi8NCj4gPiAtICAgIGZvciAoIGJhbmsgPSAwIDsgYmFuayA8IGJvb3RpbmZvLnJlc2VydmVk
X21lbS5ucl9iYW5rczsgYmFuaysrICkNCj4gPiArICAgIC8qIEl0ZXJhdGUgc3RhdGljIHNoYXJl
ZCBtZW1vcnkgdG8gZmluZCByZXF1ZXN0ZWQgc2htIGJhbmsuICovDQo+ID4gKyAgICBmb3IgKCBi
YW5rID0gMCA7IGJhbmsgPCBib290aW5mby5zaG1fbWVtLm5yX2JhbmtzOyBiYW5rKysgKQ0KPiA+
ICAgICAgIHsNCj4gPiAtICAgICAgICBwYWRkcl90IGJhbmtfc3RhcnQgPSBib290aW5mby5yZXNl
cnZlZF9tZW0uYmFua1tiYW5rXS5zdGFydDsNCj4gPiAtICAgICAgICBwYWRkcl90IGJhbmtfc2l6
ZSA9IGJvb3RpbmZvLnJlc2VydmVkX21lbS5iYW5rW2JhbmtdLnNpemU7DQo+ID4gKyAgICAgICAg
cGFkZHJfdCBiYW5rX3N0YXJ0ID0gYm9vdGluZm8uc2htX21lbS5iYW5rW2JhbmtdLm1lbWJhbmst
DQo+ID5zdGFydDsNCj4gPiArICAgICAgICBwYWRkcl90IGJhbmtfc2l6ZSA9DQo+ID4gKyBib290
aW5mby5zaG1fbWVtLmJhbmtbYmFua10ubWVtYmFuay0+c2l6ZTsNCj4gDQo+IEkgd2FzIGV4cGVj
dGluZyBhICJpZiAodHlwZSA9PSBNRU1CQU5LX1NUQVRJQ19ET01BSU4pIC4uLiIgIHRvIGJlDQo+
IHJlbW92ZWQuIEJ1dCBpdCBsb29rcyBsaWtlIHRoZXJlIHdhcyBub25lLiBJIGd1ZXNzIHRoYXQg
d2FzIGEgbWlzdGFrZSBpbiB0aGUNCj4gZXhpc3RpbmcgY29kZT8NCj4gDQoNCk9oLCB5b3UncmUg
cmlnaHQsIHRoZSB0eXBlIHNoYWxsIGFsc28gYmUgY2hlY2tlZC4NCg0KPiA+DQo+ID4gICAgICAg
ICAgIGlmICggKHBiYXNlID09IGJhbmtfc3RhcnQpICYmIChwc2l6ZSA9PSBiYW5rX3NpemUpICkN
Cj4gPiAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+IC0gICAgaWYg
KCBiYW5rID09IGJvb3RpbmZvLnJlc2VydmVkX21lbS5ucl9iYW5rcyApDQo+ID4gKyAgICBpZiAo
IGJhbmsgPT0gYm9vdGluZm8uc2htX21lbS5ucl9iYW5rcyApDQo+ID4gICAgICAgICAgIHJldHVy
biAtRU5PRU5UOw0KPiA+DQo+ID4gLSAgICAqbnJfYm9ycm93ZXJzID0NCj4gYm9vdGluZm8ucmVz
ZXJ2ZWRfbWVtLmJhbmtbYmFua10ubnJfc2htX2JvcnJvd2VyczsNCj4gPiArICAgICpucl9ib3Jy
b3dlcnMgPSBib290aW5mby5zaG1fbWVtLmJhbmtbYmFua10ubnJfc2htX2JvcnJvd2VyczsNCj4g
Pg0KPiA+ICAgICAgIHJldHVybiAwOw0KPiA+ICAgfQ0KPiA+IEBAIC05MDcsMTEgKzkwNywxOCBA
QCBzdGF0aWMgaW50IF9faW5pdA0KPiBhcHBlbmRfc2htX2JhbmtfdG9fZG9tYWluKHN0cnVjdCBr
ZXJuZWxfaW5mbyAqa2luZm8sDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhZGRyX3Qgc3RhcnQsIHBhZGRyX3Qgc2l6ZSwNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqc2htX2lkKQ0K
PiA+ICAgew0KPiA+ICsgICAgc3RydWN0IG1lbWJhbmsgKm1lbWJhbms7DQo+ID4gKw0KPiA+ICAg
ICAgIGlmICgga2luZm8tPnNobV9tZW0ubnJfYmFua3MgPj0gTlJfTUVNX0JBTktTICkNCj4gPiAg
ICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiAtICAgIGtpbmZvLT5zaG1fbWVtLmJh
bmtba2luZm8tPnNobV9tZW0ubnJfYmFua3NdLnN0YXJ0ID0gc3RhcnQ7DQo+ID4gLSAgICBraW5m
by0+c2htX21lbS5iYW5rW2tpbmZvLT5zaG1fbWVtLm5yX2JhbmtzXS5zaXplID0gc2l6ZTsNCj4g
PiArICAgIG1lbWJhbmsgPSB4bWFsbG9jX2J5dGVzKHNpemVvZihzdHJ1Y3QgbWVtYmFuaykpOw0K
PiANCj4gWW91IGFsbG9jYXRlIG1lbW9yeSBidXQgbmV2ZXIgZnJlZSBpdC4gSG93ZXZlciwgSSB0
aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8NCj4gYXZvaWQgdGhlIGR5bmFtaWMgYWxsb2NhdGlv
bi4gU28gSSB3b3VsZCBjb25zaWRlciB0byBub3QgdXNlIHRoZSBzdHJ1Y3R1cmUNCj4gc2htX21l
bWJhbmsgYW5kIGluc3RlYWQgY3JlYXRlIGEgc3BlY2lmaWMgb25lIGZvciB0aGUgZG9tYWluIGNv
bnN0cnVjdGlvbi4NCj4gDQoNClRydWUsIGEgbG9jYWwgdmFyaWFibGUgInN0cnVjdCBtZW1pbmZv
IHNobV9iYW5rcyIgY291bGQgYmUgaW50cm9kdWNlZCBvbmx5DQpmb3IgZG9tYWluIGNvbnN0cnVj
dGlvbiBpbiBmdW5jdGlvbiBjb25zdHJ1Y3RfZG9tVQ0KDQo+ID4gKyAgICBpZiAoIG1lbWJhbmsg
PT0gTlVMTCApDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsgICAg
a2luZm8tPnNobV9tZW0uYmFua1traW5mby0+c2htX21lbS5ucl9iYW5rc10ubWVtYmFuayA9DQo+
IG1lbWJhbms7DQo+ID4gKyAgICBraW5mby0+c2htX21lbS5iYW5rW2tpbmZvLT5zaG1fbWVtLm5y
X2JhbmtzXS5tZW1iYW5rLT5zdGFydCA9DQo+IHN0YXJ0Ow0KPiA+ICsgICAga2luZm8tPnNobV9t
ZW0uYmFua1traW5mby0+c2htX21lbS5ucl9iYW5rc10ubWVtYmFuay0+c2l6ZSA9DQo+ID4gKyBz
aXplOw0KPiANCj4gVGhlIGxhc3QgdHdvIGNvdWxkIGJlIHJlcGxhY2VkIHdpdGg6DQo+IA0KPiBt
ZW1iYW5rLT5zdGFydCA9IHN0YXJ0Ow0KPiBtZW1iYW5rLT5zaXplID0gc2l6ZTsNCj4gDQo+IFRo
aXMgd291bGQgbWFrZSB0aGUgY29kZSBtb3JlIHJlYWRhYmxlLiBBbHNvLCB3aGlsZSB5b3UgYXJl
IG1vZGlmeWluZyB0aGUNCj4gY29kZSwgSSB3b3VsZCBjb25zaWRlciB0byBpbnRyb2R1Y2UgYSBs
b2NhbCB2YXJpYWJsZSB0aGF0IHBvaW50cyB0bw0KPiBraW5mby0+c2htX21lbS5iYW5rW2tpbmZv
LT5zaG1fbWVtLm5yX2JhbmtzXS4NCj4gDQo+IFsuLi5dDQo+IA0KPiA+ICAgc3RydWN0IG1lbWlu
Zm8gew0KPiA+IEBAIC02MSw2ICs1NywxNyBAQCBzdHJ1Y3QgbWVtaW5mbyB7DQo+ID4gICAgICAg
c3RydWN0IG1lbWJhbmsgYmFua1tOUl9NRU1fQkFOS1NdOw0KPiA+ICAgfTsNCj4gPg0KPiA+ICtz
dHJ1Y3Qgc2htX21lbWJhbmsgew0KPiA+ICsgICAgY2hhciBzaG1faWRbTUFYX1NITV9JRF9MRU5H
VEhdOw0KPiA+ICsgICAgdW5zaWduZWQgaW50IG5yX3NobV9ib3Jyb3dlcnM7DQo+ID4gKyAgICBz
dHJ1Y3QgbWVtYmFuayAqbWVtYmFuazsNCj4gDQo+IEFmdGVyIHRoZSBjaGFuZ2UgSSBzdWdnZXN0
IGFib3ZlLCBJIHdvdWxkIGV4cGVjdCB0aGF0IHRoZSBmaWVsZCBvZg0KPiBtZW1iYW5rIHdpbGwg
bm90IGJlIHVwZGF0ZWQuIFNvIEkgd291bGQgYWRkIGNvbnN0IGhlcmUuDQo+IA0KPiBDaGVlcnMs
DQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

