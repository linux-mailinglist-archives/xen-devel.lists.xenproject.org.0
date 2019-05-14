Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFAC1CF5E
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 20:49:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQcR9-0006Ip-Rq; Tue, 14 May 2019 18:46:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d43k=TO=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hQcR8-0006IX-2h
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 18:46:02 +0000
X-Inumbo-ID: 83946cce-7678-11e9-b74a-ab7fd4ed8cfc
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83946cce-7678-11e9-b74a-ab7fd4ed8cfc;
 Tue, 14 May 2019 18:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl4ySS5eeTawuDCX5HWgqCpYAg8aSneVXVwxUEmAYO8=;
 b=PIuFql/i4Cchyz3BeSSYIN+2SICfrDRmdpwstBELoMroyAjCg9sZKhrCWYYb03+s9D6lM+PanPVqeoJP/rf3rbS+nnRb1uusWCfsGOjJVENfRx0oVY78Et39oU0+IwrHVqV/pi78XMjk2WjiU+4a9FC5TFdcsrU0VSnsVIDRIV6YFzqSqwrs1RbbcM72HWXQi+WePuBv3Yq4DjwtXAEn9/Lw7kc3/e/5OU8PsKH/4OxsB9C+BOlJ2XvSwgwy3OYqWpac6nXmi2REWaI69ecOZrQoADsJmriK7ERN9OE7wlod73srNsOjBZtO3hxygBlMojKBlxfX8+8/f988HkthGg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB3649.eurprd03.prod.outlook.com (52.134.81.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Tue, 14 May 2019 18:45:57 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 18:45:57 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v1 1/2] makefile: add support for *_defconfig targets
Thread-Index: AQHVCoVEjf6vgXECMECEMZlXX+Yh6Q==
Date: Tue, 14 May 2019 18:45:56 +0000
Message-ID: <20190514184552.25100-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75ca9e71-1232-46e8-bf5c-08d6d89c66d3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR03MB3649; 
x-ms-traffictypediagnostic: AM0PR03MB3649:
x-microsoft-antispam-prvs: <AM0PR03MB364930B77B4A5E8EC20BDAC0E6080@AM0PR03MB3649.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(39860400002)(136003)(396003)(199004)(189003)(6116002)(8676002)(81156014)(305945005)(3846002)(6512007)(5640700003)(64756008)(99286004)(66476007)(81166006)(8936002)(66946007)(76116006)(91956017)(73956011)(14454004)(107886003)(53936002)(256004)(26005)(186003)(68736007)(66556008)(66446008)(6436002)(25786009)(6916009)(54906003)(86362001)(1076003)(2616005)(2351001)(478600001)(476003)(486006)(66066001)(2906002)(55236004)(5660300002)(4326008)(7416002)(80792005)(6486002)(6506007)(71200400001)(316002)(2501003)(72206003)(71190400001)(102836004)(7736002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3649;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /B5JeZ2t+i7anJ6Jfv8ORkzt5uoTNoy65Bhuxu/z6f5zuOPEH7dhltJcbfR/tGPi2FXjx0wO8FtSgog5TI7FophjQsO6Gn+T8ioW6ZQs2dobA1MdFelGE2jBflUeECYLT5eWadvTi6ueheN/LJQ+aY0qxo9BwCo54MdRcwYj9+DhwWDqS/4ymuhJrHiwIx98Gy7LEfV1Nc+48MSsgvg2nSkrlcc+zFkDHr6+tiErpIjzxSVMBEIEonZFvY4QesyqDs3DDOQM2nZM4csY23/h6AKcmLu+8NkK/v1NzmZN29IltC6ihh/krRFR6C3aie9kyb0JFBCJ+Wlx50JZgcpc04dgDNYWJYDCTsIuJttamfgdvNpyFZ/cVlaFt0H3rTx3yoRwZ1ozbTFQml/eWpn2us48YHujTprZ9ZUM12/69nA=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ca9e71-1232-46e8-bf5c-08d6d89c66d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 18:45:57.0095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3649
Subject: [Xen-devel] [PATCH v1 1/2] makefile: add support for *_defconfig
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
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWFzZSB1cCBYRU4gY29uZmlndXJhdGlvbiBmb3Igbm9uLXN0YW5kYXJkIGJ1aWxkcywgbGlrZQph
cm12OCB0aW55IGNvbmZpZy4KClNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xv
ZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KLS0tCiBNYWtlZmlsZSAgICAgfCA0ICsrKysKIHhlbi9N
YWtlZmlsZSB8IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggODI5YWM2Mzc0MS4uZWYxZWE0NGVmMSAx
MDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTU0LDYgKzU0LDEwIEBAIGJ1
aWxkOiAkKFRBUkdTX0JVSUxEKQogYnVpbGQteGVuOgogCSQoTUFLRSkgLUMgeGVuIGJ1aWxkCiAK
Ky5QSE9OWTogJV9kZWZjb25maWcKKyVfZGVmY29uZmlnOgorCSQoTUFLRSkgLUMgeGVuICRACisK
IC5QSE9OWTogYnVpbGQtdG9vbHMKIGJ1aWxkLXRvb2xzOiBidWlsZC10b29scy1wdWJsaWMtaGVh
ZGVycwogCSQoTUFLRSkgLUMgdG9vbHMgYnVpbGQKZGlmZiAtLWdpdCBhL3hlbi9NYWtlZmlsZSBi
L3hlbi9NYWtlZmlsZQppbmRleCAxZmQ4YWQ1MTE2Li4zYzdlNDIzMTMyIDEwMDY0NAotLS0gYS94
ZW4vTWFrZWZpbGUKKysrIGIveGVuL01ha2VmaWxlCkBAIC0yNjksNiArMjY5LDkgQEAga2NvbmZp
ZyA6PSBzaWxlbnRvbGRjb25maWcgb2xkY29uZmlnIGNvbmZpZyBtZW51Y29uZmlnIGRlZmNvbmZp
ZyBcCiAkKGtjb25maWcpOgogCSQoTUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01h
a2VmaWxlLmtjb25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQo
SE9TVENDKSIgSE9TVENYWD0iJChIT1NUQ1hYKSIgJEAKIAorJV9kZWZjb25maWc6CisJJChNQUtF
KSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJD
SCkgU1JDQVJDSD0kKFNSQ0FSQ0gpIEhPU1RDQz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RD
WFgpIiAkQAorCiBpbmNsdWRlL2NvbmZpZy8lLmNvbmY6IGluY2x1ZGUvY29uZmlnL2F1dG8uY29u
Zi5jbWQgJChLQ09ORklHX0NPTkZJRykKIAkkKE1BS0UpIC1mICQoQkFTRURJUikvdG9vbHMva2Nv
bmZpZy9NYWtlZmlsZS5rY29uZmlnIEFSQ0g9JChBUkNIKSBTUkNBUkNIPSQoU1JDQVJDSCkgSE9T
VENDPSIkKEhPU1RDQykiIEhPU1RDWFg9IiQoSE9TVENYWCkiIHNpbGVudG9sZGNvbmZpZwogCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
