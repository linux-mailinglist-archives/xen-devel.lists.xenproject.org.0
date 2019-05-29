Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173A2E455
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 20:21:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW39M-0003iQ-W9; Wed, 29 May 2019 18:18:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW39L-0003iL-Pc
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 18:18:07 +0000
X-Inumbo-ID: 1a78eca1-823e-11e9-8980-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::604])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1a78eca1-823e-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 18:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNYF1sAfHHY44btcr/hxbbjfdjQpf+x8P14rI/yKMp4=;
 b=NFxiNHQSXc2ebzCLS7dSexBNPVhqvvqqa/iZGPb288V9c1obhTVRKCaHq3a6rpQXavPrBNbNC9WYpY1enyfURFU5mhvEs7Po/MmLRCy10Ffn3OLnpevnBAJRFdVaAac1E1TiLx/MOQgrgy6CIqSad9Y/YTCKVREuOqsnzTLcw4c=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB4161.eurprd08.prod.outlook.com (20.178.203.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Wed, 29 May 2019 18:18:04 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b%7]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 18:18:04 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Oleksandr <olekstysh@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>
Thread-Topic: [PATCH V1 2/2] xen/device-tree: Add ability to handle nodes with
 interrupts-extended prop
Thread-Index: AQHVD/vtXDMjwcmYDUOLcN4yy2k/+qaCfTyA///zGoCAAAVlgA==
Date: Wed, 29 May 2019 18:18:03 +0000
Message-ID: <c84036fb-27c9-8fb1-ec3b-f43a8e66515f@arm.com>
References: <1558460254-7127-1-git-send-email-olekstysh@gmail.com>
 <1558460254-7127-3-git-send-email-olekstysh@gmail.com>
 <a35d398b-d2e9-9c80-8ac2-923a82c68019@arm.com>
 <fbb40b64-c23b-be02-2c56-f0e0bf47324b@gmail.com>
