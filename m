Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAEB1CF60
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 20:49:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQcRC-0006J1-5t; Tue, 14 May 2019 18:46:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d43k=TO=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hQcRA-0006Iw-MY
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 18:46:04 +0000
X-Inumbo-ID: 85736fe0-7678-11e9-a2fd-8f6ba0cb1f43
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85736fe0-7678-11e9-a2fd-8f6ba0cb1f43;
 Tue, 14 May 2019 18:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcYkLKq3yf6ghG70hHmiwOlMEEX+c8Vw8iTBMSrdSdo=;
 b=VV1kIf2hWlVgoh6pYrpRWHADY1NjtG5MtKg8Sh6OpGfIjvGrUEJ3pk1d0WezNA+I2GhoTHvAepyO5Bg81bADbJVPe16aljQf7fkzcWHLL9X37lLRArE/4Nogi0uGRvuk0SMKbttYOuay+8KLdZgGLFBmf81nW7vAph59eSu6UzuRgUfdEoSZ0khc3E/dqAM3Najtm8jlmUhvFM+JyOWXXFkMJ8b2NuccJ3dKECIanHIGK5d463bwdRPBueRleYq8yKBSLkvrt1gFRqjb0sBlHD+3TEHag+lHO3MgOvVuuEMxQZSo0FTuzEvnPbcbCiY/SI0lnVaWxa7+qe1M4LNt3w==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB3649.eurprd03.prod.outlook.com (52.134.81.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Tue, 14 May 2019 18:45:59 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 18:45:59 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v1 2/2] arm: rename tiny64.conf to tiny64_defconfig
Thread-Index: AQHVCoVFOxUfN39jSkeXxK3SLiL2sw==
Date: Tue, 14 May 2019 18:45:59 +0000
Message-ID: <20190514184552.25100-2-volodymyr_babchuk@epam.com>
References: <20190514184552.25100-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190514184552.25100-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83c81156-d6e3-4776-1812-08d6d89c6860
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR03MB3649; 
x-ms-traffictypediagnostic: AM0PR03MB3649:
x-microsoft-antispam-prvs: <AM0PR03MB3649CE9A1D1F25480D9E786EE6080@AM0PR03MB3649.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(39860400002)(136003)(396003)(199004)(189003)(6116002)(8676002)(81156014)(305945005)(3846002)(6512007)(5640700003)(64756008)(99286004)(66476007)(81166006)(8936002)(66946007)(76116006)(91956017)(73956011)(14454004)(107886003)(53936002)(256004)(26005)(186003)(68736007)(66556008)(66446008)(6436002)(25786009)(76176011)(6916009)(4744005)(54906003)(11346002)(86362001)(1076003)(2616005)(2351001)(478600001)(476003)(486006)(66066001)(2906002)(55236004)(5660300002)(4326008)(7416002)(80792005)(6486002)(446003)(6506007)(71200400001)(316002)(2501003)(72206003)(71190400001)(102836004)(7736002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3649;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LsZzPV+r1UeroWvE+mzI80mAxufgoDDTYZx/6fENA2r5yVrcP5zlbqKmtoYHCdRwwM7I01IZuofajnZPcHsIA4uwd2woHRDbgMLjrUAlfMM6ga34AHWs4J4TpmznA5NIz55EDBHyaP0UQnO+z129RKsHpmdZcn+AhtPJvU2Zf82i7+UuTMgrL2RQ3G4giRC2hL+2dYQHEyISB9WpY7LebIQ7RNV088oRORjg5t8Q13waQ0m2Zg8UiSUtX7zPx1CMPpuvwFUCLV2HztkJHJW9QzrEY9/IbhmsoV574yCG8Tr+hZODMPgYUxSgkuDLbKbxXtRkiIrWvYTSchOFq1rGaV3aOU3Zi792mKAaN9W07Z2I2a2Kd3Pn9ffy0iCnsxnY5/MWO0+g60KuRSlQVuOspCh8j/ILdzRenauMv3EsH2E=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c81156-d6e3-4776-1812-08d6d89c6860
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 18:45:59.6000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3649
Subject: [Xen-devel] [PATCH v1 2/2] arm: rename tiny64.conf to
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgYnVpbGQgc3lzdGVtIG5vdyBzdXBwb3J0cyAqX2RlZmNvbmZpZyBydWxlcyBpdCBpcyBnb29k
IHRvIGJlIGFibGUKdG8gY29uZmlndXJlIG1pbmltYWwgWEVOIGltYWdlIHdpdGgKCiBtYWtlIHRp
bnk2NF9kZWZjb25maWcKCmNvbW1hbmQuCgpTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1
ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+ClN1Z2dlc3RlZC1ieTogQW5kcmlpIEFuaXNv
diA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vY29uZmlncy97dGlu
eTY0LmNvbmYgPT4gdGlueTY0X2RlZmNvbmZpZ30gfCAwCiAxIGZpbGUgY2hhbmdlZCwgMCBpbnNl
cnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQogcmVuYW1lIHhlbi9hcmNoL2FybS9jb25maWdzL3t0
aW55NjQuY29uZiA9PiB0aW55NjRfZGVmY29uZmlnfSAoMTAwJSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vY29uZmlncy90aW55NjQuY29uZiBiL3hlbi9hcmNoL2FybS9jb25maWdzL3Rpbnk2
NF9kZWZjb25maWcKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIHhlbi9hcmNoL2Fy
bS9jb25maWdzL3Rpbnk2NC5jb25mCnJlbmFtZSB0byB4ZW4vYXJjaC9hcm0vY29uZmlncy90aW55
NjRfZGVmY29uZmlnCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
