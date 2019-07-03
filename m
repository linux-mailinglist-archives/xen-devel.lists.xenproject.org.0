Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8BA5E25E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 12:53:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hicpu-0000LA-DO; Wed, 03 Jul 2019 10:50:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hicps-0000GL-3a
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 10:50:00 +0000
X-Inumbo-ID: 4217264d-9d80-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4217264d-9d80-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 10:49:58 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 10:49:33 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 10:47:38 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 10:47:38 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3124.namprd18.prod.outlook.com (10.255.139.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Wed, 3 Jul 2019 10:47:37 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 10:47:37 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] tests/x86emul: Annotate test blobs as executable code
Thread-Index: AQHVMYy6AFJGJVgH7EeLWuDdwzrRew==
Date: Wed, 3 Jul 2019 10:47:37 +0000
Message-ID: <98d70501-75c6-bbcd-39b3-14c5834c7d61@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR06CA0051.eurprd06.prod.outlook.com
 (2603:10a6:10:120::25) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74fdd8f2-fab1-400f-ea7c-08d6ffa3dcaa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3124; 
x-ms-traffictypediagnostic: BY5PR18MB3124:
x-microsoft-antispam-prvs: <BY5PR18MB3124998F6D57D45369EC8D53B3FB0@BY5PR18MB3124.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(199004)(189003)(8936002)(52116002)(25786009)(478600001)(6436002)(66066001)(6512007)(72206003)(486006)(476003)(8676002)(31686004)(2616005)(305945005)(229853002)(7736002)(99286004)(6486002)(14454004)(6916009)(81156014)(81166006)(2906002)(68736007)(36756003)(102836004)(3846002)(6116002)(54906003)(316002)(386003)(6506007)(4326008)(186003)(26005)(53546011)(86362001)(53936002)(31696002)(80792005)(73956011)(66446008)(5660300002)(71190400001)(71200400001)(66946007)(64756008)(66476007)(66556008)(6246003)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3124;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6zXsMh4ihaC4rEqAKtJA0OrUPNJHCBSnP8HFFeixihIJjphD7LAGr/E5X90c6IkgaP2nm+jCU2MtCGFay1tsdwvAZ6oD0aMV/DdwB9ACW3goAEXzzJEC76Xb9h7cHPLNQT1/Mdzz6Tm6e3rehJB7B8/4jneinLdd+i324cpR2hw/W0WnOeHfvjvM9qM2KxRdZl7UZlz23cA5y/jF1OnJCMSIdSl5Rte7JKmHRNUUEddLWGjkNCaHiU2klNtASEWrqMUBr4vGJOPgVefc9dBUKY5kcR2j5NGkgNxK7se4fO1cgR6n+9EtcrF76C09CtUMEJGNQvwycUJZ0+hsus5VEVr1DFRShfAIgFQ7GUEejHVJQpZ7OoG0vMSRby0v8AHF6M7HzR0KzlGaSVuIEKUyuqvdEu6422emC5mV0ABu9Rw=
Content-ID: <EFA8BAD77C367E4B808A0B5A6F1203FE@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fdd8f2-fab1-400f-ea7c-08d6ffa3dcaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 10:47:37.0142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3124
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] tests/x86emul: Annotate test blobs as
 executable code
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
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA1LjE5IGF0IDE3OjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6DQo+IC0tLSBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZQ0KPiArKysgYi90
b29scy90ZXN0cy94ODZfZW11bGF0b3IvTWFrZWZpbGUNCj4gQEAgLTE0OSw3ICsxNDksNyBAQCAk
KGFkZHN1ZmZpeCAuaCwkKFRFU1RDQVNFUykpOiAlLmg6ICUuYyB0ZXN0Y2FzZS5tayBNYWtlZmls
ZQ0KPiAgCQkoZWNobyAnc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBfX2F0dHJpYnV0ZV9fKChz
ZWN0aW9uKCIudGVzdCwgXCJheFwiLCBAcHJvZ2JpdHMgIyIpKSknIFwNCj4gIAkJICAgICAgIiQk
e3ByZWZpeH1fJChhcmNoKSQke2ZsYXZvcn1bXSA9IHsiOyBcDQo+ICAJCSBvZCAtdiAtdCB4ICQq
LmJpbiB8IHNlZCAtZSAncy9eWzAtOV0qIC8weC8nIC1lICdzLyAvLCAweC9nJyAtZSAncy8kJC8s
Lyc7IFwNCj4gLQkJIGVjaG8gIn07IikgPj4kQC5uZXc7IFwNCj4gKwkJIGVjaG8gIn07IGFzbShc
Ii50eXBlICQke3ByZWZpeH1fJChhcmNoKSQke2ZsYXZvcn0sIFNUVF9GVU5DO1wiKTsiKSA+PiRA
Lm5ldzsgXA0KDQpXaGlsZSBJIHRoaW5rIHdlJ3ZlIHN1ZmZpY2llbnRseSBhZ3JlZWQgb24gZnV0
dXJlIGdhcyBiZWhhdmlvcg0KdGhhdCBJJ2QgY29uc2lkZXIgdGhpcyBjaGFuZ2UgZmluZSB0byBt
YWtlIGFzIGxvbmcgYXMgeW91IGFkZA0KYW4gaW50ZXJtZWRpYXRlIHN0ZXAgZ29pbmcgdGhyb3Vn
aCBTVFRfTk9UWVBFLCBJJ2QgbGlrZSB0byBub3RlDQp0aGF0IHlvdXIgbWlsZWFnZSBmcm9tIHRo
aXMgd2lsbCBvbmx5IGJlIGFib3V0IDUwJTogV2hpbGUgdGhlDQo2NC1iaXQgYmxvYnMgd2lsbCBk
aXNhc3NlbWJsZSBmaW5lLCBJJ20gYWZyYWlkIHRoZSAzMi1iaXQgb25lcw0Kd2lsbCBiZSBzb21l
d2hhdCBnYXJibGVkLiBTYWRseSB0aGVyZSdzIG5vIGFubm90YXRpb24gb3IgYWxpa2UNCihsaWtl
IEFybSdzIG1hcHBpbmcgc3ltYm9scykgdGhhdCBvbmUgY291bGQgdXNlIHRvIG1ha2UNCmRpc2Fz
c2VtYmxlcnMgc3dpdGNoIGJpdG5lc3MgZm9yIHNlcGFyYXRlIGJsb2NrcyBvZiBjb2RlLg0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
