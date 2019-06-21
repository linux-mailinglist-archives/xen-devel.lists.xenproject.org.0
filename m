Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFE54E257
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 10:48:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFAh-0002e5-MP; Fri, 21 Jun 2019 08:45:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2/GD=UU=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1heFAg-0002dz-Cj
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 08:45:22 +0000
X-Inumbo-ID: e6fc5c83-9400-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::70e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e6fc5c83-9400-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNN4KzGzF1WWisdaPUt3OcdT/tRGntfQ4qAmr7eTZo8=;
 b=xgptnUXEJUzWfSmxHncyOSL7CGpFxokNNWZnQbu4zybJmSBKNvf/XoIIasb1EznzJZh5zmcguz7KmJvyOW8PqsZDF2qqf4gJCmAb+a76yzbjNpntEGZn8JCIrRh5NILo1DKMDOu5fsKZ3vhv7oqZHqB3yR75iplrEoSC3LTQvsw=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2493.eurprd02.prod.outlook.com (10.173.80.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Fri, 21 Jun 2019 08:45:18 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09%5]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 08:45:18 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] MAINTAINERS: Add myself as a Designated
 reviewer to vm_event
Thread-Index: AQHVKAoXzsnZflPt9kmD2JE9pbfyK6alyk0AgAAA6AA=
Date: Fri, 21 Jun 2019 08:45:18 +0000
Message-ID: <b150deeb-be3b-7bc4-745e-6507fd59633d@bitdefender.com>
References: <20190621081929.11105-1-aisaila@bitdefender.com>
 <243c6bb4-7a4f-21b0-e763-ed5986af373f@suse.com>
In-Reply-To: <243c6bb4-7a4f-21b0-e763-ed5986af373f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2PR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:101:16::20) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8433fa94-2bd9-4da0-6acd-08d6f624c996
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2493; 
x-ms-traffictypediagnostic: VI1PR0202MB2493:|VI1PR0202MB2493:
x-microsoft-antispam-prvs: <VI1PR0202MB24938D7CD6C281C6D581AF3CABE70@VI1PR0202MB2493.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(136003)(39860400002)(346002)(366004)(189003)(199004)(71190400001)(71200400001)(52116002)(99286004)(386003)(6506007)(6486002)(53546011)(76176011)(14454004)(486006)(86362001)(31686004)(8936002)(8676002)(478600001)(31696002)(81156014)(81166006)(256004)(14444005)(305945005)(66946007)(73956011)(229853002)(66446008)(64756008)(66556008)(66476007)(476003)(2616005)(11346002)(7736002)(5660300002)(2501003)(7416002)(446003)(66066001)(54906003)(110136005)(6436002)(25786009)(68736007)(102836004)(3846002)(6116002)(6512007)(4744005)(4326008)(53936002)(36756003)(316002)(26005)(2906002)(6246003)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2493;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5SLkS5KU73zGuFXcpWwoPG+yYuFIvyJCGr/1hY9lQiX55WeDyBZpoubB1nlfUPXw/Immd3/wsmKkiKWV+7jjM7ev8tI3kOgxy/W3BDLUUDODh5fXGxwFTkKA5w20gWsEszvpTd91f/rEjmZg34U1fBaNiBHC8h9Wf8OQ33Aw1Q94QCdLkxHyTPogT1sZQjITz828AWE38sRIU2ZSrASl/xvoW2K3S45ZXXWDcvrZgGGcdp2OIVlRaLX/rbmTuJ0EU4//87zW9eZgFqu2RGg4l+DpGSdW+cRincjgzpib4VHbJg/A4Owe5LXTKpwz+LjB2JFDJo2NYikXlt6Vd/HuGm7Csu1/M34+IIjAWXXUdxkAhE67vSJ1Lc3HNWTVQ47xJmAiAIATExkdUzcgh7WW9LMur2ZHNyQlpu5g3WTcRsk=
Content-ID: <E5F642A90E9C184B81DF02E1A86A8900@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8433fa94-2bd9-4da0-6acd-08d6f624c996
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 08:45:18.3820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2493
Subject: Re: [Xen-devel] [PATCH v2] MAINTAINERS: Add myself as a Designated
 reviewer to vm_event
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIxLjA2LjIwMTkgMTE6NDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDIxLjA2
LjE5IDEwOjE5LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KPj4NCj4+IC0t
LQ0KPj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4+IC0gQWRkZWQgZGVzaWduYXRlZCByZXZpZXdlciBh
ZnRlciBtYWludGFpbmVyIGxpc3QNCj4+IC0tLQ0KPj4gwqAgTUFJTlRBSU5FUlMgfCAxICsNCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9N
QUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+PiBpbmRleCBhYjMyZTdmNDA5Li42MzU2M2NlMmUw
IDEwMDY0NA0KPj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4+ICsrKyBiL01BSU5UQUlORVJTDQo+PiBA
QCAtNDEzLDYgKzQxMyw3IEBAIEY6wqDCoMKgIHVubW9kaWZpZWRfZHJpdmVycy9saW51eC0yLjYv
DQo+PiDCoCBWTSBFVkVOVCwgTUVNIEFDQ0VTUyBhbmQgTU9OSVRPUg0KPj4gwqAgTTrCoMKgwqAg
UmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPg0KPj4gwqAgTTrCoMKg
wqAgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPg0KPj4gK1I6wqDCoMKgwqDC
oCBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NCj4gDQo+IEkgdGhp
bmsgeW91IHNob3VsZCB1c2UgYSB0YWIgaW5zdGVhZCBvZiBzcGFjZXMgYWZ0ZXIgdGhlICJSOiIN
Cj4gDQoNClJpZ2h0LCBJIHdhcyB1c2VkIHRvIHVzaW5nIHNwYWNlLiBJIHdpbGwgY29ycmVjdCB0
aGlzIGFuZCBhZGQgVjMNCg0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
