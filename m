Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B254C44292C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 09:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219768.380746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhoum-0004Yc-C1; Tue, 02 Nov 2021 08:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219768.380746; Tue, 02 Nov 2021 08:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhoum-0004WC-8W; Tue, 02 Nov 2021 08:13:04 +0000
Received: by outflank-mailman (input) for mailman id 219768;
 Tue, 02 Nov 2021 08:13:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uKY1=PV=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mhouk-0004W6-Rb
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 08:13:02 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b169e0ee-3bb4-11ec-8552-12813bfff9fa;
 Tue, 02 Nov 2021 08:13:00 +0000 (UTC)
Received: from AS9PR06CA0238.eurprd06.prod.outlook.com (2603:10a6:20b:45e::8)
 by AM0PR08MB5346.eurprd08.prod.outlook.com (2603:10a6:208:18b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 2 Nov
 2021 08:12:53 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::13) by AS9PR06CA0238.outlook.office365.com
 (2603:10a6:20b:45e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 08:12:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 08:12:52 +0000
Received: ("Tessian outbound c71e1a752bff:v108");
 Tue, 02 Nov 2021 08:12:52 +0000
Received: from df3d777992f3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E783DED4-69D0-4392-AF37-715FDB01C0F3.1; 
 Tue, 02 Nov 2021 08:12:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df3d777992f3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 Nov 2021 08:12:41 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB4042.eurprd08.prod.outlook.com (2603:10a6:10:a4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 08:12:36 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b974:8325:d5ae:e8a5]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b974:8325:d5ae:e8a5%3]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 08:12:36 +0000
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
X-Inumbo-ID: b169e0ee-3bb4-11ec-8552-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hhqt3niYVFaBlGRpsrAzh7ttFnbSL9kb2AM6z+dRzZY=;
 b=U4RR3c7rNsoLT7JTp3TxqfXtp/WWt0ADl6wuhZPEH7xIxFxox3sKN3Cztu270bEo3R2q+8lQaHMRVHRXwUi1mfXYQmZkVgIEOChIZVClc3FG7YMi41hTwYLhgsAw/J0AAVwfcR8Z6PitB76ew8iBr+ke+AuJ5YVvDSwjjhmIYFQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXMHgm5jGfxjl1jr6yZ+dk+uU4k1q1cO4MHaNqfVK9iSd6a1/mBPcAf/needcQC9yi4mfau/mKR4DnuFsPcMtz6rkczy/533bBPhCSaA2nO8mFuuzW+fPXSf0HIaZZHvLWvpgXn2vTaRQk/M40flHFrYCFcF6OWKzf/Q8ErHrdiIY4HQxTUqF4KTgtSepR/+FFfjqI2gqbY61Tw1ER9ixB6laR/P0OJcCZ4wKgmM7noJHCqCJYaYjVHP33dYm88sxQzI7pePqgDcQxctwadzj3OtRaZ6/N5TVRROQU+WECHsM9kqNM7MBJpxnTaG/84TZ1EmIVjxO06f1a5vlmRraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hhqt3niYVFaBlGRpsrAzh7ttFnbSL9kb2AM6z+dRzZY=;
 b=n2/kM630pGLs3AkmKkTcO9VQHf+Wx4G9mzRGhNelX7JvhFZoA4jB1eNl+QschRg41tEMJ9B9xoQTeYSj8ziWYiKdmPXDixEUAVUCS+DvAFg9dOh+HTyjS6NJEcneOW9QcRt43Y3pLdXQU98gRwG+KDi6x4B1j67ns5+WCo9P/3pAX6GbzSB8hC0IxQrHW67SQ49eM0nj8UIVn+Xrdiq4J7LBNLHzQTCJIocYQ6fQ2sz0qieEdVTHXP2+E2hz63SLgWLMVAAAL4rQTrueax2zGl9xRvBPkDQBGYeTwJ7YUWDxigyXrUQy3DcYgnRN4WuX1P5ydSYA6jeTbQWagOq85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hhqt3niYVFaBlGRpsrAzh7ttFnbSL9kb2AM6z+dRzZY=;
 b=U4RR3c7rNsoLT7JTp3TxqfXtp/WWt0ADl6wuhZPEH7xIxFxox3sKN3Cztu270bEo3R2q+8lQaHMRVHRXwUi1mfXYQmZkVgIEOChIZVClc3FG7YMi41hTwYLhgsAw/J0AAVwfcR8Z6PitB76ew8iBr+ke+AuJ5YVvDSwjjhmIYFQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Rahul Singh <Rahul.Singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Topic: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Index:
 AQHXywxEi4qDbqc+90GgeRggTtEvJ6vnHBEAgAE3IICAABhAgIAADT0AgAAb4ACAAB9RgIAA5K2AgASg3QCAAamUAIAAAnSAgAAHIzA=
