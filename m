Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D94BC55
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 17:05:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdc6r-00008e-9G; Wed, 19 Jun 2019 15:02:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+vWP=US=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hdc6p-00008X-H5
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 15:02:47 +0000
X-Inumbo-ID: 4a9d78e2-92a3-11e9-a74c-eb9738b3d80f
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.131]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a9d78e2-92a3-11e9-a74c-eb9738b3d80f;
 Wed, 19 Jun 2019 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSaBbo3In/tLlqgd6NaHUzLpKa9Fz8brANiEmdX4I0s=;
 b=ppUQ5FuVJ4gjWIBDDvFmsDmjBTyoJ4nwAi5pk+eImlg5s1hE/NpEo5D4pSu98590nbSbSQDQ+mxU7AmheV4VyXlLB9UsUKOLUHpGyrxyyOjkYk1f2L9WU23ZO+9yi8VZ+xHbyDCuiTeIeXIoquT/dC5R7xWK7HyJ4prpOqI8SBw=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2590.eurprd02.prod.outlook.com (10.173.82.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 15:02:42 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09%5]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 15:02:42 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] MAINTAINERS: Add myself as a Designated reviewer to
 vm_event
Thread-Index: AQHVJrALyvJHrXNeekK2S3qDI8nnWQ==
Date: Wed, 19 Jun 2019 15:02:42 +0000
Message-ID: <20190619150228.18054-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VE1PR03CA0059.eurprd03.prod.outlook.com
 (2603:10a6:803:118::48) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20813fcc-5a93-4496-42da-08d6f4c72d6b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2590; 
x-ms-traffictypediagnostic: VI1PR0202MB2590:|VI1PR0202MB2590:
x-microsoft-antispam-prvs: <VI1PR0202MB25908655E9178BA7F9B21A74ABE50@VI1PR0202MB2590.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(366004)(346002)(396003)(39860400002)(199004)(189003)(71190400001)(6436002)(99286004)(2501003)(71200400001)(5640700003)(66946007)(102836004)(73956011)(6506007)(66476007)(26005)(66446008)(66556008)(52116002)(386003)(86362001)(64756008)(6486002)(53936002)(36756003)(81166006)(81156014)(14454004)(8936002)(8676002)(478600001)(5660300002)(6916009)(305945005)(2351001)(7736002)(50226002)(6512007)(66066001)(25786009)(2906002)(107886003)(54906003)(4326008)(1076003)(68736007)(3846002)(6116002)(256004)(14444005)(316002)(4744005)(186003)(486006)(476003)(2616005)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2590;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: t9bgIPkRKxukRMNBFFRekaWfO3+36tXMKIwm0ErrtVazrNFCNA1vcqydAg/VbZ4MBkOB2AAMcXyLxywSdbPOvZxPsQ6/qg13adeQr6RcKiXZm3RCrMalztL8ZiM2Da9QnmCdxRg2dGVniT4KKTsEckaOl472FkN+dp0IRFN6bDYLF5yj/M358ojVqUJRY0Zid4bHsHtttGBemY2mHQ0izifHArta1gpJ6I6dCM5iQkmiIsoiCj6E5XziMuRdnhRUCNOKJGAgUcxpAWsgG3TpkaoVDhSNfVY5i7IzxVtxZvdfGv6tprm/7JQkEWqE8ZFz6B656+HLd0aIUGmjPz7rhyhYk4lM0ObKvfIwJ63mrcSkz61ecjkWRpH2QfJcEfyXoDDooYu4S992bt1V6aBe02Uo+GX+I6PFwH6TANWtQRQ=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20813fcc-5a93-4496-42da-08d6f4c72d6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 15:02:42.0339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2590
Subject: [Xen-devel] [PATCH] MAINTAINERS: Add myself as a Designated
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
DQotLS0NCiBNQUlOVEFJTkVSUyB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQ0KDQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KaW5kZXggYWIzMmU3
ZjQwOS4uNzhlMzUwMTJlMCAxMDA2NDQNCi0tLSBhL01BSU5UQUlORVJTDQorKysgYi9NQUlOVEFJ
TkVSUw0KQEAgLTQxMiw2ICs0MTIsNyBAQCBGOgl1bm1vZGlmaWVkX2RyaXZlcnMvbGludXgtMi42
Lw0KIA0KIFZNIEVWRU5ULCBNRU0gQUNDRVNTIGFuZCBNT05JVE9SDQogTToJUmF6dmFuIENvam9j
YXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPg0KK1I6CUFsZXhhbmRydSBJc2FpbGEgPGFp
c2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KIE06CVRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4NCiBTOglTdXBwb3J0ZWQNCiBGOgl0b29scy90ZXN0cy94ZW4tYWNjZXNzDQotLSAN
CjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
