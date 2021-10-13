Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D56042B969
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 09:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207989.363994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maYwQ-0007Jo-PU; Wed, 13 Oct 2021 07:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207989.363994; Wed, 13 Oct 2021 07:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maYwQ-0007HA-LR; Wed, 13 Oct 2021 07:44:46 +0000
Received: by outflank-mailman (input) for mailman id 207989;
 Wed, 13 Oct 2021 07:44:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K3Kx=PB=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1maYwP-0007H4-8j
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 07:44:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d8d59ac-2bf9-11ec-8160-12813bfff9fa;
 Wed, 13 Oct 2021 07:44:43 +0000 (UTC)
Received: from DB7PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:52::30)
 by AM9PR08MB6883.eurprd08.prod.outlook.com (2603:10a6:20b:30a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Wed, 13 Oct
 2021 07:44:40 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::48) by DB7PR02CA0017.outlook.office365.com
 (2603:10a6:10:52::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Wed, 13 Oct 2021 07:44:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 07:44:39 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Wed, 13 Oct 2021 07:44:39 +0000
Received: from 43f54b14a118.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B0CE3E2-984E-479E-8743-F4A1EC0F6723.1; 
 Wed, 13 Oct 2021 07:44:28 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43f54b14a118.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Oct 2021 07:44:28 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB4752.eurprd08.prod.outlook.com (2603:10a6:802:a4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 07:44:26 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd%2]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 07:44:25 +0000
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
X-Inumbo-ID: 6d8d59ac-2bf9-11ec-8160-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nCitfPeSIuMzwV8uWO5jPCEfARcGi+gmpsQHMqOA/g=;
 b=CYk7I4D4fkEmONowdHmfwyvRlVYFyRbCHnd0KhS0h/ZIdcrQI/fkCT8EoaFiN9wiIvMtU4Bl84u9JDrz01Ji1jNazsnF8adr+dVF+jLdbR2fGTmwc7qpTP+d8pXaQDZ0JKP7+JEwWF+/cBvOzdFzZ68zYP8iS9UbJ+LC0K4MBzw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xlqkl3cLONmlvfBqaqpdnjbvjzJgushuky8gDU2hgHGq9c9WRbcxFdc5nwAryqdfPVjCWFsOU4l28pVOAJXPp1mnN6c/Rd7+1kuhxdzPqepwIV6MqQwX8isGK0fpj4GQjhn8amOsCj5So1Nf2Z2sR1K4oHv1poDrzZF8Cm20+a4aIPSSkbG58bG8GzLy+qUy7XCaNEXTwEMHX14G7StSvSbhAPJhfzN7hN0IVAvi5Y0a6dNkrVCHtdG5NQRjdo5OS/ydZCTbQ8KwEdoA4VF9RvQR9zuWuG4cVxl4+So0jIHiL7YWCxqKRWlX+YIfdX9jAZxoL89dIxmUq+rP44t89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nCitfPeSIuMzwV8uWO5jPCEfARcGi+gmpsQHMqOA/g=;
 b=OfVkU2eQamCjGIG2j3RVcCcbNL25nQ+VAL3YaxAbp4IFqAwSxAEwiC1at8hSrPX651/S5Ofp6UkgW7BpWsoO2C/gEd+4gHllyzM05CV2efE5EmkmvdEOj25Eustfjw88kKtFeWwo3uPQKGAq5iND2kerICcXB/atBrYQXwICVv6as+4RyGbF0nRkRlQwCje4REBXYuqY/ZuPcGkvCyjC3wuUZ/vPgG1BHMIQPxw17V0MRE4uzFhqWdVEdrZwTcLiTjLfMA1AqdMYwZaM5IC0FDRjdh2MAtKkN3bfwrz045t+nGrVBH5gDq9UA+jdBjvNi7JAS88B0xRnLYpVY6KHEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nCitfPeSIuMzwV8uWO5jPCEfARcGi+gmpsQHMqOA/g=;
 b=CYk7I4D4fkEmONowdHmfwyvRlVYFyRbCHnd0KhS0h/ZIdcrQI/fkCT8EoaFiN9wiIvMtU4Bl84u9JDrz01Ji1jNazsnF8adr+dVF+jLdbR2fGTmwc7qpTP+d8pXaQDZ0JKP7+JEwWF+/cBvOzdFzZ68zYP8iS9UbJ+LC0K4MBzw=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map domain
Thread-Topic: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map
 domain
Thread-Index: AQHXsCjEx0HGlBpA+Em1L92CXDXaB6uxe3AAgBj87fCAA0mcAIAC50BA
Date: Wed, 13 Oct 2021 07:44:25 +0000
Message-ID:
 <VE1PR08MB5215AAFF71A1A6CDE19A50EFF7B79@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-11-penny.zheng@arm.com>
 <c6730ec5-53c7-9bf2-4620-eefbc7c7c4a3@xen.org>
 <VE1PR08MB5215A1D5695F388F17C367D4F7B39@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <9237c85c-87d0-14ac-07ce-244958add7d3@xen.org>
In-Reply-To: <9237c85c-87d0-14ac-07ce-244958add7d3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 917768E1A65C7045B6851957F5030F27.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cc9335a8-36b5-4f77-7a85-08d98e1d502e
x-ms-traffictypediagnostic: VE1PR08MB4752:|AM9PR08MB6883:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB68839106B778169B63C24CBDF7B79@AM9PR08MB6883.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PEamti4gSrGagiq00Ot8S3iNXqGeo077h6DMgxg82j18Og9n8QjXOjmJRiDzLM420wV8053eXnwpVcR0yPqaBR9OvnPUM0vcSyNbEKnbyyKq45FMIxaSbkdEGlCLScpXR3TcD+xo6gOCuer71JICSmjxZGgPnso5fv5L94UtuupfY40X/jnkaetQS6vU+9AuH/qL4gjajr1dV5WgdvvR1ZLE0ord0bZamB9vKilp6dC2QXQjOCUMANCizbldyWkrygZT9NOh+tJj6LKrUlyMK5QzHVmXHU1Zm30TgIfnxCHe1MKTV92oK8BurAGSZKnp63ARxnR0cB++Gat+Q6pzvXwR6H72/HTZOxmF5k0PFVWp5rN0SnCHLzw00xXWm0tAySxM3Ga9eynyBjcTFin+ODGJ7WI1O/QzJf2RKszfcRaKHyxPGjNhNyYyyv1zXJKRemqNOlCaM+5D9Zdu9jLL/5bOqiOpL47EtwXvcW893TdO5lyfur2JkpRvo5vosXtEhKzqMadUpzJDsUEDGDa0sgpR+T+7T//rkW5WjC/xtjbMLMualKkOarnO3YYK8TgrNS9FJx37JmT7PNcplTtEa17+cuR6jAzQ47mwD/GVCQh2kBADCQK4RpKTdj9mSQinUtvTZKaZz1yYaR+84Fw3mdrqLga6jR91CWJraxJytts+Z+zoShezonIXucJczKWB8TNd7XcvjXl7/rfcSqnS2w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(53546011)(71200400001)(6506007)(64756008)(66476007)(66446008)(508600001)(66556008)(52536014)(76116006)(83380400001)(2906002)(38070700005)(9686003)(55016002)(8936002)(66946007)(33656002)(8676002)(86362001)(5660300002)(7696005)(122000001)(316002)(54906003)(38100700002)(110136005)(186003)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4752
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	28a49529-314d-41a4-9c39-08d98e1d47bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	42+oUETwkdaZbA5F4xHHlMJDjDmh0iBFzgx92ykatd4W0KDeL7WtkBbhTBNXzQ+m1SY6REh34bI+YQF7gzaMgVIiQSy6Vp9H1GEyAR466WzUKBdIHLe2hMGCeDKVkf7RvbpF3Hbxg7BN9o9K6puFSsX2Q1Vfqcjk6ql43YNQPc6k9Y3U7zPyWZOGSJVFNZx5RsMXsroH6bETWVxr1z+Yu6sVU7z7M6xdtuKvkObC2otjXoKC7f5mNrMdPxN6JRIn3HGW9/D95StmuAGDPdgsAztQfUukwjoDxXN7z9hzp3tNI1ILV7JSTHUpE5CihGmSvh7DmQuAvb+TikYKJLSKaMERanCo3M5XE99ChXZbamoG8RTNMl2DArnokfJoChOK0YXAwzrk3IH/nymllj0Kcv7EVTNFpTHTZlzeXTttFUaMmaQBCua3yxLGug+kl1t8GMPVvJ5+n5uHhyGk/MdH31PEqfUcPjBqctYtpVVK9TZajgrte7QYi8wVzaL4muiMZwSoLioTZlHRvWwnNT/hvG5HV6sXrpUv//RU8rWO+QrsWWpcSLDt3UOw4IWNgIdj0AOGYJPy589hnhmWzvG6vfNGE720KJ95qK/BqKmMuyDJIxHdlUwVEkqVBZAzZyhGUe3WaHHMc5v/7Odl/fbHno285Dg75xvkhB242o2tYU6pcD3CWzA7SPjmDxfghC5U
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(53546011)(508600001)(2906002)(4326008)(26005)(33656002)(186003)(6506007)(8676002)(83380400001)(336012)(8936002)(70206006)(55016002)(7696005)(9686003)(82310400003)(70586007)(47076005)(81166007)(36860700001)(316002)(110136005)(54906003)(5660300002)(356005)(86362001)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 07:44:39.9984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9335a8-36b5-4f77-7a85-08d98e1d502e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6883

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDExLCAyMDIx
IDc6MTQgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENj
OiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0K
PiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxMC8xMV0geGVuL2Fy
bTogZGV2aWNlIGFzc2lnbm1lbnQgb24gMToxIGRpcmVjdC1tYXANCj4gZG9tYWluDQo+IA0KPiAN
Cj4gDQo+IE9uIDA5LzEwLzIwMjEgMTA6NDAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEhpIEp1
bGllbg0KPiANCj4gSGkgUGVubnksDQo+IA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNl
bnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjMsIDIwMjEgNzoyNyBQTQ0KPiA+PiBUbzogUGVubnkg
WmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+Ow0KPiA+PiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gPj4gQ2M6IEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+ID4+IDxXZWkuQ2hlbkBh
cm0uY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDEwLzExXSB4ZW4vYXJtOiBkZXZpY2Ug
YXNzaWdubWVudCBvbiAxOjENCj4gPj4gZGlyZWN0LW1hcCBkb21haW4NCj4gPj4NCj4gPj4gSGks
DQo+ID4+DQo+ID4+IE9uIDIzLzA5LzIwMjEgMDg6MTEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+
Pj4gVXNlciBjb3VsZCBkbyBkZXZpY2UgcGFzc3Rocm91Z2gsIHdpdGgNCj4gPj4+ICJ4ZW4sZm9y
Y2UtYXNzaWduLXdpdGhvdXQtaW9tbXUiIGluIHRoZSBkZXZpY2UgdHJlZSBzbmlwcGV0LCBvbg0K
PiA+Pj4gdHJ1c3RlZCBndWVzdCB0aHJvdWdoIDE6MSBkaXJlY3QtbWFwLCBpZiBJT01NVSBhYnNl
bnQgb3IgZGlzYWJsZWQgb24NCj4gPj4gaGFyZHdhcmUuDQo+ID4+DQo+ID4+IEF0IHRoZSBtb21l
bnQsIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIHBhc3N0aHJvdWdoIGEgbm9uLURNQSBjYXBhYmxl
DQo+ID4+IGRldmljZSB3aXRoIGRpcmVjdC1tYXBwaW5nLiBBZnRlciB0aGlzIHBhdGNoLCB0aGlz
IGlzIGdvaW5nIHRvIGJlIGZvcmJpZGRlbi4NCj4gPj4NCj4gPj4+DQo+ID4+PiBJbiBvcmRlciB0
byBhY2hpZXZlIHRoYXQsIHRoaXMgcGF0Y2ggYWRkcyAxOjEgZGlyZWN0LW1hcCBjaGVjayBhbmQN
Cj4gPj4+IGRpc2FibGVzIGlvbW11LXJlbGF0ZWQgYWN0aW9uLg0KPiA+Pj4NCj4gPj4+IFNpZ25l
ZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+Pj4gLS0tDQo+
ID4+PiAgICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAxMiArKysrKysrKy0tLS0NCj4g
Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+
Pj4gYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgaW5kZXggYzkyZTUxMGFlNy4uOWE5ZDI1
MjJiNyAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4+PiBAQCAtMjA3MCwxNCAr
MjA3MCwxOCBAQCBzdGF0aWMgaW50IF9faW5pdA0KPiA+PiBoYW5kbGVfcGFzc3Rocm91Z2hfcHJv
cChzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPiA+Pj4gICAgICAgIGlmICggcmVzIDwgMCAp
DQo+ID4+PiAgICAgICAgICAgIHJldHVybiByZXM7DQo+ID4+Pg0KPiA+Pj4gKyAgICAvKg0KPiA+
Pj4gKyAgICAgKiBJZiB4ZW5fZm9yY2UsIHdlIGFsbG93IGFzc2lnbm1lbnQgb2YgZGV2aWNlcyB3
aXRob3V0IElPTU1VDQo+ID4+IHByb3RlY3Rpb24uDQo+ID4+PiArICAgICAqIEFuZCBpZiBJT01N
VSBpcyBkaXNhYmxlZCBvciBhYnNlbnQsIDE6MSBkaXJlY3QtbWFwIGlzDQo+ID4+PiArIG5lY2Vz
c2FyeSA+ICsNCj4gPj4gKi8NCj4gPj4+ICsgICAgaWYgKCB4ZW5fZm9yY2UgJiYgaXNfZG9tYWlu
X2RpcmVjdF9tYXBwZWQoa2luZm8tPmQpICYmDQo+ID4+PiArICAgICAgICAgIWR0X2RldmljZV9p
c19wcm90ZWN0ZWQobm9kZSkgKQ0KPiA+Pg0KPiA+PiBkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKCkg
d2lsbCBiZSBhbHdheXMgZmFsc2UgdW5sZXNzIHRoZSBkZXZpY2UgaXMNCj4gPj4gcHJvdGVjdGVk
IGJlaGluZyBhbiBTTU1VIHVzaW5nIHRoZSBsZWdhY3kgYmluZGluZy4gU28gSSBkb24ndCB0aGlu
aw0KPiA+PiB0aGlzIGlzIGNvcnJlY3QgdG8gbW92ZSB0aGlzIGNoZWNrIGFoZWFkLiBJbiBmYWN0
Li4NCj4gPj4NCj4gPj4+ICsgICAgICAgIHJldHVybiAwOw0KPiA+Pj4gKw0KPiA+Pj4gICAgICAg
IHJlcyA9IGlvbW11X2FkZF9kdF9kZXZpY2Uobm9kZSk7DQo+ID4+DQo+ID4+IC4uLiB0aGUgY2Fs
bCBzaG91bGQgYWxyZWFkeSBiZSBhIE5PUCB3aGVuIHRoZSBJT01NVSBpcyBkaXNhYmxlZCBvcg0K
PiA+PiB0aGUgZGV2aWNlIGlzIG5vdCBiZWhpbmQgYW4gSU9NTVUuIFNvIGNhbiB5b3UgZXhwbGFp
biB3aGF0IHlvdSBhcmUNCj4gPj4gdHJ5aW5nIHRvIHByZXZlbnQgaGVyZT8NCj4gPj4NCj4gPg0K
PiA+IElmIHRoZSBJT01NVSBpcyBkaXNhYmxlZCwgaW9tbXVfYWRkX2R0X2RldmljZSB3aWxsIHJl
dHVybiAxIGFzIGVycm5vLg0KPiA+IFNvIHdlIGNvdWxkIG5vdCBtYWtlIGl0IHRvIHRoZSB4ZW5f
Zm9yY2UgY2hlY2suLi4NCj4gDQo+IEkgZGlzYWdyZWUuIFRoZSBjaGVjayBpczoNCj4gDQo+IGlm
ICggcmVzIDwgMCApDQo+ICAgIHJldHVybiByZXM7DQo+IA0KPiBHaXZlbiB0aGF0IHJlcyBpcyAx
LCB3ZSB3b3VsZG4ndCByZXR1cm4gYW5kIG1vdmUgdG8gY2hlY2sgd2hldGhlciB0aGUNCj4gYXNz
aWdubWVudCBjYW4gYmUgZG9uZS4NCj4gDQo+ID4NCj4gPiBTbyBJIHRyaWVkIHRvIG1vdmUgYWxs
IElPTU1VIGFjdGlvbiBiZWhpbmQgeGVuX2ZvcmNlIGNoZWNrLg0KPiA+DQo+ID4gTm93LCBkZXZp
Y2UgYXNzaWdubWVudCB3aXRob3V0IElPTU1VIHByb3RlY3Rpb24gaXMgb25seSBhcHBsaWNhYmxl
IG9uDQo+ID4gZGlyZWN0LW1hcCBkb21haW5zLA0KPiANCj4gSXQgaXMgZmluZSB0byBhc3NpZ24g
YSBub24tRE1BIGNhcGFibGUgZGV2aWNlIHdpdGhvdXQgZGlyZWN0LW1hcHBpbmcuIFNvIHdoeQ0K
PiBkbyB5b3Ugd2FudCB0byBhZGQgdGhpcyByZXN0cmljdGlvbj8NCj4gDQoNCldoZW4gY29uc3Ry
dWN0aW5nIGRpcmVjdC1tYXAtdjIsIGZvdW5kIHRoYXQsIGluIHhlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYw0KDQppZiAoIGR0X2ZpbmRfY29tcGF0aWJsZV9ub2RlKG5vZGUsIE5VTEwsICJtdWx0
aWJvb3QsZGV2aWNlLXRyZWUiKSApDQogICAgZF9jZmcuZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZf
aW9tbXU7DQoNCkFuZCB0aGlzIGZsYWcgWEVOX0RPTUNUTF9DREZfaW9tbXUgZGV0ZXJtaW5lcyB3
aGV0aGVyIGlvbW11IGlzIGVuYWJsZWQuDQoNCkluIC4veGVuL2luY2x1ZGUveGVuL3NjaGVkLmgN
Cg0Kc3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBpc19pb21tdV9lbmFibGVkKGNvbnN0IHN0cnVj
dCBkb21haW4gKmQpDQp7DQogICAgcmV0dXJuIGV2YWx1YXRlX25vc3BlYyhkLT5vcHRpb25zICYg
WEVOX0RPTUNUTF9DREZfaW9tbXUpOw0KfQ0KDQpUaGF0IGlzLCBldmVuIGlmIHdlIGFzc2lnbiBh
IG5vbi1ETUEgY2FwYWJsZSBkZXZpY2UsIHdlIHJlcXVlc3QgdGhlIHBsYXRmb3JtIHRvIGJlDQpp
b21tdSBlbmFibGVkLg0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

