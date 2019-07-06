Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4B612A4
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 20:21:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjpHJ-0007Bq-54; Sat, 06 Jul 2019 18:19:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vVoM=VD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hjpHH-0007Bj-TW
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 18:19:15 +0000
X-Inumbo-ID: 8e847e7d-a01a-11e9-8980-bc764e045a96
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::60f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8e847e7d-a01a-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 18:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sx6cnmnTslyI3dqDy7A6ziNHIAoLAnxTIDYv8o8s1Sg=;
 b=Jb5FwM6XLWPJ0w6U7PgS9TAMhNlof/pbhh2VgO/3MtZXVVp9wOrYYjZ3sSgwrP0eM4o4Lx49DHGNoYB4tKH/keurs4EHOZqS/Q6NsSeGs2iK8lfXUuVrE/YK3393KL4O9YT72c4hJKqwpQaW5chOvFw3H2WoJfdKudNKW5GIjYw=
Received: from AM6PR08MB5271.eurprd08.prod.outlook.com (10.255.123.151) by
 AM6PR08MB3223.eurprd08.prod.outlook.com (52.135.164.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Sat, 6 Jul 2019 18:19:12 +0000
Received: from AM6PR08MB5271.eurprd08.prod.outlook.com
 ([fe80::710f:e30c:686f:6d02]) by AM6PR08MB5271.eurprd08.prod.outlook.com
 ([fe80::710f:e30c:686f:6d02%5]) with mapi id 15.20.2052.019; Sat, 6 Jul 2019
 18:19:12 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Will Abele <will.abele@starlab.io>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/1] Dom0less guest device tree format
Thread-Index: AQHVNCT8i/e9XHQvKUuqip9pKzLNp6a95d0AgAAAdQA=
Date: Sat, 6 Jul 2019 18:19:12 +0000
Message-ID: <c3dd311a-732a-68e8-5b3d-0aa7dd8773c7@arm.com>
References: <cover.1562435004.git.will.abele@starlab.io>
 <41ff241e-aa17-6033-25b0-80da519cd444@arm.com>
