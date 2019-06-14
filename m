Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB7A462AC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 17:25:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbo2t-0005Ly-7m; Fri, 14 Jun 2019 15:23:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nu5J=UN=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hbo2s-0005Lt-1U
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 15:23:14 +0000
X-Inumbo-ID: 51db3d7a-8eb8-11e9-8980-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::624])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 51db3d7a-8eb8-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nueeEQI+3TiTvJBi/sULGHDwQigBOSWvQ560QI2OCww=;
 b=Z1cXXNLK3Pxzwq05k7HLWtouRx9mfuPou76Wq6A8fXeNRGA5Dh1RMPpXGSolaaDF9FbQ7GL2Aj5dnVy6mOKVReBFnZxrG6poKBeVfmHPbSs7E9Er3CIjJRLpemqhcsEHjLUPwPLRamV46UnEhrvSt8vb4LR6ZrPlp8goa4oLMveLvL3ofuNOETecHTaGpT9AZ7RrJnzmqZfLntPN3VwteH1z0C1AyZP2yj2swAqYxE2JNQnhdoHzGu9te7n26rXvr3/zun9D6BBisCnUQEzrP3fNKLg7TK7IhvAHdWCCIChB3k1O7oLPculOeh4/a2/Yb4lsqRbUCw/rXXjPE9qYzQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB3489.eurprd03.prod.outlook.com (52.134.80.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 14 Jun 2019 15:23:09 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Fri, 14 Jun 2019
 15:23:09 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien.grall@arm.com>
Thread-Topic: [PATCH] docs, arm: add documentation on available defconfigs
Thread-Index: AQHVIsUSfIz4DzkjfkaWf8CJQ6bxkA==
Date: Fri, 14 Jun 2019 15:23:09 +0000
Message-ID: <20190614152301.29592-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 654895e5-bc44-448e-8e4c-08d6f0dc3542
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3489; 
x-ms-traffictypediagnostic: AM0PR03MB3489:
x-microsoft-antispam-prvs: <AM0PR03MB34895AB2A5061F977BDA391BE6EE0@AM0PR03MB3489.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(376002)(39860400002)(136003)(366004)(199004)(189003)(486006)(80792005)(6116002)(26005)(5660300002)(476003)(2616005)(66476007)(66446008)(64756008)(66556008)(14454004)(25786009)(7736002)(81156014)(8936002)(72206003)(6512007)(81166006)(3846002)(53936002)(256004)(478600001)(305945005)(8676002)(66946007)(107886003)(4326008)(1076003)(6486002)(73956011)(316002)(55236004)(54906003)(6506007)(110136005)(86362001)(71200400001)(71190400001)(99286004)(102836004)(91956017)(76116006)(2906002)(36756003)(186003)(6436002)(66066001)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3489;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /BHrUjIh4NxBDBqNTBIIwq5QBBFXEjZExGAhooVYfknft8eNsDDo/d714AAKUtuvplO5JX3Xj55M2ZkF+htmhzzexyF2GwcAuPTFX7mn5vDpGeuSwLfHJ7hSDYlY6623o+VENNXy5Rt7j8lv5dJsPdO7VqyaE5C2hRLmTi+gDtHyF16F4lLdZUOIFrTxZbVyBoS+ujAtTFSXoCnS0alikrMqj5dfH+qeCjtwD2gcoY7G8hStpB23ZY+10kq15VOtdPNDB2TXn91qBJfbiikLtDl/YNCFWbmdxSjzfqdkI366BWhFfi93LxT0hiaggKL6AmcdlJeWmVg0VFZfkT+LRhG4WX6eBF1avRhqhpI0WmiiA+Vqh3ob4IE/dUnEzNfelrQSfUFgdELpZAZ7jYIlN614r1qzM+rnhN7LIzIVWXY=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654895e5-bc44-448e-8e4c-08d6f0dc3542
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 15:23:09.5150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3489
Subject: [Xen-devel] [PATCH] docs,
 arm: add documentation on available defconfigs
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgYnVpbGQgc3lzdGVtIG5vdyBoYXZlICpfZGVmY29uZmlnIHRhcmdldHMgZGVmaW5lZCwKbGV0
cyBkZXNjcmliZSBhdmFpbGFibGUgZGVmY29uZmlnIGZpbGVzIGZvciB0aGUgQXJtIGFyY2hpdGVj
dHVyZS4KClNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1
a0BlcGFtLmNvbT4KLS0tCiBkb2NzL21pc2MvYXJtL2RlZmNvbmZpZ3MudHh0IHwgMjMgKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZG9jcy9taXNjL2FybS9kZWZjb25maWdzLnR4dAoKZGlmZiAtLWdpdCBh
L2RvY3MvbWlzYy9hcm0vZGVmY29uZmlncy50eHQgYi9kb2NzL21pc2MvYXJtL2RlZmNvbmZpZ3Mu
dHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjQ2YzUwMzllYmEKLS0t
IC9kZXYvbnVsbAorKysgYi9kb2NzL21pc2MvYXJtL2RlZmNvbmZpZ3MudHh0CkBAIC0wLDAgKzEs
MjMgQEAKK1hlbiBoeXBlcnZpc29yIGZvciBBcm0gYXJjaGl0ZWN0dXJlIGhhdmUgYSBudW1iZXIg
b2YgZGVmY29uZmlncywgd2hpY2gKK2NhbiBiZSB1c2VkIGJ5IGlzc3VpbmcKKworICAgIG1ha2Ug
eHh4eHhfZGVmY29uZmlnCisKK1Rob3NlIGRlZmNvbmZpZ3MgYXJlIGxvY2F0ZWQgaW4geGVuL2Fy
Y2gvYXJtL2NvbmZpZ3MuCisKK0dlbmVyYWxseSwgeW91IGRvbid0IG5lZWQgdG8gdXNlIGFueSBw
YXJ0aWN1bGFyIGRlZmNvbmZpZyBpZiB5b3Ugd2FudAordG8gYnVpbGQgZGVmYXVsdCB2ZXJzaW9u
IG9mIFhlbi4gVGhpcyBpcyBiZWNhdXNlIGRlZmF1bHQgWGVuCitjb25maWd1cmF0aW9uIGlzIGlu
dGVuZGVkIHRvIHJ1biBvbiBhbnkgc3VwcG9ydGVkIHBsYXRmb3JtLgorCitBbnl3YXlzLCB0aGVy
ZSBpcyBhIG51bWJlciBvZiBkZWZjb25maWcgZmlsZXMgd2hpY2ggaGF2ZSBzcGVjaWFsIHVzZToK
KworIC0gYXJtMzJfZGVmY29uZmlnIGlzIHRoZSBzcGVjaWFsIGRlZmNvbmZpZyBmaWxlIHVzZWQg
YnkgYnVpbGQgc3lzdGVtIGFzCisgICB0aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uIGZvciB0aGUg
YXJtMzIgc3ViLWFyY2hpdGVjdHVyZS4KKworIC0gYXJtNjRfZGVmY29uZmlnIGlzIHRoZSBzYW1l
IGFzIGFybTMyX2RlZmNvbmZpZywgYnV0IGZvciBhcm02NCBidWlsZHMuCisKKyAtIHRpbnk2NF9k
ZWZjb25maWcgY29uZmlndXJlcyBYZW4gaHlwZXJ2aXNvciBmb3IgdGhlIG1pbmltYWwgcG9zc2li
bGUKKyAgIGJ1aWxkIGZvciBhcm02NCBhcmNoaXRlY3R1cmUuIEl0IGRpc2FibGVzIG1vc3Qgb2Yg
dGhlIGNvbmZpZ3VyYXRpb24KKyAgIG9wdGlvbnMsIGV4Y2VwdCB0aGUgY3JlZGl0IHNjaGVkdWxl
ci4gVXNlICdtYWtlIG1lbnVjb25maWcnIHRvCisgICBlbmFibGUgZmVhdHVyZXMgbmVlZGVkIGZv
ciB5b3VyIHBsYXRmb3JtLCBvciBwcm9kdWNlZCBpbWFnZSB3aWxsCisgICBiZSBub24tZnVuY3Rp
b25hbC4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