In-Reply-To: <fbb40b64-c23b-be02-2c56-f0e0bf47324b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR04CA0033.eurprd04.prod.outlook.com (2603:10a6:6::46)
 To AM0PR08MB3139.eurprd08.prod.outlook.com (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf9c824c-5a46-4d01-03dc-08d6e461fd51
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4161; 
x-ms-traffictypediagnostic: AM0PR08MB4161:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB4161C6C5289856D3819ABFF1801F0@AM0PR08MB4161.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(39860400002)(346002)(376002)(199004)(189003)(2616005)(476003)(54906003)(6436002)(11346002)(446003)(2501003)(5660300002)(44832011)(53546011)(53936002)(486006)(102836004)(31696002)(316002)(66446008)(66556008)(66476007)(64756008)(73956011)(66946007)(186003)(110136005)(26005)(8936002)(6246003)(6116002)(7736002)(4326008)(31686004)(76176011)(8676002)(81156014)(6506007)(81166006)(2906002)(386003)(6512007)(2201001)(229853002)(52116002)(3846002)(305945005)(14454004)(68736007)(72206003)(99286004)(6486002)(86362001)(71200400001)(71190400001)(478600001)(25786009)(66066001)(256004)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4161;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /EcQq3fHKHuQAZ3nEjK8FrJ6yRXMOy2D5zXVnHkABbPN0vyvsC055xIDWFR45oTjKeqSgVRPmZIQIYp9t+EPcMSn17LhouZg0s3jHl4Fy2PKL6ktNttA076PHd0y+tE3m6YcuZMvKOjdkuwO13dgGXhfYzytwQBy+UMQYVzss626e5JT/4mGgOQI4qGVZXwFklQAPBTTg1nKZ7Irbd2YudDjkDdEx+/gHBfLLZi03htwMKvnrLQ2+qTXdpQDgC5qu2iAY8XiiiLiJu+obG1lQHLrAdiM9n81WVF6fP5WyVpqobXmeXseqW2aMtAR4RtqUErwPYagP6i40KS5JbokhuIbqVeYiJMoehMeOoxIO7Q6E3gaaNICEm9vrOZtA6dljKQMAj1+S0fMw89s3fhM0sI2ckCs3T9RhPrpg1oXnAQ=
Content-ID: <B5E5FBB65BE5A44EB27E2D06CD653E16@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9c824c-5a46-4d01-03dc-08d6e461fd51
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 18:18:03.9975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4161
Subject: Re: [Xen-devel] [PATCH V1 2/2] xen/device-tree: Add ability to
 handle nodes with interrupts-extended prop
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI5LzA1LzIwMTkgMTg6NTgsIE9sZWtzYW5kciB3cm90ZToNCj4gDQo+IE9uIDI5LjA1
LjE5IDIwOjQ0LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBIaSBPbGVrc2FuZHIsDQo+IA0KPiBI
aSwgSnVsaWVuDQo+IA0KPiANCj4+DQo+PiBPbiAyMS8wNS8yMDE5IDE4OjM3LCBPbGVrc2FuZHIg
VHlzaGNoZW5rbyB3cm90ZToNCj4+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3Nh
bmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+Pj4NCj4+PiBUaGUgImludGVycnVwdHMtZXh0ZW5k
ZWQiIHByb3BlcnR5IGlzIGEgc3BlY2lhbCBmb3JtIGZvciB1c2Ugd2hlbg0KPj4+IGEgbm9kZSBu
ZWVkcyB0byByZWZlcmVuY2UgbXVsdGlwbGUgaW50ZXJydXB0IHBhcmVudHMuID4NCj4+PiBBY2Nv
cmRpbmcgdG8gdGhlOg0KPj4NCj4+IE5JVDogcy90aGUvLw0KPj4NCj4+PiBMaW51eC9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaW50ZXJydXB0
cy50eHQgDQo+Pj4NCj4+Pg0KPj4+IEJ1dCwgdGhlcmUgYXJlIGNhc2VzIHdoZW4gImludGVycnVw
dHMtZXh0ZW5kZWQiIHByb3BlcnR5IGlzIHVzZWQgZm9yDQo+Pj4gIm91dHNpZGUgL3NvYyBub2Rl
IiB3aXRoIGEgc2luZ2xlIGludGVycnVwdCBwYXJlbnQgYXMgYW4gZXF1aXZhbGVudCBvZg0KPj4+
IHBhaXJzICgiaW50ZXJydXB0LXBhcmVudCIgKyAiaW50ZXJydXB0cyIpLg0KPj4+DQo+Pj4gVGhl
IGdvb2QgZXhhbXBsZSBoZXJlIGlzIEFSQ0ggdGltZXIgbm9kZSBmb3IgUi1DYXIgR2VuMy9HZW4y
IGZhbWlseSwNCj4+DQo+PiBOSVQ6IHMvVGhlL0EvIEkgdGhpbmsNCj4+DQo+Pj4gd2hpY2ggaXMg
bWFuZGF0b3J5IGRldmljZSBmb3IgWGVuIHVzYWdlIG9uIEFSTS4gQW5kIHdpdGhvdXQgYWJpbGl0
eQ0KPj4+IHRvIGhhbmRsZSBzdWNoIG5vZGVzLCBYZW4gZmFpbHMgdG8gb3BlcmF0ZS4NCj4+Pg0K
Pj4+IFNvLCB0aGlzIHBhdGNoIGFkZHMgcmVxdWlyZWQgc3VwcG9ydCBmb3IgWGVuIHRvIGJlIGFi
bGUgdG8gaGFuZGxlDQo+Pj4gbm9kZXMgd2l0aCB0aGF0IHByb3BlcnR5Lg0KPj4+DQo+Pj4gU2ln
bmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVw
YW0uY29tPg0KPj4NCj4+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+DQo+IA0KPiBUaGFuayB5b3UhIEkgYXNzdW1lIHlvdSBtZWFudCBSZXZp
ZXdlZC1ieTogSnVsaWVuIEdyYWxsIA0KPiA8anVsaWVuLmdyYWxsQGFybS5jb20+ICkNCg0KWWVz
IHNvcnJ5LCBJIHdhcyBhZGRpbmcgaXMgcmV2aWV3ZWQtYnkgb24gc29tZSBvZiBteSBwYXRjaGVz
IGFuZCANCm1lY2hhbmljYWxseSBjb3BpZWQgaGVyZS4gQXBvbG9naWVzIGZvciB0aGUgaW5jb252
ZW5pZW5jZS4NCg0KPiANCj4gU2hhbGwgSSBzZW5kIG5ldyB2ZXJzaW9uIHdpdGggcHJvcG9zZWQg
Y2hhbmdlcz8NCg0KTm8gbmVlZCwgSSBjYW4gZG8gdGhlIGNoYW5nZSB3aGlsZSBjb21taXR0aW5n
IChhc3N1bWluZyBTdGVmYW5vIGhhcyBubyANCm90aGVyIGNvbW1lbnRzKS4NCg0KQ2hlZXJzLA0K
DQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