In-Reply-To: <41ff241e-aa17-6033-25b0-80da519cd444@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0202CA0021.eurprd02.prod.outlook.com
 (2603:10a6:8:1::34) To AM6PR08MB5271.eurprd08.prod.outlook.com
 (2603:10a6:20b:ef::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2715907-6c8c-4ecc-d10f-08d7023e7218
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB3223; 
x-ms-traffictypediagnostic: AM6PR08MB3223:
x-microsoft-antispam-prvs: <AM6PR08MB3223F2CB9DB97B572F5F00CD80F40@AM6PR08MB3223.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(189003)(199004)(66946007)(73956011)(44832011)(229853002)(66476007)(66066001)(31686004)(2501003)(4326008)(36756003)(110136005)(64756008)(486006)(54906003)(14454004)(66446008)(68736007)(71200400001)(71190400001)(446003)(316002)(2616005)(6116002)(3846002)(66556008)(476003)(11346002)(102836004)(31696002)(86362001)(305945005)(186003)(8936002)(26005)(76176011)(6506007)(53546011)(7736002)(52116002)(6512007)(6486002)(478600001)(2906002)(53936002)(81166006)(81156014)(6436002)(8676002)(386003)(72206003)(256004)(99286004)(25786009)(5660300002)(6246003)(14444005)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3223;
 H:AM6PR08MB5271.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +4ARClHzL2PaxBhiP+wIuqOnjTXGONzeg8fT4TXgvdkdA8UYSW8WPetcdLe/Z40JTsbAx8FEujARaAc10WTacxffMnXLhn9V0guO1IvuKTVrGosCpH4D7XB199jUCpjhfJRBT2Gt8MIYgyWlfDkgkU9bBLZZ58K0RsZIcMtV8oO814QOy33PNgYW4kN6w/ii2BWcPw6n+1eCVKsGTHHU4gxDK01yFf2EWxoWdLYmmUHjkhMguRzA6xVjhsnKApGaImCLuSV2jAzasq/FERBbfciul3Ps4AC411bt68iO5g6dIN5QDFv7PSFmtL/cfIUNsAZP/ZboBLX0Zd2XL5DG+CLfpQlX/NcccPosdXblJeGw3lcpme7/w3GQU6IPa9PtAme6HRGVceQQ2O2/aPhX1c8sQqUaKzgdAqpjsaFd6eQ=
Content-ID: <D4C3F911B1A23146BD4C4D7477B745F3@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2715907-6c8c-4ecc-d10f-08d7023e7218
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 18:19:12.2600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3223
Subject: Re: [Xen-devel] [PATCH 0/1] Dom0less guest device tree format
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA2LzA3LzIwMTkgMTk6MTcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBP
biAwNi8wNy8yMDE5IDE5OjAyLCBXaWxsIEFiZWxlIHdyb3RlOg0KPj4gRnJvbTogV2lsbCBBYmVs
ZSA8d2lsbC5hYmVsZUBzdGFybGFiLmlvPg0KPj4NCj4+IEhpLA0KPiANCj4gSGksDQo+IA0KPj4g
SSd2ZSBiZWVuIHVzaW5nIGRvbTBsZXNzIFhlbiBvbiB0aGUgSGlrZXkgOTYwIHdpdGggYSA0LjE0
IExpbnV4IA0KPj4gS2VybmVsLiBJIGhhZA0KPj4gdHJvdWJsZSBnZXR0aW5nIHRoZSA0LjE0IExp
bnV4IEtlcm5lbCB0byBib290IGFzIGEgZG9tMGxlc3MgZG9tVSANCj4+IGJlY2F1c2UgaXQgd2Fz
DQo+PiBtaXNpbnRlcnByZXRpbmcgdGhlIGRldmljZSB0cmVlIHZlcnNpb24uIExpbnV4IDQuMTQg
YW5kIGVhcmxpZXIgDQo+PiBpbnRlcnByZXQgZGV2aWNlDQo+PiB0cmVlcyB3aXRoIGEgIi8iIGlu
IHRoZSByb290IG5vZGUgYXMgdmVyc2lvbiAxNi4gWGVuIHByb2R1Y2VzIGEgDQo+PiB2ZXJzaW9u
IDE3DQo+PiBkZXZpY2UgdHJlZSwgc28gdGhlIHJvb3Qgbm9kZSBuZWVkcyB0byBiZSAiIiB0byB3
b3JrIHdpdGggNC4xNCBhbmQgDQo+PiBlYXJsaWVyIExpbnV4DQo+PiBLZXJuZWxzLiBMaW51eCA0
LjE1IGFuZCBsYXRlciBhc3N1bWUgdGhhdCB0aGUgdmVyc2lvbiBpcyAxNywgc28gdGhpcyANCj4+
IHBhdGNoIGRvZXMNCj4+IG5vdCBoYXZlIGFueSBpbXBhY3QuDQo+Pg0KPj4gUGxlYXNlIGxldCBt
ZSBrbm93IGlmIHlvdSBuZWVkIGFueSBtb3JlIGluZm9ybWF0aW9uIG9yIGhhdmUgDQo+PiBzdWdn
ZXN0aW9ucyBmb3INCj4+IG90aGVyIHdheXMgdG8gaGFuZGxlIHRoaXMuDQo+IA0KPiBJIGRvbid0
IHVuZGVyc3RhbmQgd2hlcmUgdGhlIHZlcnNpb24gY29tZXMgZnJvbS4gSSBhbHNvIGRvbid0IHVu
ZGVyc3RhbmQgDQo+IGhvdyB5b3UgaW5mZXJyZWQgdGhhdCBYZW4gaXMgY3JlYXRpbmcgYSB2ZXJz
aW9uIDE3IGRldmljZS10cmVlLg0KPiANCj4gRG8geW91IGhhdmUgbGluayB0byB0aGUgcGFyYWdy
YXBoIGluIHRoZSBzcGVjaWZpY2F0aW9ucz8NCg0KQWxzbywgcGxlYXNlIGV4cGFuZCB3aGF0IGlz
IHRoZSBleGFjdCBlcnJvci4gU28gd2UgY2FuIHVuZGVyc3RhbmQgDQp3aGV0aGVyIHRoaXMgaXMg
dGhlIHJpZ2h0IGZpeC4NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
