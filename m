Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74FD51B5B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 21:25:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfUXC-0004zx-FU; Mon, 24 Jun 2019 19:21:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VJaK=UX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hfUXA-0004zs-Ti
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 19:21:44 +0000
X-Inumbo-ID: 4bdccb38-96b5-11e9-8980-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::602])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4bdccb38-96b5-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pNWxFay6rHDwoFmsZhJHrI97GAmL7VzwSJuzGbDTbM=;
 b=EZ226ZK41aX+lYcJX2DLU5Bi5NpWU+tANAK0VHXL8fCZqTDreyM6+v90H3TbzVa3wTkZCMln0eCV+YSGkdgrvn97as/X0xmA6NaB47KjowNWujMpdab+RHV0HXisI4WOTGpi1Q50rytW1dcpOqmCDhKSEDVBfNsjj4fl6XDOksc=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB4258.eurprd08.prod.outlook.com (20.179.34.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 19:21:40 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::290d:81aa:7f97:5a49]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::290d:81aa:7f97:5a49%3]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 19:21:40 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "lars.kurth@citrix.com"
 <lars.kurth@citrix.com>
Thread-Topic: Migrating key developer docs to xen.git sphinx docs and
 refreshing them in the process
Thread-Index: AQHVKogYFsqm61IG8EyIbkU2yX65b6arGR2AgAAV6IA=
Date: Mon, 24 Jun 2019 19:21:40 +0000
Message-ID: <88dee4d2-d7cb-f342-118f-97c37f43f6ff@arm.com>
References: <B591280C-E140-4A3B-AEC0-E86E99525F0C@citrix.com>
 <alpine.DEB.2.21.1906241059191.2468@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906241059191.2468@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:46::45) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e5ea1da-98a2-4ef3-6ca0-08d6f8d92ef5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4258; 
