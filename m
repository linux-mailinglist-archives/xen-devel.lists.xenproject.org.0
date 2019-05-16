Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505212085E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:40:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGa0-0007s2-FP; Thu, 16 May 2019 13:37:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xJ8a=TQ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hRGZz-0007ro-1g
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:37:51 +0000
X-Inumbo-ID: cb1fdc32-77df-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.61]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb1fdc32-77df-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPxv6HA0QAykRiQIhPvwJNBmEkviNseuKlQtr4JIoo4=;
 b=CVp90wbvg38ZWvGACuQUTedo6XHeXiXAoHji0RxzTjZFcPm9dJIL5PEVFXno41cuKTztR9Qm83LKzHG9u4dibgG9mYKGxlqHWczPoNSHKaJXIkWf2jEw3TSfCy3qNqstFjVsddEQ69g9NQDBMVwjNBKzGzZWK1barRklKDHvEjDWi4GAFKnnrovBJ7Ovc2d3aeem6mWpu2vWNjYaEzvi+R7inEgaIRkBLkWgZGtnhEGGcqJtl74nAYrHRlgU3D/dOAtNUedNgiqeNfhRHeeL1oz9INk+acps4B8Z1BkpDtMyYUFpu11WWk1muDJQtAQ5uK1OvDZP6Wo+smZfMbCSHQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB5540.eurprd03.prod.outlook.com (20.179.252.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Thu, 16 May 2019 13:37:46 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 13:37:46 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 1/2] makefile: add support for *_defconfig targets
Thread-Index: AQHVC+yLP3VjfFwq8UG+mwL2tA3ebA==
Date: Thu, 16 May 2019 13:37:46 +0000
Message-ID: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14972feb-4c5b-4d4d-f199-08d6da03ae86
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR03MB5540; 
x-ms-traffictypediagnostic: AM0PR03MB5540:
x-microsoft-antispam-prvs: <AM0PR03MB5540C53E2619532714321D79E60A0@AM0PR03MB5540.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(346002)(366004)(39860400002)(189003)(199004)(2906002)(186003)(5660300002)(7416002)(256004)(14444005)(2616005)(80792005)(99286004)(486006)(81166006)(81156014)(8936002)(86362001)(476003)(8676002)(54906003)(71190400001)(71200400001)(2501003)(7736002)(305945005)(55236004)(26005)(6506007)(6916009)(6512007)(1076003)(25786009)(66446008)(2351001)(102836004)(6436002)(14454004)(53936002)(6116002)(3846002)(4326008)(36756003)(73956011)(66946007)(6486002)(66556008)(316002)(68736007)(5640700003)(508600001)(72206003)(64756008)(66476007)(66066001)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5540;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mGqvvGLMLGKLSUY9pgZw3bRasNWMmsYRilLgJ9TcZuKu5vGx/wB7yef+kx/QcwxvhcG1hBMQzBO4tnDPf440atCQbXLr0EtEN0ziqxlAnzUcfJlhzqjrm3Uaso9R79qb+EOMsqQbTZcg7RnaO8zkk25iBk/l6h0Og5VQ9qJCgm/uO8l0nYrwG2KzqLSuFEmEi6Bi/5wPYn6rCXdRu4Xy0z7d9n52I8goOvI0yXrY4obnOMd9DXWqn21fIfqEtCI8q2lA/RBI6LAnQiVb3LV2Cyiej7L4qSuCYtNevwOphpxufz6XWbglR/GbUpEmGTigYTwIt0/765ARgjRxBLpVSBJC0H+SzAm03xT/WnxowtwRi4Adpr6Mm3Ov28/JaQsr6biMRg24kp86yxfmlZHwdPkExOeRQ5JpK+kz1W5LTkk=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14972feb-4c5b-4d4d-f199-08d6da03ae86
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 13:37:46.6250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5540
Subject: [Xen-devel] [PATCH v2 1/2] makefile: add support for *_defconfig
 targets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWFzZSB1cCBYRU4gY29uZmlndXJhdGlvbiBmb3Igbm9uLXN0YW5kYXJkIGJ1aWxkcywgbGlrZQph
cm12OCB0aW55IGNvbmZpZy4KClNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xv
ZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KLS0tCiBDaGFuZ2VzIGZyb20gdjI6CiAtIHJlbW92ZSAl
X2RlZmNvbmZpZyBydWxlIGluIGZhdm9yIG9mIGxpc3Qgb2YgcmVhbCAqX2RlZmNvbmZpZyBmaWxl
cwoKIE1ha2VmaWxlICAgICB8IDQgKysrKwogeGVuL01ha2VmaWxlIHwgMiArLQogMiBmaWxlcyBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9NYWtl
ZmlsZSBiL01ha2VmaWxlCmluZGV4IDgyOWFjNjM3NDEuLmVmMWVhNDRlZjEgMTAwNjQ0Ci0tLSBh
L01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC01NCw2ICs1NCwxMCBAQCBidWlsZDogJChUQVJH
U19CVUlMRCkKIGJ1aWxkLXhlbjoKIAkkKE1BS0UpIC1DIHhlbiBidWlsZAogCisuUEhPTlk6ICVf
ZGVmY29uZmlnCislX2RlZmNvbmZpZzoKKwkkKE1BS0UpIC1DIHhlbiAkQAorCiAuUEhPTlk6IGJ1
aWxkLXRvb2xzCiBidWlsZC10b29sczogYnVpbGQtdG9vbHMtcHVibGljLWhlYWRlcnMKIAkkKE1B
S0UpIC1DIHRvb2xzIGJ1aWxkCmRpZmYgLS1naXQgYS94ZW4vTWFrZWZpbGUgYi94ZW4vTWFrZWZp
bGUKaW5kZXggMWZkOGFkNTExNi4uYzgwOTE0YzMxZCAxMDA2NDQKLS0tIGEveGVuL01ha2VmaWxl
CisrKyBiL3hlbi9NYWtlZmlsZQpAQCAtMjY0LDcgKzI2NCw3IEBAICQoZm9yZWFjaCBiYXNlLGFy
Y2gveDg2L21tL2d1ZXN0X3dhbGtfJSBcCiAKIGtjb25maWcgOj0gc2lsZW50b2xkY29uZmlnIG9s
ZGNvbmZpZyBjb25maWcgbWVudWNvbmZpZyBkZWZjb25maWcgXAogCW5jb25maWcgeGNvbmZpZyBn
Y29uZmlnIHNhdmVkZWZjb25maWcgbGlzdG5ld2NvbmZpZyBvbGRkZWZjb25maWcgXAotCXJhbmRj
b25maWcKKwlyYW5kY29uZmlnICQobm90ZGlyICQod2lsZGNhcmQgYXJjaC8kKFNSQ0FSQ0gpL2Nv
bmZpZ3MvKl9kZWZjb25maWcpKQogLlBIT05ZOiAkKGtjb25maWcpCiAkKGtjb25maWcpOgogCSQo
TUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcgQVJDSD0k
KEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9TVENYWD0iJChI
T1NUQ1hYKSIgJEAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
