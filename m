Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21154C061
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 19:57:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hden2-00083G-RI; Wed, 19 Jun 2019 17:54:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=33VD=US=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hden0-00081R-8T
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 17:54:30 +0000
X-Inumbo-ID: 48821781-92bb-11e9-8980-bc764e045a96
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::60e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 48821781-92bb-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 17:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi7wW3mqiFR9seB4DWgPdfpsM2x2CiNtO/CadgdpxA4=;
 b=Fyus/mWYBzo0GwOfFySt4gXLMJqW+NYhdVI2OhQlEQL5YtPx5VReJgjXpkDaCrrlKvHv441WExFC/dR5CEc4XQZekzzdr2cGXBNgpTD1OXss8AJf0is/BUTe+3spomvRpfjP1jn7pPhRz2/Bi+A0Vv3Xk10D+aoCakpaaywgiDH1Hd8cQ8N9vP0imLpd83+trldSrHB/aDyOeOK2bPHzEkktjYJW+QmBuJe5pVWaX8jrR3F2msrhavcghscy1UR/d1w7NHbS0By0ZklkliO7rjU/O8S1+l76AlXliihIRqIatvXzJkirFEi2agk0NsNze1iy+InemTk28izVu88uuA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB6051.eurprd03.prod.outlook.com (10.255.31.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 17:54:26 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Wed, 19 Jun 2019
 17:54:26 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v7 5/5] xen/arm: optee: document OPTEE option in
 tee/Kconfig
Thread-Index: AQHVJsgJTbER4ZRlKEOiRojFHfVy3A==
Date: Wed, 19 Jun 2019 17:54:26 +0000
Message-ID: <20190619175333.29938-6-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: fc9a9a0e-872a-473f-41d8-08d6f4df2bc7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6051; 
x-ms-traffictypediagnostic: AM0PR03MB6051:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR03MB60515D9DB0A28CEC3A1E7871E6E50@AM0PR03MB6051.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(396003)(136003)(39860400002)(346002)(189003)(199004)(81156014)(186003)(3846002)(76116006)(26005)(6506007)(14454004)(72206003)(64756008)(6436002)(2616005)(1076003)(2351001)(54906003)(486006)(4326008)(5660300002)(36756003)(6486002)(80792005)(4744005)(66556008)(8936002)(66446008)(55236004)(66946007)(446003)(71190400001)(476003)(102836004)(68736007)(66476007)(71200400001)(99286004)(53936002)(6512007)(76176011)(7736002)(6306002)(86362001)(8676002)(966005)(25786009)(73956011)(305945005)(316002)(2501003)(66066001)(14444005)(6116002)(478600001)(256004)(11346002)(2906002)(5640700003)(91956017)(81166006)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6051;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dd3EYGjQRnAhH/MdlQwOeiVFhVAf00oSOqad+vqgOBV+oBjJHr9rZTP1qo0RNATNhqDq5vrMv1Vd6zgCLcQSZGwQyXZnc/NW53cEqcgE3eMl3zIl/cPRbxj4WSgUXPFp/iAviHd4Ofe03LtHYfPq1JUbTS0EGaOI3lSYA8/im2PPUFp0TlzcXVeevMdM47GXBeC1CIlYrQu/rmqQuKqNtxHfZOpyuP8az8w7XvCGqsyTDZbAo1F8Hy0khQmB2HDgSKOoZRTYEoGGq2peRZlA8r6Ex0+7te+lxUUfeI8GnpUwRlWdG0YtI3wb3hriahzZ13ypDGzkT5tcXBhlwxlNjf4NtFAMj4f+VvTStcjLKsuzv8GD91OOO+0hrhJxsSo7l43TbQ3UVcF0UnYPnUgq0ztnG1in/6Y+T7xDNSv0BiA=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9a9a0e-872a-473f-41d8-08d6f4df2bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 17:54:26.7757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6051
Subject: [Xen-devel] [PATCH v7 5/5] xen/arm: optee: document OPTEE option in
 tee/Kconfig
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

QWRkIGJhc2ljIGluZm9ybWF0aW9uIGFib3V0IHRoZSBPUC1URUUgbWVkaWF0b3IgYW5kIG5vdGUg
YWJvdXQKZGVwZW5kZW5jeSBvbiB2aXJ0dWFsaXphdGlvbi1hd2FyZSBPUC1URUUuCgpTaWduZWQt
b2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Ci0t
LQogeGVuL2FyY2gvYXJtL3RlZS9LY29uZmlnIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvS2NvbmZpZyBiL3hl
bi9hcmNoL2FybS90ZWUvS2NvbmZpZwppbmRleCA1YjgyOWRiMmU5Li5iNGI2YWEyNjEwIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcKKysrIGIveGVuL2FyY2gvYXJtL3RlZS9L
Y29uZmlnCkBAIC0yLDMgKzIsOCBAQCBjb25maWcgT1BURUUKIAlib29sICJFbmFibGUgT1AtVEVF
IG1lZGlhdG9yIgogCWRlZmF1bHQgbgogCWRlcGVuZHMgb24gVEVFCisJaGVscAorCSAgRW5hYmxl
IGV4cGVyaW1lbnRhbCBPUC1URUUgbWVkaWF0b3IuIEl0IGFsbG93cyBndWVzdHMgdG8gYWNjZXNz
CisJICBPUC1URUUgcnVubmluZyBvbiB5b3VyIHBsYXRmb3JtLiBUaGlzIHJlcXVpcmVzIHZpcnR1
YWxpemF0aW9uLWVuYWJsZWQKKwkgIE9QLVRFRSBwcmVzZW50LiBZb3UgY2FuIGxlYXJuIG1vcmUg
YWJvdXQgdmlydHVhbGl6YXRpb24gZm9yIE9QLVRFRQorCSAgYXQgaHR0cHM6Ly9vcHRlZS5yZWFk
dGhlZG9jcy5pby9hcmNoaXRlY3R1cmUvdmlydHVhbGl6YXRpb24uaHRtbAotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