Date: Tue, 2 Nov 2021 08:12:36 +0000
Message-ID:
 <DB9PR08MB68573DA7157BD153B4C51A7D9E8B9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <YXqnS7iZUvokJby6@Air-de-Roger>
 <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
 <YXrJyLMiMxaNmFAs@Air-de-Roger>
 <5de6c2f1-ef5c-9d8c-4287-9b0e3ff08b34@epam.com>
 <YXuj4frtHIRuSgOO@Air-de-Roger>
 <0ba7aa82-40bc-c0d3-38a2-8c4d141d0afd@epam.com>
 <74ea74b7-d9e9-a030-753d-a1108cc244d0@arm.com>
 <eae1776e-79ea-e219-741d-632aeceeeb12@epam.com>
In-Reply-To: <eae1776e-79ea-e219-741d-632aeceeeb12@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 70825D5C9D13F749AB108CABCC68CB92.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b8ed0907-6665-4ab9-9238-08d99dd89187
x-ms-traffictypediagnostic: DB8PR08MB4042:|AM0PR08MB5346:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB534697DEF5D0207A89A75AA29E8B9@AM0PR08MB5346.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aPmIXatLfMtXA1KEXQuE3xXLvUQFcAjdmcXjiAI+TjyCEkoe3/x7SLeBKlAiHFhGZVhJDghf/vHbfGxmFWqQoAOZzT3DDpDXJmmml7OBW4vM5dv2tpZgSGRvbIwgFrtN6tdUszri56p/DZVzee56U3o5g4MyFSPHQRHGNDxRXWjmfLBljfMF5wqTrhay8iQc2jE/pA1KkfcwxQ6rITGrX3TygdjGTzrvKKXP+9sWDKS+lv++mVamlXhQ6nyOyxfO2SXSC4LetMqJjYxZynd0AeL4/c1Ccs0dMSp50ArEZEdlas2kVYlXr9oldhEedWmk0/UYxBSEpqggwCf6hir7C/yHXGzTv8foI4slgkMJSB4qwIm2iyZgY1gvNrDb0iOebBq0Oj85YGO/M4gNK3/uaS8TiBBgzaUE6fBpNYADNQkgTZ6z9KwTEM5YiWv00kd8VrEZTYzw1J0TyzZSWpperQ77r8nSXO3FUYrB5I7OD0pItkOzC8tfoH7osA57Vondp3+pVamma36B00L3SxfXLcq1Z28TeGJmhTHu+WUriXXxbnC7VVUQ5aF39g60IA6JRdHMOKMbZsKmXbfz/Fw06NIBWVLZT9ZgQQ6dSJ51YRCt6eXJOdUMDS91GVxWfR4ZC00PqGv0+5X3AgbLH+4JIYUlXj7rxgTxa7M+zVwjDLl3SLNrWuuT6JHD1851XoKGA5ZcUjSZSlF9waqmp3dbSA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(9686003)(26005)(66446008)(76116006)(66946007)(6506007)(508600001)(55016002)(52536014)(186003)(8676002)(4326008)(86362001)(64756008)(66556008)(66476007)(7696005)(71200400001)(54906003)(316002)(33656002)(110136005)(2906002)(38070700005)(53546011)(8936002)(83380400001)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4042
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f00df49-5859-4fe8-6692-08d99dd887b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nAJiiYFiP4PGYD2Uj18arh7RzKaz7RcAkrX2ZPLLuiytIpG8jm+ENZX7rCmmpO6ULGOqveqKSMYUM1C4jzo7i8Sh6F7ZIMkYQJweaC4BI8iG3Uuv9DGS0lTPzxcPhuRW3TLNDJYvZ69EMBmO1fhRP4RAXGBaEZIXsB8NVKvMlNb+g3NtCvxNwXxa7JaAiy3agjoC6fOsDMt1vrFxjMz2brS+omq2WrJn2Cz+WAuonngub/y/PTNTKkUlqQwN4EXhXoFF9V68FcrkmNnBph5pAmbH9Iwgg2i0+Sb3NDcttqzFP3F9suQQcYPnuyEs9qDOr2vCVBqVGtHAm6now1TOBPL6JFVRCZ1IjVL5AE29FFMAaTPTb8FmEt9A/B4LNem8lpVO1b6U0xEUAwssGOm1au23PMuYzrne0OZRL19JkPV6vKHRfL4OmGINDdPFB3ry7BsE+tKOHXEn96BDTp+3CmCgachp21XHmk3+p0mEVG8v9wzFLkYN25vA6zSvMdqKN9nzKP5TmdRbTER/xRegBolt/POT9mSB3edof2hQ2BANPAt7KTG0c24M28ymBRz3VF9fDgOypfxtpRXQqyx53V0By8ZABvqbEwBjRY4LkmYPStPg0a85xcXYgjGkzEZXFmWowaYVMkWquXb2agBttEvuPW7+Rba6uWG4G5fgS8tXinX2g3wceArdShrsJ2ePK5WMah/MxKlDhF1IfuIdIg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(52536014)(70586007)(2906002)(82310400003)(83380400001)(47076005)(6506007)(4326008)(54906003)(110136005)(5660300002)(8676002)(86362001)(26005)(316002)(53546011)(70206006)(356005)(186003)(508600001)(33656002)(81166007)(55016002)(8936002)(336012)(36860700001)(9686003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 08:12:52.8314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ed0907-6665-4ab9-9238-08d99dd89187
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5346

SGkgT2xla3NhbmRyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxPbGVrc2FuZHJfQW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4gU2VudDogMjAyMeW5tDEx5pyIMuaXpSAxNTo0Nw0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVu
QGFybS5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ2M6
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+OyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBSYWh1bCBTaW5n
aA0KPiA8UmFodWwuU2luZ2hAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ZW4vYXJtOiBmaXggU0JERiBjYWxjdWxhdGlvbiBm
b3IgdlBDSSBNTUlPIGhhbmRsZXJzDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDAyLjExLjIxIDA5OjM3
LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBIaSBPbGVrc2FuZHIsDQo+ID4NCj4gPiBPbiAyMDIxLzEx
LzEgMTQ6MTQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPiA+Pg0KPiA+Pg0KPiA+
PiBPbiAyOS4xMC4yMSAxMDozMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gPj4+IE9uIFRo
dSwgT2N0IDI4LCAyMDIxIGF0IDA1OjU1OjI1UE0gKzAwMDAsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvDQo+IHdyb3RlOg0KPiA+Pj4+DQo+ID4+Pj4gT24gMjguMTAuMjEgMTk6MDMsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6DQo+ID4+Pj4+IE9uIFRodSwgT2N0IDI4LCAyMDIxIGF0IDAyOjIzOjM0
UE0gKzAwMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvDQo+IHdyb3RlOg0KPiA+Pj4+Pj4gT24g
MjguMTAuMjEgMTY6MzYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+ID4+Pj4+Pj4gT24gVGh1
LCBPY3QgMjgsIDIwMjEgYXQgMTI6MDk6MjNQTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28NCj4gd3JvdGU6DQo+ID4+Pj4+Pj4+IEhpLCBKdWxpZW4hDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+
Pj4+IE9uIDI3LjEwLjIxIDIwOjM1LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4+Pj4+Pj4+PiBI
aSBPbGVrc2FuZHIsDQo+ID4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4gT24gMjcvMTAvMjAyMSAwOToy
NSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+ID4+Pj4+Pj4+Pj4gRnJvbTogT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0K
PiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gV2hpbGUgaW4gdlBDSSBNTUlPIHRyYXAgaGFuZGxl
cnMgZm9yIHRoZSBndWVzdCBQQ0kgaG9zdCBicmlkZ2UNCj4gaXQgaXMgbm90DQo+ID4+Pj4+Pj4+
Pj4gZW5vdWdoIGZvciBTQkRGIHRyYW5zbGF0aW9uIHRvIHNpbXBseSBjYWxsIFZQQ0lfRUNBTV9C
REYoaW5mby0NCj4gPmdwYSkgYXMNCj4gPj4+Pj4+Pj4+PiB0aGUgYmFzZSBhZGRyZXNzIG1heSBu
b3QgYmUgYWxpZ25lZCBpbiB0aGUgd2F5IHRoYXQgdGhlDQo+IHRyYW5zbGF0aW9uDQo+ID4+Pj4+
Pj4+Pj4gYWx3YXlzIHdvcmsuIElmIG5vdCBhZGp1c3RlZCB3aXRoIHJlc3BlY3QgdG8gdGhlIGJh
c2UgYWRkcmVzcw0KPiBpdCBtYXkgbm90IGJlDQo+ID4+Pj4+Pj4+Pj4gYWJsZSB0byBwcm9wZXJs
eSBjb252ZXJ0IFNCREYgYW5kIGNyYXNoZXM6DQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiAo
WEVOKSB2cGNpX21taW9fcmVhZCAwMDAwOjY1OjFhLjAgcmVnIDhiYyBncGEgZTY1ZDA4YmMNCj4g
Pj4+Pj4+Pj4+IEkgY2FuJ3QgZmluZCBhIHByaW50aygpIHRoYXQgbWF5IG91dHB1dCB0aGlzIG1l
c3NhZ2UuIFdoZXJlIGRvZXMNCj4gdGhpcyBjb21lcyBmcm9tPw0KPiA+Pj4+Pj4+PiBUaGF0IHdh
cyBhIGRlYnVnIHByaW50LiBJIHNob3VsZG4ndCBoYXZlIHVzZWQgdGhhdCBpbiB0aGUgcGF0Y2gN
Cj4gZGVzY3JpcHRpb24sIGJ1dA0KPiA+Pj4+Pj4+PiBwcm9iYWJseSBhZnRlciAiLS0tIiB0byBi
ZXR0ZXIgZXhwbGFpbiB3aGF0J3MgaGFwcGVuaW5nDQo+ID4+Pj4+Pj4+PiBBbnl3YXksIElJVUMg
dGhlIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MgaXMgMHhlNjVkMDhiYyB3aGljaCwgaWYNCj4gSSBh
bSBub3QgbWlzdGFrZW4sIGRvZXNuJ3QgYmVsb25nIHRvIHRoZSByYW5nZSBhZHZlcnRpc2VkIGZv
cg0KPiBHVUVTVF9WUENJX0VDQU0uDQo+ID4+Pj4+Pj4+IFRoaXMgaXMgZnJvbSBkb20wIEkgYW0g
d29ya2luZyBvbiBub3cuDQo+ID4+Pj4+Pj4+PiBJTUhPLCB0aGUgc3RhY2sgdHJhY2Ugc2hvdWxk
IGNvbWUgZnJvbSB1c3B0cmVhbSBYZW4gb3IgbmVlZCBzb21lDQo+IGluZm9ybWF0aW9uIHRvIGV4
cGxhaW4gaG93IHRoaXMgd2FzIHJlcHJvZHVjZWQuDQo+ID4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+
IChYRU4pIERhdGEgQWJvcnQgVHJhcC4gU3luZHJvbWU9MHg2DQo+ID4+Pj4+Pj4+Pj4gKFhFTikg
V2Fsa2luZyBIeXBlcnZpc29yIFZBIDB4NDY3YTI4YmMgb24gQ1BVMCB2aWEgVFRCUg0KPiAweDAw
MDAwMDAwNDgxZDUwMDANCj4gPj4+Pj4+Pj4+IEkgY2FuIHVuZGVyc3RuYWQgdGhhdCBpZiB3ZSBk
b24ndCBzdWJzdHJhY3QgR1VFU1RfVlBDSV9FQ0FNLCB3ZQ0KPiB3b3VsZCAoaW4gdGhlb3J5KSBu
b3QgZ2V0IHRoZSBjb3JyZWN0IEJERi4gQnV0Li4uIEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cNCj4g
dGhpcyB3b3VsZCByZXN1bHQgdG8gYSBkYXRhIGFib3J0IGluIHRoZSBoeXBlcnZpc29yLg0KPiA+
Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+IEluIGZhY3QsIEkgdGhpbmsgdGhlIHZQQ0kgY29kZSBzaG91
bGQgYmUgcmVzaWxpZW50IGVub3VnaCB0byBub3QNCj4gY3Jhc2ggaWYgd2UgcGFzcyB0aGUgd3Jv
bmcgQkRGLg0KPiA+Pj4+Pj4+PiBXZWxsLCB0aGVyZSBpcyBubyAoPykgZWFzeSB3YXkgdG8gdmFs
aWRhdGUgU0JERi4gQW5kIHRoaXMgY291bGQNCj4gYmUgYSBwcm9ibGVtIGlmIHdlIGhhdmUgYSBt
aXNiZWhhdmluZw0KPiA+Pj4+Pj4+PiBndWVzdCB3aGljaCBtYXkgZm9yY2UgWGVuIHRvIGFjY2Vz
cyB0aGUgbWVtb3J5IGJleW9uZCB0aGF0IG9mIFBDSQ0KPiBob3N0IGJyaWRnZQ0KPiA+Pj4+Pj4+
IEhvdyBjb3VsZCB0aGF0IGJlPyBUaGUgRUNBTSByZWdpb24gZXhwb3NlZCB0byB0aGUgZ3Vlc3Qg
eW91IHNob3VsZA0KPiBiZQ0KPiA+Pj4+Pj4+IHRoZSBzYW1lIGFzIHRoZSBwaHlzaWNhbCBvbmUg
Zm9yIGRvbTA/DQo+ID4+Pj4+PiBPaywgSSBoYXZlIGEgRGVzaWdud2FyZSBQQ0kgaGlzdCB3aGlj
aCBoYXMgMiBFQ0FNIHJlZ2lvbnMgKEkgYW0NCj4gc3RhcnRpbmcgdG8NCj4gPj4+Pj4+IGltcGxl
bWVudCB0aGUgZHJpdmVyIGZvciBpdCwgc28gSSBjYW4gYmUgd3JvbmcgaGVyZSk6DQo+ID4+Pj4+
PiAtIFJvb3QgQ29tcGxleCBFQ0FNIGFyZWEgKCJkYmkiKSwgaXQgaXMgc29tZXRoaW5nIGxpa2Ug
MHgzMDAwIGJ5dGVzDQo+IGxvbmcNCj4gPj4+Pj4+IC0gIkNsaWVudCIgRUNBTSBhcmVhICgiY29u
ZmlnIikNCj4gPj4+Pj4+IFNvIGZyb20gRG9tMCBQT1Ygd2UgaGF2ZSAyIEVDQU0gcmVnaW9ucyBh
bmQgZm9yIHRoZSBndWVzdA0KPiA+Pj4+Pj4gd2UgYWx3YXlzIGVtdWxhdGUgYSBzaW5nbGUgYmln
IHJlZ2lvbjoNCj4gPj4+Pj4gWW91IG5lZWQgc3VwcG9ydCBmb3IgbXVsdGlwbGUgRUNBTSByZWdp
b25zLiBUaGF0J3MgaG93IHdlIGRvIGl0IG9uDQo+IHg4Ng0KPiA+Pj4+PiBQVkggZG9tMC4gU2Vl
IHJlZ2lzdGVyX3ZwY2lfbW1jZmdfaGFuZGxlciBhbmQgcmVsYXRlZCBtYWNoaW5lcnkuDQo+ID4+
Pj4gSXMgaXQgY29tbW9uIGZvciBhIFBDSSBob3N0IGJyaWRnZSB0byBoYXZlIG11bHRpcGxlIEVD
QU0gcmVnaW9ucz8NCj4gPj4+PiBDdXJyZW50bHkgb24gQXJtIHdlIHdlcmUgYWJvdXQgdG8gc3Vw
cG9ydCAicGNpLWhvc3QtZWNhbS1nZW5lcmljIiBbMV0sDQo+ID4+Pj4gZS5nLiBnZW5lcmljIEVD
QU0gaG9zdCBicmlkZ2Ugd2hpY2ggbm9ybWFsbHkgKD8pIGhhcyBhIHNpbmdsZSBFQ0FNDQo+ID4+
Pj4gcmVnaW9uIFsyXS4gQnV0IHRoZSBob3N0IGJyaWRnZSBJIHdhbnQgdG8gc3VwcG9ydCBoYXMg
bXVsdGlwbGUsIHNvDQo+ID4+Pj4gc3RyaWN0bHkgc3BlYWtpbmcgaXQgaXMgbm90IHRoZSBvbmUg
dGhhdCB3ZSBpbXBsZW1lbnQuDQo+ID4+PiBJdCdzIHBvc3NpYmxlIG9uIHg4NiB0byBoYXZlIG11
bHRpcGxlIEVDQU0gcmVnaW9ucywgd2hldGhlciB0aGF0IG1lYW5zDQo+ID4+PiBtdWx0aXBsZSBo
b3N0IGJyaWRnZXMsIG9yIGhvc3QgYnJpZGdlcyBoYXZpbmcgbXVsdGlwbGUgRUNBTSByZWdpb25z
IGlzDQo+ID4+PiB1bmtub3duIHRvIG1lLiBJdCdzIGFsbCByZXBvcnRlZCBpbiB0aGUgTUNGRyBB
Q1BJIHRhYmxlIChzZWUgUENJDQo+ID4+PiBGaXJtd2FyZSBkb2N1bWVudCBmb3IgdGhlIGRldGFp
bGVkIGRlc2NyaXB0aW9uIG9mIE1DRkcpIHVzaW5nIHRoZQ0KPiA+Pj4gIkNvbmZpZ3VyYXRpb24g
U3BhY2UgQmFzZSBBZGRyZXNzIEFsbG9jYXRpb24gU3RydWN0dXJlIiwgYW5kIHRoZXJlIGNhbg0K
PiA+Pj4gYmUgbXVsdGlwbGUgb2YgdGhvc2Ugc3RydWN0dXJlcy4NCj4gPj4gQXMgd2UgYXJlIGN1
cnJlbnRseSBzdXBwb3J0aW5nIGdlbmVyaWMgRUNBTSBob3N0IGJyaWRnZSB3aGljaA0KPiA+PiBo
YXMgYSBzaW5nbGUgRUNBTSByZWdpb24gSSB0aGluayB0aGUgZXhpc3RpbmcgY29kZSB3ZSBoYXZl
IGFuZA0KPiA+PiBhYm91dCB0byB1cHN0cmVhbSBpcyBvayBhcyBpcyBmb3Igbm93Lg0KPiA+PiBJ
IG93biBhIGJyaWRnZSB3aGljaCBoYXMgMiBFQ0FNIHJlZ2lvbnMsIHNvIEkgd2lsbCB3b3JrIHRv
d2FyZHMNCj4gPj4gYWRkaW5nIGl0cyBzdXBwb3J0IHNvb24uDQo+ID4+Pg0KPiA+Pj4+IEFybSBm
b2xrcywgZG8gd2Ugd2FudCB0aGlzIGdlbmVyYWxpemF0aW9uIGF0IHRoaXMgbW9tZW50IHRvIGFs
aWduDQo+IHdpdGggeDg2DQo+ID4+Pj4gd2l0aCB0aGlzIHJlc3BlY3Q/DQo+ID4+Pj4NCj4gPj4+
PiBXZSBjYW4gbGl2ZSB3aXRoIHRoZSBjdXJyZW50IGFwcHJvYWNoIGFuZCB3aGVuIEkgaGF2ZSBt
eSBkcml2ZXINCj4gaW1wbGVtZW50ZWQNCj4gPj4+PiBJIGNhbiBzZW5kIHBhdGNoZXMgdG8gbWFr
ZSB0aGF0IGdlbmVyYWxpemF0aW9uLg0KPiA+Pj4+Pj4gLyoNCj4gPj4+Pj4+IMKgwqDCoCDCoCog
MjU2IE1CIGlzIHJlc2VydmVkIGZvciBWUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UgYmFzZWQgb24N
Cj4gY2FsY3VsYXRpb24NCj4gPj4+Pj4+IMKgwqDCoCDCoCogMjU2IGJ1c2VzIHggMzIgZGV2aWNl
cyB4IDggZnVuY3Rpb25zIHggNCBLQiA9IDI1NiBNQg0KPiA+Pj4+Pj4gwqDCoMKgIMKgKi8NCj4g
Pj4+Pj4+ICNkZWZpbmUgR1VFU1RfVlBDSV9FQ0FNX0JBU0UgeGVuX21rX3VsbG9uZygweDEwMDAw
MDAwKQ0KPiA+Pj4+Pj4gI2RlZmluZSBHVUVTVF9WUENJX0VDQU1fU0laRSB4ZW5fbWtfdWxsb25n
KDB4MTAwMDAwMDApDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gU28sIHdlIGhhdmUgdGhlIGJhc2UgYWRk
cmVzcyBhbmQgc2l6ZSBvZiB0aGUgZW11bGF0ZWQgRUNBTSBzcGFjZQ0KPiA+Pj4+Pj4gbm90IGNv
bm5lY3RlZCB0byB0aGUgcmVhbCBob3N0IGJyaWRnZQ0KPiA+Pj4+Pj4+IEFuZCBmb3IgZG9tVXMg
eW91IHJlYWxseSBuZWVkIHRvIGZpeCB2cGNpX3tyZWFkLHdyaXRlfSB0byBub3QNCj4gPj4+Pj4+
PiBwYXNzdGhyb3VnaCBhY2Nlc3NlcyBub3QgZXhwbGljaXRseSBoYW5kbGVkLg0KPiA+Pj4+Pj4g
RG8geW91IG1lYW4gdGhhdCB3ZSBuZWVkIHRvIHZhbGlkYXRlIFNCREZzIHRoZXJlPw0KPiA+Pj4+
Pj4gVGhpcyBjYW4gYmUgdHJpY2t5IGlmIHdlIGhhdmUgYSB1c2UtY2FzZSB3aGVuIGEgUENJIGRl
dmljZSBiZWluZw0KPiA+Pj4+Pj4gcGFzc2VkIHRocm91Z2ggaWYgbm90IHB1dCBhdCAwMDAwOjAw
OjAuMCwgYnV0IHJlcXVlc3RlZCB0byBiZSwgZm9yDQo+ID4+Pj4+PiBleGFtcGxlLCAwMDAwOjBk
OjAuMC4gU28sIHdlIG5lZWQgdG8gZ28gb3ZlciB0aGUgbGlzdCBvZiB2aXJ0dWFsDQo+ID4+Pj4+
PiBkZXZpY2VzIGFuZCBzZWUgaWYgU0JERiB0aGUgZ3Vlc3QgaXMgdHJ5aW5nIHRvIGFjY2VzcyBp
cyBhIHZhbGlkDQo+IFNCREYuDQo+ID4+Pj4+PiBJcyB0aGlzIHdoYXQgeW91IG1lYW4/DQo+ID4+
Pj4+IE5vLCB5b3UgbmVlZCB0byBwcmV2ZW50IGFjY2Vzc2VzIHRvIHJlZ2lzdGVycyBub3QgZXhw
bGljaXRseSBoYW5kbGVkDQo+ID4+Pj4+IGJ5IHZwY2kuIEllOiBkbyBub3QgZm9yd2FyZCB1bmhh
bmRsZWQgYWNjZXNzZXMgdG8NCj4gPj4+Pj4gdnBjaV97cmVhZCx3cmllfV9odykuDQo+ID4+Pj4g
SSBzZWUsIHNvIHRob3NlIHdoaWNoIGhhdmUgbm8gaGFuZGxlcnMgYXJlIG5vdCBwYXNzZWQgdG8g
dGhlIGhhcmR3YXJlLg0KPiA+Pj4+IEkgbmVlZCB0byBzZWUgaG93IHRvIGRvIHRoYXQNCj4gPj4+
IEluZGVlZC4gV2l0aG91dCBmaXhpbmcgdGhhdCBwYXNzdGhyb3VnaCB0byBkb21VcyBpcyBjb21w
bGV0ZWx5IHVuc2FmZSwNCj4gPj4+IGFzIHlvdSBhbGxvdyBkb21VcyBmdWxsIGFjY2VzcyB0byBy
ZWdpc3RlcnMgbm90IGV4cGxpY2l0bHkgaGFuZGxlZCBieQ0KPiA+Pj4gY3VycmVudCB2UENJIGNv
ZGUuDQo+ID4+IFdlbGwsIG15IHVuZGVyc3RhbmRpbmcgaXM6IHdlIGNhbiBsZXQgdGhlIGd1ZXN0
IGFjY2VzcyB3aGF0ZXZlcg0KPiA+PiByZWdpc3RlcnMgaXQgd2FudHMgd2l0aCB0aGUgZm9sbG93
aW5nIGV4Y2VwdGlvbnM6DQo+ID4+IC0gInNwZWNpYWwiIHJlZ2lzdGVycyB3ZSBhbHJlYWR5IHRy
YXAgaW4gdlBDSSwgZS5nLiBjb21tYW5kLCBCQVJzDQo+ID4+IC0gd2UgbXVzdCBub3QgbGV0IHRo
ZSBndWVzdCBnbyBvdXQgb2YgdGhlIGNvbmZpZ3VyYXRpb24gc3BhY2Ugb2YgYQ0KPiA+PiBzcGVj
aWZpYyBQQ0kgZGV2aWNlLCBlLmcuIHByZXZlbnQgaXQgZnJvbSBhY2Nlc3NpbmcgY29uZmlndXJh
dGlvbg0KPiA+PiBzcGFjZXMgb2Ygb3RoZXIgZGV2aWNlcy4NCj4gPj4gVGhlIHJlc3QgYWNjZXNz
ZXMgc2VlbSB0byBiZSBvayB0byBtZSBhcyB3ZSBkbyBub3QgcmVhbGx5IHdhbnQ6DQo+ID4+IC0g
aGF2ZSBoYW5kbGVycyBhbmQgZW11bGF0ZSBhbGwgcG9zc2libGUgcmVnaXN0ZXJzDQo+ID4+IC0g
d2UgZG8gbm90IHdhbnQgdGhlIGd1ZXN0IHRvIGZhaWwgaWYgaXQgYWNjZXNzZXMgYSB2YWxpZCBy
ZWdpc3Rlcg0KPiB3aGljaA0KPiA+PiB3ZSBkbyBub3QgZW11bGF0ZS4NCj4gPg0KPiA+IEkgYW0g
dHJpbmcgdG8gcmV2aWV3IHlvdXIgcGF0Y2gsIHBsZWFzZSBwb2ludCBvdXQgaWYgdGhlcmUgaXMg
YW55dGhpbmcNCj4gPiB3cm9uZy4gSUlVQywgdlBDSSBvbmx5IGVtdWxhdGVzIHNvbWUgcmVnaXN0
ZXJzLCBhbmQgZm9yd2FyZCB1bmhhbmRsZWQNCj4gPiBhY2Nlc3NlcyB0byBwaHlzaWNhbCBkZXZp
Y2UgY29uZmlndXJhdGlvbiBzcGFjZSAoaWYgdGhlIGFjY2Vzc2VzIHBhc3NlZA0KPiB0aGUgdmFs
aWRhdGUuKT8NCj4gUmlnaHQNCj4gPiBEb2VzIHRoYXQgbWFrZSB0aGUgY29udGV4dCBpbmNvbnNp
c3RlbnQgaW4gcGh5c2ljYWwgZGV2aWNlJ3MNCj4gY29uZmlndXJhdGlvbiBzcGFjZT8NCj4gSXQg
aXMgYWx3YXlzIGNvbnNpc3RlbnQgZm9yIHRoZSBoYXJkd2FyZSBkb21haW4gYW5kIHNvbWUgcGFy
dHMgb2YgaXQgYXJlDQo+IGVtdWxhdGVkDQo+IGZvciBndWVzdHMNCj4gPiBGb3IgZXhhbXBsZSwg
b25lIHJlZ2lzdGVyIGluIHBoeXNpY2FsIGRldmljZQ0KPiA+IGNvbmZpZyBzcGFjZSBpcyByZWxh
dGVkIHRvIGFub3RoZXIgcmVnaXN0ZXIuIEJ1dCB3ZSBqdXN0IGVtdWxhdGUNCj4gPiBvbmx5IG9u
ZSBpbiB2UENJPw0KPiBTbywgd2UgdHJhcCBmb3IgYWxsIGRvbWFpbnMgYW5kIGVtdWxhdGUgZm9y
IGd1ZXN0cywgZS5nLiBoYXJkd2FyZSBkb21haW4ncw0KPiB2aWV3IG9uIHRoZQ0KPiByZWdpc3Rl
cnMgaXMgY29uc2lzdGVudC4gRm9yIGd1ZXN0cyB3ZSBlbXVsYXRlOg0KPiAtIFBDSV9DT01NQU5E
IC0gbm90IHRvIGFsbG93IElOVHggYXMgd2UgZG8gbm90IHN1cHBvcnQgdGhhdCBvbiBBcm0NCj4g
LSBCQVJzIC0gd2UgZW11bGF0ZSBndWVzdCdzIHZpZXcgb24gdGhlc2UgYWNjb3JkaW5nIHRvIHRo
ZSBtZW1vcnkgc3BhY2VzDQo+IG9mIHRoZSBlbXVsYXRlZCBob3N0IGJyaWRnZSwgc28gdGhlIHJl
YWwgQkFScyBzdGlsbCBoYXZlIHBoeXNpY2FsIHZhbHVlcywNCj4gYnV0DQo+IGd1ZXN0cyBzZWUg
ZW11bGF0ZWQgb25lcw0KPiANCj4gSG9wZSB0aGlzIGhlbHBzDQoNClRoYW5rcywgaXQncyB2ZXJ5
IGhlbHBmdWwhDQoNCj4gPg0KPiA+DQo+ID4+Pg0KPiA+Pj4gUmVnYXJkcywgUm9nZXIuDQo+ID4+
Pg0KPiA+PiBUaGFua3MsDQo+ID4+IE9sZWtzYW5kcg0KPiA+Pg0K

