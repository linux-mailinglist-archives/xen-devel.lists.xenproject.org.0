Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37644C062
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 19:57:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdemx-00080Q-Un; Wed, 19 Jun 2019 17:54:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=33VD=US=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hdemw-0007zx-7y
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 17:54:26 +0000
X-Inumbo-ID: 45dcbe49-92bb-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::62f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 45dcbe49-92bb-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 17:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Uag9/qBAWGN5CBHVHEcEymjX/oleG7d6nDRggHtb1o=;
 b=mkhM0QFGHJrSXzIx17RpCiqTDkLWkI3Z1uhyFRZBiQKB8Gw63Nkq1FVwEAf4kMCH563lOZXR385WgcrEb3dDzZbNkq6qPIzuBYrF8JtFmQQTMiNrCV5jJnxtfx2ow05Y/zP7Lagn/2/NkS1C620P34l7RcnCU5rB91Onn7jXxTUlyfM4zHUYgRVvC0fqIiPAFikpi+eqRm54s+hmDXG4OkyDrV3RhqVRuEGpCF33kUG2xIspVtR2aO3keTB29cktm+7lyEUWbfCUUzbCuTPR7Z6rYrd1KESDwUs9s3cgvmJiZ3ETeHqyWSttWDopO6ymS6NMn0+Y7nHev9HIl0szHw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB6051.eurprd03.prod.outlook.com (10.255.31.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 17:54:22 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Wed, 19 Jun 2019
 17:54:22 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v7 3/5] xen/arm: tee: place OP-TEE Kconfig option right
 after TEE
Thread-Index: AQHVJsgGYa5WnTLK6UWfYJbWAI6NXg==
Date: Wed, 19 Jun 2019 17:54:22 +0000
Message-ID: <20190619175333.29938-4-volodymyr_babchuk@epam.com>
References: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2eb65e0-f1c3-41df-74e7-08d6f4df291b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6051; 
x-ms-traffictypediagnostic: AM0PR03MB6051:
x-microsoft-antispam-prvs: <AM0PR03MB605173C18C0C3E7F3BB4CDAFE6E50@AM0PR03MB6051.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(396003)(136003)(39860400002)(346002)(189003)(199004)(81156014)(186003)(3846002)(76116006)(26005)(6506007)(14454004)(72206003)(64756008)(6436002)(2616005)(1076003)(2351001)(54906003)(486006)(4326008)(5660300002)(36756003)(6486002)(80792005)(4744005)(66556008)(8936002)(66446008)(55236004)(66946007)(446003)(71190400001)(476003)(102836004)(68736007)(66476007)(71200400001)(99286004)(53936002)(6512007)(76176011)(7736002)(86362001)(8676002)(25786009)(73956011)(305945005)(316002)(2501003)(66066001)(14444005)(6116002)(478600001)(256004)(11346002)(2906002)(5640700003)(91956017)(81166006)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6051;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wb+HJBmkmjkT6SfSmwzYSyACnswD7LZtEhLafhrEnNenrpMygP5SEdqjizQ57Aae+LiLhpHBhf6lwLudKEgKeiH12KIYRaZOteReCLJ2KbPjMcQhDyGhk8kacap+a8Cf6iotQuM+KSOJ8HlYp7NKA5W3065LMXpf9eqftH3W5128s8chI7ZDlKMqWnd3FNjxshe+0IYdWHPPF2XNBdqpZ2paogCXpEbeEgXUVfCjWWdz88hs+ZaB1D45SYG4Auwo5mWcm7Sb4z36H1iFm9JxUHpbQk9Cga5RRG2+DLJcV7umTwZsplNiNQ3iyLYihB/lpAJSr2yBpK7VGucA/DWSG6uTb29hXh/WfyCB530p7U5Oq0vdoqssWxivpekAzabRlBvOWvSzyJG3jgqYhggFo7la1OBaJNOizVhdVw/DpQo=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2eb65e0-f1c3-41df-74e7-08d6f4df291b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 17:54:22.2524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6051
Subject: [Xen-devel] [PATCH v7 3/5] xen/arm: tee: place OP-TEE Kconfig
 option right after TEE
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgbmljZXIsIHdoZW4gb3B0aW9ucyBmb3IgcGFydGljdWxhciBURUUgbWVkaWF0b3JzIChj
dXJyZW50bHksCk9QLVRFRSBvbmx5KSBhcmUgZm9sbG93aW5nIGdlbmVyaWMgIkVuYWJsZSBURUUg
bWVkaWF0b3JzIHN1cHBvcnQiCm9wdGlvbiBpbiB0aGUgbWVudWNvbmZpZzoKCiBbKl0gRW5hYmxl
IFRFRSBtZWRpYXRvcnMgc3VwcG9ydAogWyBdICAgRW5hYmxlIE9QLVRFRSBtZWRpYXRvcgoKU2ln
bmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29t
PgotLS0KIHhlbi9hcmNoL2FybS9LY29uZmlnIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9L
Y29uZmlnIGIveGVuL2FyY2gvYXJtL0tjb25maWcKaW5kZXggMDRkMzk5ZmZiZi4uYzJkYjJhNjk1
MyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcKKysrIGIveGVuL2FyY2gvYXJtL0tj
b25maWcKQEAgLTExMyw2ICsxMTMsOCBAQCBjb25maWcgVEVFCiAJICBUaGlzIG9wdGlvbiBlbmFi
bGVzIGdlbmVyaWMgVEVFIG1lZGlhdG9ycyBzdXBwb3J0LiBJdCBhbGxvd3MgZ3Vlc3RzCiAJICB0
byBhY2Nlc3MgcmVhbCBURUUgdmlhIG9uZSBvZiBURUUgbWVkaWF0b3JzIGltcGxlbWVudGVkIGlu
IFhFTi4KIAorc291cmNlICJhcmNoL2FybS90ZWUvS2NvbmZpZyIKKwogZW5kbWVudQogCiBtZW51
ICJBUk0gZXJyYXRhIHdvcmthcm91bmQgdmlhIHRoZSBhbHRlcm5hdGl2ZSBmcmFtZXdvcmsiCkBA
IC0yMzgsNSArMjQwLDMgQEAgc291cmNlICJhcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZyIKIHNv
dXJjZSAiY29tbW9uL0tjb25maWciCiAKIHNvdXJjZSAiZHJpdmVycy9LY29uZmlnIgotCi1zb3Vy
Y2UgImFyY2gvYXJtL3RlZS9LY29uZmlnIgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