x-ms-traffictypediagnostic: AM0PR08MB4258:
x-ms-exchange-purlcount: 4
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB4258EB15BA0D021036BECDC980E00@AM0PR08MB4258.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(39860400002)(346002)(366004)(199004)(189003)(81166006)(14454004)(72206003)(229853002)(36756003)(4326008)(25786009)(44832011)(71190400001)(31686004)(476003)(2616005)(68736007)(6246003)(71200400001)(486006)(6436002)(6486002)(110136005)(6116002)(3846002)(11346002)(54906003)(446003)(53936002)(6306002)(8676002)(6512007)(7736002)(305945005)(316002)(52116002)(256004)(478600001)(31696002)(6506007)(53546011)(386003)(76176011)(8936002)(26005)(66476007)(2906002)(966005)(2501003)(186003)(99286004)(66066001)(66556008)(5660300002)(66946007)(64756008)(66446008)(73956011)(102836004)(86362001)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4258;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IwQtiRccDZQO9V7tceq8bnKoXUFhvGsOzDQHOo32jCWTYCLS3VFZLRLk5tuMNxN371LDmXWfu3t/zH9ewe/lwfVmof5XL9fHXWmPM3MSoniDKtetgWFWxMF96Z+XenV5yz8wzsSXsTIxXAbA5CmZ2njs90HL7BeW5CGstcNA0f0rhmumXvZcDWrqQLdmTsb0+jxQtMZOyeW1EjJvaBZfzel6rnriaufwjj20dA89/eP545739ZQFfh5jFz4MfrIQsp1AD4m0E1LUcKd0TybxYjtzrxOi46jG3gst6l3wdXRKmv9rOmRsz57VdzZu5Rd75sY12/9yP/Bl5fuDGKsIBG4cfRpUh4JTlfh3lCY4vgiHdiCmwni7GgWqMPUdGcQAPHUTKWxPV/xP7RhS/fGHvgDdsPo2GclIKCBK8FTDia0=
Content-ID: <E21D7CC86A3F304AB92618E0E5B342C8@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5ea1da-98a2-4ef3-6ca0-08d6f8d92ef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 19:21:40.3039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4258
Subject: Re: [Xen-devel] Migrating key developer docs to xen.git sphinx docs
 and refreshing them in the process
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDI0LzA2LzIwMTkgMTk6MDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gTW9uLCAyNCBKdW4gMjAxOSwgTGFycyBLdXJ0aCB3cm90ZToNCj4gSSB0aGluayB3ZSBhbGwg
YWdyZWUgYnkgbm93IHRoYXQgbWFpbnRhaW5pbmcgdXAtdG8tZGF0ZSBkb2NzIG9uIHRoZSB3aWtp
DQo+IGFuZCBrZWVwaW5nIHRoZW0gaW4gc3luYyB3aXRoIGNvZGUgY2hhbmdlcyBpcyBoYXJkLiBJ
IHNlZSBtb3ZpbmcgdGhpbmdzDQo+IGZyb20gdGhlIHdpa2kgdG8geGVuLmdpdCBhcyBhIGdyZWF0
IGltcHJvdmVtZW50LiBXZSBoYXZlIGEgZmV3IFhlbiBvbg0KPiBBUk0gZG9jcyB0aGF0IGFyZSB3
b3J0aCBpbXBvcnRpbmcgZnJvbSB0aGUgd2lraToNCj4gDQo+IGh0dHBzOi8vd2lraS54ZW5wcm9q
ZWN0Lm9yZy93aWtpL1hlbl9BUk1fd2l0aF9WaXJ0dWFsaXphdGlvbl9FeHRlbnNpb25zDQoNCkkg
YWdyZWUgZm9yIHRoaXMgYnV0IC4uLg0KDQo+IA0KPiBBbmQgYWxsIHRoZSBib2FyZCBzcGVjaWZp
YyBkb2NzIGxpbmtlZCBmcm9tIGl0LCBzdWNoIGFzOg0KPiANCj4gaHR0cHM6Ly93aWtpLnhlbnBy
b2plY3Qub3JnL3dpa2kvWGVuX0FSTV93aXRoX1ZpcnR1YWxpemF0aW9uX0V4dGVuc2lvbnMvcWVt
dS1zeXN0ZW0tYWFyY2g2NA0KPiBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9YZW5f
QVJNX3dpdGhfVmlydHVhbGl6YXRpb25fRXh0ZW5zaW9ucy9GYXN0TW9kZWxzDQo+IGh0dHBzOi8v
d2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL0hpS2V5OTYwDQoNCi4uLiBJIHRoaW5rIGl0IGlzIGEg
cHJldHR5IGJhZCBpZGVhIHRvIGltcG9ydCBib2FyZCBzcGVjaWZpYyBkb2NzLiBUaGVyZSANCmFy
ZSBhIGxvdCBvZiB3YXkgdG8gYnVpbGQgY29tcG9uZW50cyBmb3IgYSBnaXZlbiBib2FyZCBhbmQg
SSBhbSB3b3JyeSBvZiANCnRoZSBvdmVyaGVhcmQgZm9yIHRoZSBtYWludGFpbmVycyB0byBsb29r
L21haW50YWluIHRoZSBkb2N1bWVudGF0aW9uLiBJdCANCmFsc28gYnJpbmdzIHRoZSBxdWVzdGlv
biBvZiB0aGUgYWNjZXB0YW5jZS9yZW1vdmFsIG9mDQphIGJvYXJkIGRvY3VtZW50YXRpb24uDQoN
Ckluc3RlYWQgd2Ugc2hvdWxkIHByb3ZpZGUgZ2VuZXJpYyBndWlkYW5jZS90cm91Ymxlc2hvb3Qg
dG8gdGhlIHVzZXIuIA0KQW55dGhpbmcgYm9hcmQgc3BlY2lmaWMgY291bGQgYmUgbWFpbnRhaW4g
b24gdGhlIHdpa2kgYnkgc29tZW9uZSBjYXJpbmcgDQphYm91dCB0aGUgYm9hcmQgd2l0aG91dCBo
YXZpbmcgdXMgdG8gZ2F0ZSBpdC4NCg0KV2UgY291bGQgdHJ5IHRvIHJldml2ZSBhIGRpc2N1c3Np
b24gd2UgaGFkIGEgY291cGxlIG9mIHllYXJzIGFnbyB3aGVyZSANCnNvbWVvbmUgaXMgcmVzcG9u
c2libGUgZm9yIGEgZ2l2ZW4gYm9hcmQgdG8gdGVzdCBhbmQgZG9jdW1lbnQgaXQuIFRvZGF5IA0K
aXQgaXMgaW5mb3JtYWwsIGJ1dCBJIGhhdmUgYmVlbiBwdXNoaW5nIGZvciBpdCByZWNlbnRseSBm
b3IgbmV3IGJvYXJkcy4NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
