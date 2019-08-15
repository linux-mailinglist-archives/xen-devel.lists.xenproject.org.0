Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065628F73F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 00:53:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyOYk-0000PN-C4; Thu, 15 Aug 2019 22:49:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6icJ=WL=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hyOYi-0000PI-RV
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 22:49:28 +0000
X-Inumbo-ID: ef91ea4e-bfae-11e9-a661-bc764e2007e4
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (unknown
 [40.107.80.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef91ea4e-bfae-11e9-a661-bc764e2007e4;
 Thu, 15 Aug 2019 22:49:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLGv5Ab7LffU/U+9aEX9/0cWXkxluAzN4mxSJrnu3K+xkd9ekk9s4vtGrAkIyfN33gGrZItQcPYqQGsgQ4fF2DA/AG8VmSoXwMiqJNXL3iZqOZ7UZcevZHliP3M4yrlpOU8iaZpSfHesiXJmfgjw9XCIFGf5G7Edl7cJaAE5A4r2rJbCkf3a+e+WTdQSC+nHXXVg862s2cRdPFYOYU1yx0FFEfC83ixzIXQzWtLCP+aRdHo8fjDE2Bh6P+lyy+g50+0HlLpvEzQS5cB+A6ylpS2aZxl8+aeK+VecRXMgFxp2tCknQGHWlht+vNfk+CzYNqnYIsOEMx2+hhtKvufgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWR9aekVUkr4KPRyzynxbFlsVJADX1q6xkh4z35lZAg=;
 b=LJiI20+JVfIk8Hk3nGGqFzFJ0f0+iYSep10P76Q5VKiMAukCISQ49Y3pcUY5DcwfqwTgMGGrKYcqDxbMSZXVG/lQ9kUAFTubr7zrg0KMU71/nK03Cg2EhJq1iFwkDJ6f66LLIqkYb7NWdgQD1Unpl2XP1dWYzaPHhZFIKvSDjM6YFTCOf7X+P3oDOSr2OJZ8mEUa7jKzQeIkf17oKpBBJnFzCCKUaQn77TlXeA3/YPIf+9iLb44wY3m135GyRZm+TP3322//pn9R+nEqg/f/fVPcjEO2r/l9QTWeUm1qoM9z1dteDgvs3/7wxE0ZwX+udWWSlxEuipJVXtzRwBaXkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWR9aekVUkr4KPRyzynxbFlsVJADX1q6xkh4z35lZAg=;
 b=IX95sjcUyLRBM2zLAlvEtNgQO1H2V8EGQioVEcNA//Dwzn0zt/yKuhBPgFwtVKKuvpqzWXW7EyCzylm9MWI5ZRwrcAUSwu8WFXSJIPouI8uWoha4K7UvPsuR5YSLXN6GXfyvE6Btq1Yuj7BD27uUOZNO/M+z7KmdqNMT6ma2p2g=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3049.namprd12.prod.outlook.com (20.178.30.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Thu, 15 Aug 2019 22:49:26 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::ddb6:7854:6d0c:3090]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::ddb6:7854:6d0c:3090%3]) with mapi id 15.20.2157.021; Thu, 15 Aug 2019
 22:49:26 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] MAINTAINERS: remove myself from SVM and AMD IOMMU
Thread-Index: AQHVU7uwnjkT4wSUUEqHF+UgoNZ7hw==
Date: Thu, 15 Aug 2019 22:49:26 +0000
Message-ID: <1565909356-30066-1-git-send-email-brian.woods@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0501CA0078.namprd05.prod.outlook.com
 (2603:10b6:803:22::16) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 028404bf-4b97-46f5-8f00-08d721d2d2e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3049; 
x-ms-traffictypediagnostic: DM6PR12MB3049:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3049D73A66006DB840DBB059E5AC0@DM6PR12MB3049.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:565;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(199004)(189003)(6512007)(7736002)(81166006)(6436002)(71190400001)(71200400001)(66946007)(305945005)(26005)(86362001)(52116002)(81156014)(50226002)(5640700003)(2351001)(8936002)(3846002)(2501003)(66476007)(66446008)(102836004)(66556008)(386003)(186003)(99286004)(6506007)(8676002)(64756008)(7416002)(476003)(6916009)(316002)(6486002)(14454004)(6116002)(53936002)(36756003)(4326008)(486006)(25786009)(5660300002)(2616005)(54906003)(2906002)(66066001)(4744005)(256004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3049;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yg0KOsGEikl3sSn3Y5z/d8e9hQZtol3d7GAcMUOqp98nntmBVFbRqvmAMNaDWP/Y6r8BL7t/zXPckbGmBGCkLSlP9iCoznI+AIfNUyTNO8fSPe9V5clo0L95pee8pP3bnWfClrUb3xcS3u57+qjUqGA6s1CBAC2FSH9hw0cRVUNX9p4z092uKcBOtF4LJ6ZJ73QxIZikBS/VTGrJOHV8gpet0dX6ue4Ta69mPEpevDTJv8mOLFyQaLYLjG91gQ24xSWh0hsTFniVI8fLBm0uxUlYAVyIeYjg23qAdesUtkYT/FrM2y4y03/7TiAuxLQh3vkqOi29CzPsxpBnoP2JK1vBVcMTCENAHiMX0ECkuMi/Lnrom8J8lSG/OriI6f/SZDrE8j3OfQZwBOoNSl+MAWLofG6hkrQxmW2to2D8qK8=
Content-ID: <85D81F2577269040927F4F88B8E67B08@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 028404bf-4b97-46f5-8f00-08d721d2d2e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 22:49:26.3669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVoR6EFM/FHcx8Hd/zgOsvLJtUmvbxo6OlxAGDjz5cgvwEdl7RAAqUFxClud18CH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3049
Subject: [Xen-devel] [PATCH] MAINTAINERS: remove myself from SVM and AMD
 IOMMU
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "Woods,
 Brian" <Brian.Woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+CgpJIHdpbGwgbm8gbG9uZ2Vy
IGJlIHdvcmtpbmcgYXQgQU1EIGFuZCBhbSByZW1vdmluZyBteXNlbGYuCgpTaWduZWQtb2ZmLWJ5
OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDIg
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNzc0MTNlMC4uMjUxYmZlMiAxMDA2NDQKLS0tIGEvTUFJ
TlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTE0NiwxNCArMTQ2LDEyIEBAIEY6CXRvb2xz
L2xpYmFjcGkvCiAKIEFNRCBJT01NVQogTToJU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVl
LnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KLVI6CUJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQu
Y29tPgogUzoJTWFpbnRhaW5lZAogRjoJeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kLwogCiBB
TUQgU1ZNCiBNOglCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgog
TToJU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4K
LVI6CUJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgogUzoJU3VwcG9ydGVkCiBGOgl4
ZW4vYXJjaC94ODYvaHZtL3N2bS8KIEY6CXhlbi9hcmNoL3g4Ni9jcHUvdnBtdV9hbWQuYwotLSAK
Mi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
