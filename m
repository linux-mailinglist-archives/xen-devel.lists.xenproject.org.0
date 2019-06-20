Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E608C4DD74
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 00:39:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1he5gH-0005lg-Vv; Thu, 20 Jun 2019 22:37:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CQMK=UT=cs.rochester.edu=ejohns48@srs-us1.protection.inumbo.net>)
 id 1he5gF-0005lb-FD
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 22:37:19 +0000
X-Inumbo-ID: f509a938-93ab-11e9-8980-bc764e045a96
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4d::72c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f509a938-93ab-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 22:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uofr.onmicrosoft.com; 
 s=selector1-uofr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyRXEefcFphdA+E+SyUktT2p3jIS36rzNp71Kgr1dQQ=;
 b=xyV4zyRziZUZPDbqVSTFGqI9WzOyFRh3d4MuGtJElBLr1LYpK5y8b5Tqk9s+a8GKfLetzKZbrUqsrscehNAD1oCunPjSd2XgILscHBJXiSbbawSBg2AKF+Xt6ly/W5A8cQ+/L2qEEF/IwKO7ntyQ4LyjSuaBd8dpAh/URy5C6PE=
Received: from DM6PR07MB6396.namprd07.prod.outlook.com (20.179.69.208) by
 DM6PR07MB7147.namprd07.prod.outlook.com (10.141.170.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Thu, 20 Jun 2019 22:37:15 +0000
Received: from DM6PR07MB6396.namprd07.prod.outlook.com
 ([fe80::1816:afe6:c8bf:1036]) by DM6PR07MB6396.namprd07.prod.outlook.com
 ([fe80::1816:afe6:c8bf:1036%7]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 22:37:14 +0000
From: "Johnson, Ethan" <ejohns48@cs.rochester.edu>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: How to compile Xen 4.12 with Clang on Linux?
Thread-Index: AQHVJ7i11tfReA3k0Ea06sSNl8IU4Q==
Date: Thu, 20 Jun 2019 22:37:14 +0000
Message-ID: <9b1a4ece-91fa-c3ad-c0f1-f749cf61f5f9@cs.rochester.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0137.namprd02.prod.outlook.com
 (2603:10b6:208:35::42) To DM6PR07MB6396.namprd07.prod.outlook.com
 (2603:10b6:5:157::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ejohns48@cs.rochester.edu; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [192.5.53.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 938f91a5-931b-4147-d313-08d6f5cfd7b0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR07MB7147; 
x-ms-traffictypediagnostic: DM6PR07MB7147:
x-microsoft-antispam-prvs: <DM6PR07MB7147A0AB810B7E0A5D6E76D6E4E40@DM6PR07MB7147.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(39860400002)(396003)(366004)(53754006)(189003)(199004)(8676002)(68736007)(305945005)(14454004)(31696002)(64756008)(25786009)(478600001)(71200400001)(6506007)(26005)(31686004)(71190400001)(186003)(386003)(66476007)(66556008)(66446008)(66946007)(7736002)(86362001)(102836004)(73956011)(88552002)(81156014)(75432002)(81166006)(8936002)(5660300002)(6916009)(786003)(316002)(2616005)(256004)(2501003)(3846002)(6116002)(2906002)(476003)(14444005)(486006)(6486002)(52116002)(53936002)(6436002)(99286004)(6512007)(66066001)(2351001)(5640700003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR07MB7147;
 H:DM6PR07MB6396.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cs.rochester.edu does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: w9OKKOfL+Me0khrTgeYH0nEv9EDCYhbB/OaUtG2F8xljdP9aNdmMVMUnkBLT+dQmiWnrahGHQNSV2jMIstgcq1AL5EgHjr1sDy3OoBQ32Yjk0XqlvEGEXzBlLZU64QS6mXtQtT6PNxCSFS9QsgUccXsEpsUfDIQh5Zoq3inm3F1BaOqHY0MOOIhk2WQRw1zxoOTB88KukmjqvR3RMaI5+FojGRG6TKrOClLiemME6+c2XkgJBrJ2ftwrjpYcU8arFOgo2z+fhIWKlmv+fkAPLhUh6fbU9p/2nV70rohdKHE2cj5idod+XoYPAwhW7XeGAe8w4HxSKeIn91qJmXqHFBF4fSGOj61RHYYVgJCjWd4pA73vz+cnKgJI1MofvaJQw4uBZ89eUgCT2IkfO2i2r0fUlDxGzcxenIPOueRWsrw=
Content-ID: <E058DB863922F64FA489ABCAEB4AC1A4@namprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: cs.rochester.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 938f91a5-931b-4147-d313-08d6f5cfd7b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 22:37:14.8357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 374e17f4-cf11-4ce2-b3ef-5de76bf4ce41
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejohns48@ur.rochester.edu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB7147
Subject: [Xen-devel] How to compile Xen 4.12 with Clang on Linux?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpJJ20gdHJ5aW5nIHRvIGNvbXBpbGUgWGVuIDQuMTIgd2l0aCBDbGFuZyAodjcu
MC4wKSBmb3IgYSByZXNlYXJjaCANCnByb2plY3QuIEkgc2VlIGluIHRoZSBSRUFETUUgZGlzdHJp
YnV0ZWQgd2l0aCB0aGUgWGVuIDQuMTIgc291cmNlIGNvZGUgDQp0aGF0IENsYW5nL0xMVk0gMy41
IGFuZCBuZXdlciBhcmUgc3VwcG9ydGVkIGFzIHRoZSBjb21waWxlciBmb3IgYnVpbGRpbmcgDQpY
ZW4uIEhvd2V2ZXIsIHdoZW4gSSBhY3R1YWxseSB0cnkgaXQsIGl0IGRvZXNuJ3Qgd29yayAtIHRo
ZSBjb25maWd1cmUgDQpzY3JpcHQgc2VlbXMgdG8gcmVjb2duaXplIHRoYXQgSSd2ZSBpbmRpY2F0
ZWQgY2xhbmcgYXMgdGhlIHByZWZlcnJlZCANCmNvbXBpbGVyLCBidXQgdGhlIGFjdHVhbCAibWFr
ZSIgc3RlcCBzZWVtcyB0byBpZ25vcmUgaXQgYW5kIGlzc3VlIGdjYyANCmNvbW1hbmRzIGFueXdh
eS4NCg0KSSB0cmllZCBhIGZldyBkaWZmZXJlbnQgY29tbWFuZCBsaW5lIGludm9jYXRpb25zLCBh
bGwgd2l0aCB0aGUgc2FtZSANCnJlc3VsdCAobm90ZTogbXkgY2xhbmcgaXMgaW5zdGFsbGVkIGZy
b20gdGhlIFVidW50dSAxOC4wNCByZXBvc2l0b3JpZXMgDQphcyAiY2xhbmctNyIgYW5kICJjbGFu
ZysrLTciIHJlc3BlY3RpdmVseSk6DQoNCltBdHRlbXB0ICMxOl0NCkNDPWNsYW5nLTcgQ1hYPWNs
YW5nKystNyAuL2NvbmZpZ3VyZSAtLWVuYWJsZS1zeXN0ZW1kDQptYWtlIC1qMjQgd29ybGQNCg0K
W0F0dGVtcHQgIzI6XQ0KLi9jb25maWd1cmUgLS1lbmFibGUtc3lzdGVtZCBDQz1jbGFuZy03IENY
WD1jbGFuZysrLTcNCm1ha2UgLWoyNCB3b3JsZA0KDQpbQXR0ZW1wdCAjMzpdDQpleHBvcnQgQ0M9
Y2xhbmctNw0KZXhwb3J0IENYWD1jbGFuZysrLTcNCm1ha2UgLWoyNCB3b3JsZA0KDQpJJ20gZ3Vl
c3NpbmcgSSdtIG1pc3NpbmcgYSBrZXkgc3RlcCBoZXJlLCBidXQgSSdtIG5vdCBzZWVpbmcgYW55
dGhpbmcgaW4gDQp0aGUgZG9jdW1lbnRhdGlvbiAoUkVBRE1FLCB3aWtpLCBldGMuKSB0byBpbmRp
Y2F0ZSB3aGF0IHRoYXQgbWlnaHQgYmUuIA0KQW55b25lIGhhdmUgYW55IHN1Z2dlc3Rpb25zPw0K
DQpOb3RlIChpbiBjYXNlIGl0IG1hdHRlcnMpIHRoYXQgSSdtIGRvaW5nIHRoaXMgb24geDg2LTY0
IExpbnV4IChMaW51eCANCk1pbnQgMTkuMSB0byBiZSBleGFjdCwgd2hpY2ggaXMgYmFzZWQgb24g
VWJ1bnR1IDE4LjA0KS4gV2hlbiBJIHNlYXJjaGVkIA0Kb25saW5lIGFuZCBvbiB0aGUgWGVuIG1h
aWxpbmcgbGlzdHMgZm9yIHJlZmVyZW5jZXMgdG8gYnVpbGRpbmcgd2l0aCANCmNsYW5nIHRoZXkg
bW9zdGx5IHNlZW1lZCB0byBiZSBpbiB0aGUgY29udGV4dCBvZiBCU0Qgb3IgQVJNIHBsYXRmb3Jt
cy4NCg0KTXVjaCB0aGFua3MsDQpFdGhhbiBKb2huc29uDQoNCi0tIA0KRXRoYW4gSi4gSm9obnNv
bg0KQ29tcHV0ZXIgU2NpZW5jZSBQaEQgc3R1ZGVudCwgU3lzdGVtcyBncm91cCwgVW5pdmVyc2l0
eSBvZiBSb2NoZXN0ZXINCmVqb2huczQ4QGNzLnJvY2hlc3Rlci5lZHUNCmV0aGFuam9obnNvbkBh
Y20ub3JnDQpQR1AgcHVibGljIGtleSBhdmFpbGFibGUgZnJvbSBwdWJsaWMgZGlyZWN0b3J5IG9y
IG9uIHJlcXVlc3QNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
