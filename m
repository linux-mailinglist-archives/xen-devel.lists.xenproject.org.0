Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787A26285C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 20:31:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkYMk-0003ee-Dn; Mon, 08 Jul 2019 18:27:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EhdR=VF=starlab.io=will.abele@srs-us1.protection.inumbo.net>)
 id 1hkYMi-0003eZ-OL
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 18:27:52 +0000
X-Inumbo-ID: 16f455fa-a1ae-11e9-a6e5-3b9823c0cbf8
Received: from GCC01-CY1-obe.outbound.protection.outlook.com (unknown
 [40.107.83.128]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16f455fa-a1ae-11e9-a6e5-3b9823c0cbf8;
 Mon, 08 Jul 2019 18:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCU0aamn6TA5cFm+JlAABlGJKPy1Bnb4GM8Q99qG7E4=;
 b=s5OQcJvhUIzjL6Ndn2Q7pqT9Zc2F/OqeDnCGrW6fBQXjgTU9uY3I5AcCVVIdm9QVPDZKvbHBaMJ53sFwi3HCXrTxyM3nJUbyp6UwAl8X3XEJU+X4TBkN3M+ZWe/GByRXovsjz/Kwu4shFX0h6t0yV0mQMA/tykepB1ViktRveHI=
Received: from DM6PR09MB3211.namprd09.prod.outlook.com (20.178.3.95) by
 DM6PR09MB3611.namprd09.prod.outlook.com (20.179.49.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Mon, 8 Jul 2019 18:27:47 +0000
Received: from DM6PR09MB3211.namprd09.prod.outlook.com
 ([fe80::85fb:bda:f7c:6420]) by DM6PR09MB3211.namprd09.prod.outlook.com
 ([fe80::85fb:bda:f7c:6420%2]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 18:27:47 +0000
From: Will Abele <will.abele@starlab.io>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 0/1] Dom0less guest device tree format
Thread-Index: AQHVNCT8i/e9XHQvKUuqip9pKzLNp6a95d0AgAAAdQD//+zngIADBVkAgAA0zwA=
Date: Mon, 8 Jul 2019 18:27:47 +0000
Message-ID: <20190708182743.2o4zcb6mzn2frwnm@starlab.io>
References: <cover.1562435004.git.will.abele@starlab.io>
 <41ff241e-aa17-6033-25b0-80da519cd444@arm.com>
 <c3dd311a-732a-68e8-5b3d-0aa7dd8773c7@arm.com>
 <20190706211048.uvilbrefroxroli3@starlab.io>
 <fa5c047d-af73-3599-3881-e5b8b5a693aa@arm.com>
In-Reply-To: <fa5c047d-af73-3599-3881-e5b8b5a693aa@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN7PR06CA0044.namprd06.prod.outlook.com
 (2603:10b6:408:34::21) To DM6PR09MB3211.namprd09.prod.outlook.com
 (2603:10b6:5:35::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=will.abele@starlab.io; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [205.153.95.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1ee06c9-542a-4c4a-5081-08d703d1f9ba
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR09MB3611; 
x-ms-traffictypediagnostic: DM6PR09MB3611:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR09MB3611732EBC2DF7BDEECFC35EF6F60@DM6PR09MB3611.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(376002)(396003)(136003)(39830400003)(199004)(189003)(6246003)(2906002)(71200400001)(2616005)(71190400001)(476003)(25786009)(966005)(44832011)(6512007)(486006)(52116002)(6306002)(86362001)(256004)(36756003)(6916009)(4326008)(74482002)(68736007)(508600001)(11346002)(446003)(14444005)(54906003)(1076003)(53936002)(99286004)(316002)(66066001)(26005)(66476007)(66446008)(81156014)(14454004)(64756008)(8676002)(66556008)(8936002)(66946007)(73956011)(3846002)(81166006)(186003)(6116002)(229853002)(76176011)(6436002)(7736002)(305945005)(6486002)(102836004)(5660300002)(6506007)(53546011)(386003)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR09MB3611;
 H:DM6PR09MB3211.namprd09.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: starlab.io does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WJ6oeeupVDu9aphmsqNWewR04CUFgtjKV3RDRmRokbWvQyUKB9rjRpuJFpHJh6NdMGizwWvX6PubCUV5Ab5N9hc+dTMRJLO2oeWjX/tFMPeSGTQh+oAKchPXNI/SclXZGzgWeKRjkBRxVK8mcaJNcpNTiaBWaJKjYGOVQVEyV0jGKDxLoGX5QDGarXnUJEOfoM0BUoZXDjaHkwseB+pqtrz1vIMIKSW+nXma0eyUSIbYjK2WPqr01JzE8X4rRwg8efdXRgCNX+e2/Z/JNKHpdQ5knza7flSVuo5kEgguCY9ZLdb30OQ1x2pQ2UU7J3O0bXFcNIfiNTIIkEGTz/U5EB/pNBKpXMLfurIrKYi+7i4WLNPzFxJU2x8aOFIz5fDepPKJYEkk4hvEXcjABgpy6wjGFXDAl8eh7z8SFEA7Bas=
Content-ID: <4002C0A2E90F12449ED09DE347D3708E@namprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ee06c9-542a-4c4a-5081-08d703d1f9ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 18:27:47.2912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: will.abele@starlab.io
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR09MB3611
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIDA3LzA4LzIwMTkgMTY6MTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgV2lsbCwNCj4g
DQo+IEFueXRoaW5nIHdyaXR0ZW4gYWZ0ZXIgLS0gaXMgdXN1YWxseSBzZWVuIGFzIGEgc2lnbmF0
dXJlLiBUaGlzIGNvbmZ1c2VkIG15DQo+IGUtbWFpbCBjbGllbnQgYXMgaXQgd2lsbCBzdHJpcCB0
aGUgc2lnbmF0dXJlIG9uIHJlcGx5Lg0KPiANCj4gT24gNy82LzE5IDEwOjEwIFBNLCBXaWxsIEFi
ZWxlIHdyb3RlOg0KPiA+IEkgc2FpZCBpbiBteSBtZXNzYWdlIHRoYXQgTGludXggd2FzIGludGVy
cHJldGluZyB0aGUgZGV2aWNlIHRyZWUgYXMgdmVyc2lvbiAxNi4NCj4gPiBMb29raW5nIHRocm91
Z2ggdGhlIGNvZGUgYWdhaW4sIEkgcmVhbGl6ZSBpdCB3YXMgYmVpbmcgaW50ZXJwcmV0ZWQgYXMg
ZWFybGllcg0KPiA+IHRoYW4gMTYuIEFzIG1lbnRpb25lZCBpbiBMaW51eCBjb21taXQgYTdlNGNm
YjBhN2NhNDc3M2U3ZDBkZDFkOWMwMThhYjI3YTE1MzYwZSwNCj4gPiBMaW51eCBoYWQgYWxyZWFk
eSBicm9rZW4gc3VwcG9ydCBmb3IgRkRUIHZlcnNpb25zIGVhcmxpZXIgdGhhbiAxNi4NCj4gPiBw
b3B1bGF0ZV9ub2RlKCkgaW4gZHJpdmVycy9vZi9mZHQuYyB3b3VsZCBzdG9wIHBhcnNpbmcgdGhl
IGZkdCBhdCB0aGUgcm9vdCBub2RlDQo+ID4gaWYgaXQgdGhvdWdodCB0aGUgZmR0IHZlcnNpb24g
d2FzIGVhcmxpZXIgdGhhbiAxNi4NCj4gPiANCj4gPiBYZW4gc2V0cyB0aGUgRkRUIHZlcnNpb24g
dG8gMTcgaW4gZmR0X2NyZWF0ZSgpLg0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGV4cGxhbmF0
aW9uLiBIb3dldmVyLCBJIHN0aWxsIGNhbid0IG1hdGNoIHdoYXQgeW91IHNheQ0KPiB3aXRoIGEg
c3BlY2lmaWNhdGlvbi4gUGxlYXNlIHByb3ZpZGUgYSBsaW5rIHRvIHRoZSBzcGVjaWZpY2F0aW9u
IGFuZCB0aGUNCj4gZXhhY3QgcGFyYWdyYXBoLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+
IEp1bGllbiBHcmFsbA0KSGkgSnVsaWVuLA0KDQpTb3JyeSBhYm91dCBteSBlbWFpbCBpc3N1ZXMu
IEknbSBzdGlsbCBnZXR0aW5nIHVzZWQgdG8gdXNpbmcgTXV0dC4NCg0KVGhlIERldmljZSBUcmVl
IHNwZWNpZmljYXRpb24gaXMgaGVyZToNCmh0dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0cmVlLW9y
Zy9kZXZpY2V0cmVlLXNwZWNpZmljYXRpb24vcmVsZWFzZXMvZG93bmxvYWQvdjAuMi9kZXZpY2V0
cmVlLXNwZWNpZmljYXRpb24tdjAuMi5wZGYuDQoNClNlY3Rpb24gMi4yLjEgcGFyYWdyYXBoIDUg
c3BlY2lmaWVzIHRoYXQgdGhlIHJvb3Qgbm9kZSBkb2VzIG5vdCBoYXZlIGEgbm9kZSBuYW1lDQpv
ciBhIHVuaXQgYWRkcmVzcy4gRnVydGhlcm1vcmUsIGEgIi8iIGRvZXMgbm90IGFwcGVhciBpbiB0
aGUgbGlzdCBvZiB2YWxpZCBub2RlDQpuYW1lIGNoYXJhY3RlcnMgaW4gdGFibGUgMi4xLg0KDQpU
aGVyZSdzIGFuIGV4YW1wbGUgb2YgY3JlYXRpbmcgYW4gZW1wdHkgZGV2aWNlIHRyZWUgdXNpbmcg
IiIgYXMgdGhlIHJvb3Qgbm9kZQ0KbmFtZSBpbiB4ZW4vY29tbW9uL2xpYmZkdC9mZHRfZW1wdHlf
dHJlZS5jLg0KDQpUaGFua3MsDQpXaWxsDQoNCi0tIA0KV2lsbCBBYmVsZQ0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
