Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C61C2085D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:40:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGa0-0007s9-PP; Thu, 16 May 2019 13:37:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xJ8a=TQ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hRGZz-0007rv-Ci
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:37:51 +0000
X-Inumbo-ID: cc973693-77df-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.61]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc973693-77df-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaQtO2MQMhahUSqHZKkoUYexy4jc4x+Cxeb4Dt/OPIo=;
 b=fw48NtWhCxNhaxCDFg4IFQ3TWy3iJv/DjQJRTdy6lma1ZGXEHw694pjCoEZsYA7Iz/veMFkA4pKE8WDO8swp+KImF6TZWT5bdOZ9JPgWGFDqpO0brtwFvuCIpnAMRLNUbz2yIOn4N6eMJIaJURvZlpZ9TrRXmwbB5I/ZE8mc4Mfs4qfQS55Z+3AFTysmCdP/UFeZnANSM9rqUcQqs2eJg/YFU/V+LC0Wc3RDm9UnO7yxFT5B5znE3x9XS+gLlVhrw4mYE1JAxh+ZilPBbGrUb2s6mK8ol+QXldoiHELqAcX3ri09hoDXv8dMjdXLradZ3/Yz3ZVvR//kQQEeZ5XTWQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB5540.eurprd03.prod.outlook.com (20.179.252.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Thu, 16 May 2019 13:37:47 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 13:37:47 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/2] arm: rename tiny64.conf to tiny64_defconfig
Thread-Index: AQHVC+yMHILNn8cZtESyMQqnzza/oA==
Date: Thu, 16 May 2019 13:37:47 +0000
Message-ID: <20190516133735.18883-2-volodymyr_babchuk@epam.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65070149-4f5d-4ce5-6f91-08d6da03aefd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR03MB5540; 
x-ms-traffictypediagnostic: AM0PR03MB5540:
x-microsoft-antispam-prvs: <AM0PR03MB5540D82B94BA8A28E38E3954E60A0@AM0PR03MB5540.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(346002)(366004)(39860400002)(189003)(199004)(2906002)(186003)(5660300002)(256004)(2616005)(80792005)(99286004)(486006)(446003)(81166006)(81156014)(8936002)(86362001)(76176011)(11346002)(476003)(8676002)(54906003)(4744005)(71190400001)(71200400001)(2501003)(7736002)(305945005)(55236004)(26005)(6506007)(6916009)(6512007)(1076003)(25786009)(66446008)(2351001)(102836004)(6436002)(14454004)(53936002)(6116002)(3846002)(4326008)(36756003)(73956011)(66946007)(6486002)(66556008)(316002)(68736007)(5640700003)(508600001)(72206003)(64756008)(66476007)(66066001)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5540;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nMbRSZuGKAU3H0cMXWGaGkl6V+Bg8Yc5VH0GbOdjGFt0ak70lMQ5NssF9Q+5xFa8hyoneOTWe1uoEdjb9diz7xmMLCypfA6g5L8QZo948Fj5p5+jLdEwdC1FWNoza3Yuq5tsWFHAHTvJU/fvUN+gQFATQHwnT5h2UhSGyL6Bkf5/XSXWBjs/WIZRPwaSBjJnjDC/X44pPQsJM4e29ZprGKDZ3jEGHkqySl6JHTxY17m0neRRkkP/2Gzrrffds3d1rfIgU9MBK+AL99KmzudttVPhqkK+OtTN/kv9UjZP7jj6fomtu3Ouqc1HyZgqv27KEs5gOdLYJWD7SrOREtgwlRqzgWjd2veGglaqRB84zGudat4q2sGLqjxLO4c12UX0j9uFv/DLb2glxlVNFAYrl9r5eur95p8BSjUD5Akg0xE=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65070149-4f5d-4ce5-6f91-08d6da03aefd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 13:37:47.0898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5540
Subject: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgYnVpbGQgc3lzdGVtIG5vdyBzdXBwb3J0cyAqX2RlZmNvbmZpZyBydWxlcyBpdCBpcyBnb29k
IHRvIGJlIGFibGUKdG8gY29uZmlndXJlIG1pbmltYWwgWEVOIGltYWdlIHdpdGgKCiBtYWtlIHRp
bnk2NF9kZWZjb25maWcKCmNvbW1hbmQuCgpTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1
ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2NvbmZpZ3Mv
e3Rpbnk2NC5jb25mID0+IHRpbnk2NF9kZWZjb25maWd9IHwgMAogMSBmaWxlIGNoYW5nZWQsIDAg
aW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIHJlbmFtZSB4ZW4vYXJjaC9hcm0vY29uZmln
cy97dGlueTY0LmNvbmYgPT4gdGlueTY0X2RlZmNvbmZpZ30gKDEwMCUpCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2NvbmZpZ3MvdGlueTY0LmNvbmYgYi94ZW4vYXJjaC9hcm0vY29uZmlncy90
aW55NjRfZGVmY29uZmlnCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSB4ZW4vYXJj
aC9hcm0vY29uZmlncy90aW55NjQuY29uZgpyZW5hbWUgdG8geGVuL2FyY2gvYXJtL2NvbmZpZ3Mv
dGlueTY0X2RlZmNvbmZpZwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
