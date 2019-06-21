Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB724E267
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 10:55:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFHM-0003RT-H9; Fri, 21 Jun 2019 08:52:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2/GD=UU=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1heFHL-0003RI-3j
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 08:52:15 +0000
X-Inumbo-ID: dcbf3959-9401-11e9-8980-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::70f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dcbf3959-9401-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfGLYUvaQgzMddvnvCyF9GEizE5jsFT4596kft3iMvM=;
 b=aJM9Q21FfCgeoQ3A9yk/AU+0r2O6/KT4aKeQgwf7/ImFvsaaDNDqXJyQ8QF59CEz2yN9FIqSnSdEPHsk62UQvjbB3UvcUftGw0auSF9khOriUwdxt1LF52ZHB9HqwEcmknGG90ru9IwabqoghFQHgb4/qSynRx2v5kPI6KRT7D4=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3581.eurprd02.prod.outlook.com (52.134.11.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 21 Jun 2019 08:52:10 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09%5]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 08:52:10 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3] MAINTAINERS: Add myself as a Designated reviewer to
 vm_event
Thread-Index: AQHVKA6cOX+xF/E4TEabcp7VjnuhiA==
Date: Fri, 21 Jun 2019 08:52:10 +0000
Message-ID: <20190621085155.12519-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0070.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::34) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0225935-5ce4-4c19-7806-08d6f625bf07
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3581; 
x-ms-traffictypediagnostic: VI1PR0202MB3581:|VI1PR0202MB3581:
x-microsoft-antispam-prvs: <VI1PR0202MB35815683FCAD16936AFE91C3ABE70@VI1PR0202MB3581.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:324;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(54906003)(52116002)(7416002)(102836004)(5660300002)(2616005)(386003)(66556008)(73956011)(6506007)(5640700003)(66476007)(66446008)(64756008)(66946007)(4744005)(6916009)(36756003)(99286004)(478600001)(14454004)(66066001)(26005)(4326008)(86362001)(1076003)(71200400001)(107886003)(71190400001)(6512007)(316002)(2501003)(53936002)(50226002)(14444005)(256004)(7736002)(6486002)(476003)(2906002)(305945005)(68736007)(25786009)(486006)(81156014)(81166006)(2351001)(6436002)(3846002)(6116002)(8936002)(186003)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3581;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gGkZFYD7WCGS+m1QYqe5IQ4+d7Pe8UUHgP5eywBH+t7G2B/D53Y1i0MjjVyvsGcpTlsUXKQaxuELJtjo8ytqyC+u0oYQCcVHdPnlCzSXQsFmOEjMYTa7THYxRd3ZM7dFflfzlEKBETwrWt0cf7DSPbm0/KRUMCIJXsZ+XQW0s0qZlfqXosZ2QIcs/76CN2A4uYaW46bp7PP4LoWVMSrLGs4WfTvya049apd6IjOUVTftqKaHh3KGu7dRDEdOYpiM+zNeg8yU8MTFLAe8xZTuVxjYBF1Koi2JGcmcjrk+dHc099zZJcLHY0x5HH3a/buRKg0Bbuu6MLCmyeQYgt+cmwNvyfoSFDclVo/szC2KWWcW//seGTxV7G7fKW7t18W+1/XcNdexsJu0kQTfokBaiMWfjTFebqVcgiO8Rf9zmV8=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0225935-5ce4-4c19-7806-08d6f625bf07
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 08:52:10.1907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3581
Subject: [Xen-devel] [PATCH v3] MAINTAINERS: Add myself as a Designated
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
DQoNCi0tLQ0KQ2hhbmdlcyBzaW5jZSB2MjoNCi0gVXNlIHRhYiBpbnN0ZWFkIG9mIHNwYWNlcy4N
Ci0tLQ0KIE1BSU5UQUlORVJTIHwgMSArDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQoNCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQppbmRleCBhYjMyZTdm
NDA5Li5hM2MzZWE1Yzk3IDEwMDY0NA0KLS0tIGEvTUFJTlRBSU5FUlMNCisrKyBiL01BSU5UQUlO
RVJTDQpAQCAtNDEzLDYgKzQxMyw3IEBAIEY6CXVubW9kaWZpZWRfZHJpdmVycy9saW51eC0yLjYv
DQogVk0gRVZFTlQsIE1FTSBBQ0NFU1MgYW5kIE1PTklUT1INCiBNOglSYXp2YW4gQ29qb2NhcnUg
PHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+DQogTToJVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPg0KK1I6CUFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIu
Y29tPg0KIFM6CVN1cHBvcnRlZA0KIEY6CXRvb2xzL3Rlc3RzL3hlbi1hY2Nlc3MNCiBGOgl4ZW4v
YXJjaC8qL21vbml0b3IuYw0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
