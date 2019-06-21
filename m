Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EC4E1D9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 10:24:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heEm3-0000F7-Pv; Fri, 21 Jun 2019 08:19:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2/GD=UU=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1heEm1-0000F2-UG
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 08:19:54 +0000
X-Inumbo-ID: 57643a84-93fd-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::721])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 57643a84-93fd-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vBmLJndTFvbmp43Cbdjz4qjEHDfruzUo3nSX1RqJ+c=;
 b=OIMwGbGWYuBG6HFMm3q6gaCAfDtbV8i2tewQcOxrqzhUG3KclgjRmPvD04eSy5r5T64LvWiGSf4+gMKsmVZNOobOqO/DSBDFefRJ1rqTzukmJt5f+Q5Uk8dJSiDelcTvZAeYu1SHa54qDnC5JleWGGnavvPRRZLHZeRmwkFhxJ8=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3439.eurprd02.prod.outlook.com (52.134.17.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Fri, 21 Jun 2019 08:19:49 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09%5]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 08:19:49 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] MAINTAINERS: Add myself as a Designated reviewer to
 vm_event
Thread-Index: AQHVKAoXzsnZflPt9kmD2JE9pbfyKw==
Date: Fri, 21 Jun 2019 08:19:48 +0000
Message-ID: <20190621081929.11105-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0010.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::22)
 To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c1cb433-b4c4-457a-f7b2-08d6f62139e8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3439; 
x-ms-traffictypediagnostic: VI1PR0202MB3439:|VI1PR0202MB3439:
x-microsoft-antispam-prvs: <VI1PR0202MB343977BBBA554C79BAE86FE9ABE70@VI1PR0202MB3439.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(366004)(39860400002)(396003)(199004)(189003)(25786009)(316002)(68736007)(4326008)(73956011)(107886003)(102836004)(6506007)(66066001)(5660300002)(386003)(7416002)(53936002)(54906003)(52116002)(1076003)(99286004)(81156014)(6116002)(7736002)(14454004)(50226002)(86362001)(66946007)(186003)(3846002)(2906002)(305945005)(6486002)(26005)(2616005)(476003)(5640700003)(66446008)(66476007)(66556008)(64756008)(4744005)(36756003)(6436002)(2501003)(6512007)(81166006)(14444005)(6916009)(256004)(486006)(8676002)(478600001)(2351001)(71190400001)(8936002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3439;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 87WItR7N9qYbq/ifVoBXi9fEbzrqnR0ybAO23rCGwb+Ng0O+0O5vjOFHAKRdPFAEiHyXl9I9aLHtJmDnI9OUJHOH3bdhWDnszOkEEflLUsR3V7ZQqCreStWJU0SoJgE+I9Rf/efkrlu834joibv9xSIulGJtH/hTBPrY2pzeBnm+pTgjggMpLZ7HMn4e/Qc5GRhnmAIoBIsHFhazh9BzXoF3Jkx7iqxFKXMk2JIP4jp0TTZPTuBRkAtX4R2pyrM4RyQt1h4DIgqTyAMURpkhG0W7o3cQ3sQF+7dAV2xBgOmkxiSQnZp4ckq77VgdTKrLLowgSh8wv0Fi61vz5OTI/Upic9z8re1xxHwqp1u63RPpISiwAnizcdKjwPIyqw26mM3ilvxMnCSyGVLxPv9zg3MbKt5Ul2d3S5L7XbPoGpk=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1cb433-b4c4-457a-f7b2-08d6f62139e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 08:19:49.0911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3439
Subject: [Xen-devel] [PATCH v2] MAINTAINERS: Add myself as a Designated
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
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+
DQoNCi0tLQ0KQ2hhbmdlcyBzaW5jZSB2MToNCi0gQWRkZWQgZGVzaWduYXRlZCByZXZpZXdlciBh
ZnRlciBtYWludGFpbmVyIGxpc3QNCi0tLQ0KIE1BSU5UQUlORVJTIHwgMSArDQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5U
QUlORVJTDQppbmRleCBhYjMyZTdmNDA5Li42MzU2M2NlMmUwIDEwMDY0NA0KLS0tIGEvTUFJTlRB
SU5FUlMNCisrKyBiL01BSU5UQUlORVJTDQpAQCAtNDEzLDYgKzQxMyw3IEBAIEY6CXVubW9kaWZp
ZWRfZHJpdmVycy9saW51eC0yLjYvDQogVk0gRVZFTlQsIE1FTSBBQ0NFU1MgYW5kIE1PTklUT1IN
CiBNOglSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+DQogTToJVGFt
YXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPg0KK1I6ICAgICAgQWxleGFuZHJ1IElz
YWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQogUzoJU3VwcG9ydGVkDQogRjoJdG9vbHMv
dGVzdHMveGVuLWFjY2Vzcw0KIEY6CXhlbi9hcmNoLyovbW9uaXRvci5jDQotLSANCjIuMTcuMQ0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
