Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9E25E2E9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 13:39:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hidZW-0004ii-Rl; Wed, 03 Jul 2019 11:37:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hidZV-0004ib-Be
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 11:37:09 +0000
X-Inumbo-ID: df42ce61-9d86-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id df42ce61-9d86-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 11:37:08 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 11:37:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 11:33:23 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 11:33:23 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3188.namprd18.prod.outlook.com (10.255.138.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 11:33:21 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 11:33:21 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: Ping: [PATCH 0/9] XSA-292 follow-up
Thread-Index: AQHVMZMeD0d8oHj2I0e21oivLVEcJA==
Date: Wed, 3 Jul 2019 11:33:21 +0000
Message-ID: <179d5507-1474-f754-e085-b93b7a1467ed@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0301CA0051.eurprd03.prod.outlook.com
 (2603:10a6:4:54::19) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31c735e1-0dcc-400c-8e57-08d6ffaa408f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3188; 
x-ms-traffictypediagnostic: BY5PR18MB3188:
x-microsoft-antispam-prvs: <BY5PR18MB318802D73C809A97BBFDBF75B3FB0@BY5PR18MB3188.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(478600001)(53936002)(81156014)(256004)(86362001)(71190400001)(80792005)(8676002)(81166006)(31696002)(6512007)(25786009)(99286004)(4326008)(2906002)(14444005)(5660300002)(14454004)(68736007)(71200400001)(8936002)(6506007)(316002)(26005)(7736002)(52116002)(386003)(102836004)(53546011)(54906003)(72206003)(6486002)(66556008)(64756008)(66446008)(73956011)(2616005)(66946007)(66476007)(6436002)(476003)(110136005)(66066001)(6116002)(4744005)(36756003)(486006)(186003)(3846002)(305945005)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3188;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +XB3n2UeCTaoqCubbEKexxfW/4yHAiuQJFlPwE4J6F673/DKmPgKF3BmTCZrvfhksbXK1ys+ypFnfK8gxTQgCrCuv+8Doetixtp/iqq6fnzTan+WdCl6v31Ehxg2o9WJ2Y1MqFtUIh9y/EDmkdO6cdRswLqoTwicZB8I/z6o2FtBCMG0z7/falkXsnrtd5pRX8Hlehta1EnMFw47f1p8AxjXlYBguI95645tbeCxMOU9QhKbYXJ15JEKojnAr9tsakWB68D7KLauOdLEGA6Ttn1jdo0oKx3kOSkqWxt1NbnnZt6N0JoOAELCW0nrd9JlmihD41rOI4yOWpYPQR0umPz07bYIcCe0lleLQ+G4dIDlchWSWaZKI1FcbSTVcnreDj1IvugvyAAY1ei8M3PGWw+6thN8cOfUjtwiRm76Lqc=
Content-ID: <22E8A5D5E8F9D84BB0523A46657C019E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c735e1-0dcc-400c-8e57-08d6ffaa408f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 11:33:21.4335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3188
X-OriginatorOrg: suse.com
Subject: [Xen-devel] Ping: [PATCH 0/9] XSA-292 follow-up
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDEzOjM1LCAgd3JvdGU6DQo+IFZhcmlvdXMgQ1IzIGFuZCBQQ0lE
IHJlbGF0ZWQgYWRqdXN0bWVudHMsIGZpcnN0IGFuZCBmb3JlbW9zdA0KPiBhbiBhbG1vc3QgZnVs
bCByZS13cml0ZSBvZiBzd2l0Y2hfY3IzX2NyNCgpIChpbiBwYXRjaCAyKS4NCj4gDQo+IDE6IHg4
NjogYWRqdXN0IGNyM19wY2lkKCkgcmV0dXJuIHR5cGUNCj4gMjogeDg2OiBsaW1pdCB0aGUgYW1v
dW50IG9mIFRMQiBmbHVzaGluZyBpbiBzd2l0Y2hfY3IzX2NyNCgpDQo+IDM6IHg4Ni9tbTogaG9u
b3Igb3B0X3BjaWQgYWxzbyBmb3IgMzItYml0IFBWIGRvbWFpbnMNCj4gNDogeDg2L0hWTTogbW92
ZSBOT0ZMVVNIIGhhbmRsaW5nIG91dCBvZiBodm1fc2V0X2NyMygpDQo+IDU6IHg4Ni9IVk06IHJl
ZnVzZSBDUjMgbG9hZHMgd2l0aCByZXNlcnZlZCAodXBwZXIpIGJpdHMgc2V0DQo+IDY6IHg4Ni9I
Vk06IHJlbGF4IHNoYWRvdyBtb2RlIGNoZWNrIGluIGh2bV9zZXRfY3IzKCkNCj4gNzogeDg2L0hW
TTogY29zbWV0aWNzIHRvIGh2bV9zZXRfY3IzKCkNCj4gODogeDg2L0NQVUlEOiBkcm9wIElOVlBD
SUQgZGVwZW5kZW5jeSBvbiBQQ0lEDQo+IDk6IHg4NjogUENJRCBpcyB1bnVzZWQgd2hlbiAhUFYN
Cj4gDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
