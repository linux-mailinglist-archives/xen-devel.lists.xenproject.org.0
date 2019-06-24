Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C913551A11
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 19:54:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfT86-00067y-2d; Mon, 24 Jun 2019 17:51:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xwcp=UX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hfT84-00067t-7y
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 17:51:44 +0000
X-Inumbo-ID: b7fa6f9a-96a8-11e9-ae52-4b092177a805
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.65]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7fa6f9a-96a8-11e9-ae52-4b092177a805;
 Mon, 24 Jun 2019 17:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUkj9oz0wT3+Rtdff3bz06arWRfXmfMTxsscFLSollc=;
 b=F9rQwMIho/6wPxZ+KlXImYeTdPDubOtl5ffCZtkDL352SrA58fBs+PmQiFRaxTaBZ6iObzZyUX1Lu3lixoRvfilDku+eHacEfmDfThA0xFpFdDZ2aT5dzQTv945pJTbvAVJoXDbUQ2zs4++GIEWirKb4g2snJQ7n/hkj5cK8PE1bQghMXerxEA13dci2nuNNe2gO+wFLJWj1NEoYYOJEoIvK14fuHNYiPxBjdgknKHDvH7GzIi0L+EVedMOhH98Ql4R0nWvBVP3SpToOaB0+CgQcPbDs2ix+3C5WsFoHZvUk5u7GcbmZ4W7AajLr5oQe/h0Ayng3+GqF3a4UqqzDnw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4130.eurprd03.prod.outlook.com (52.135.148.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 17:51:38 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 17:51:38 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH] MAINTAINERS: add Volodymyr as Reviewer for xen/arm
Thread-Index: AQHVKrSxjpKKP+444026x9dBPelzBKarFYaA
Date: Mon, 24 Jun 2019 17:51:38 +0000
Message-ID: <87zhm6swgm.fsf@epam.com>
References: <alpine.DEB.2.21.1906241041190.2468@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906241041190.2468@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e74dcaef-019e-44b4-a7e9-08d6f8cc9b70
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4130; 
x-ms-traffictypediagnostic: AM0PR03MB4130:
x-microsoft-antispam-prvs: <AM0PR03MB4130E2FD5B35FE6BA4837E04E6E00@AM0PR03MB4130.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(366004)(376002)(136003)(199004)(189003)(14454004)(6506007)(316002)(5660300002)(53936002)(81156014)(81166006)(6246003)(91956017)(76176011)(2906002)(6436002)(8676002)(11346002)(7416002)(8936002)(99286004)(229853002)(6486002)(6116002)(3846002)(66446008)(64756008)(6916009)(6512007)(66556008)(66476007)(73956011)(66946007)(54906003)(66066001)(446003)(86362001)(80792005)(486006)(71190400001)(76116006)(71200400001)(68736007)(36756003)(25786009)(305945005)(7736002)(102836004)(4326008)(26005)(256004)(4744005)(2616005)(476003)(478600001)(55236004)(72206003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4130;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GvWep81BFNLCZTu8WWdDJxHYYO83nvl1KGWKpKjbPfCZqyU2hvD4sUff79ZOezf0oyvxlF/5pKA6pNBYXLk8XikERZ9nK7hRXS1mKBK7FyGBTLVHFU5GYZGkgSJym4+mofHDeFRUeWZOHYJFWt5AzzXuIUUThQSulf9VpgAummf0Gg8c+uRvqM259WagQ2+za3xkfJOMVIJzH4QpDLbLwPxHsncNwAm8ssz8TXXvmv9LpWLAHMNX4TStwh7K8byu2XzWOFk4Y/D/+lTxhFiLzH0risAFk8fb+P5UvqRCtAtdN0jvfe1W8tbvUb56uRdHHIrNesX1AwGDYpIkQ8YChQNZeuY4vuP9ZDNvXVy6nQ5M6dPdtXn+IPPZ6woH073PhxEWQHrVNyk7dGtKM9H317+TfjhOzETKgEdLmMW0EzM=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74dcaef-019e-44b4-a7e9-08d6f8cc9b70
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 17:51:38.3162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4130
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: add Volodymyr as Reviewer for
 xen/arm
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
Cc: "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIFN0ZWZhbm8sCgpTdGVmYW5vIFN0YWJlbGxpbmkgd3JpdGVzOgoKPiBTaWduZWQtb2ZmLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CgpBY2tlZC1ieTogVm9s
b2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKPiBkaWZmIC0tZ2l0
IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IDMxM2RmNTI0OTQuLjg4MmU0ZWZh
MjIgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC0x
NzUsNiArMTc1LDcgQEAgRjoJdG9vbHMvbGlieGMveGNfYXJpbmM2NTMuYwo+ICBBUk0gKFcvIFZJ
UlRVQUxJU0FUSU9OIEVYVEVOU0lPTlMpIEFSQ0hJVEVDVFVSRQo+ICBNOglTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gIE06CUp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4gK1I6CVZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1
a0BlcGFtLmNvbT4KPiAgUzoJU3VwcG9ydGVkCj4gIEw6CXhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+ICBGOglkb2NzL21pc2MvYXJtLwoKCi0tIApCZXN0IHJlZ2FyZHMsVm9sb2R5bXly
IEJhYmNodWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
