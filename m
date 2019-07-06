Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD06128E
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 20:05:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjp1Q-0005ur-Qb; Sat, 06 Jul 2019 18:02:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dJJZ=VD=starlab.io=will.abele@srs-us1.protection.inumbo.net>)
 id 1hjp1P-0005ue-4E
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 18:02:51 +0000
X-Inumbo-ID: 445a20af-a018-11e9-8980-bc764e045a96
Received: from GCC01-CY1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fd00::701])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 445a20af-a018-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 18:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTcqcqNB6/raMNOEL1VB45nDOMiIOQ+29UorcXcKotU=;
 b=CRGlBknsUNKTEsqYDuAmXDbTI1YFESeahnBN65opCNczmb3izmoweAI59VSnXZFD2ZIVZMfO5RSojHmd1BdbJG3tDiortQnHueXdWbLyf4uI8gTkzCX541BL6FTulQ7NJr4qq9pcr3EFhbSDYgaLjCeogBkJGg6zAn9cnegkeGU=
Received: from DM6PR09MB3211.namprd09.prod.outlook.com (20.178.3.95) by
 DM6PR09MB4189.namprd09.prod.outlook.com (20.179.227.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Sat, 6 Jul 2019 18:02:49 +0000
Received: from DM6PR09MB3211.namprd09.prod.outlook.com
 ([fe80::85fb:bda:f7c:6420]) by DM6PR09MB3211.namprd09.prod.outlook.com
 ([fe80::85fb:bda:f7c:6420%2]) with mapi id 15.20.2052.019; Sat, 6 Jul 2019
 18:02:49 +0000
From: Will Abele <will.abele@starlab.io>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/1] xen/arm: Use "" instead of "/" for domU root node.
Thread-Index: AQHVNCUF1FWSL83L00aTFvePclcnKA==
Date: Sat, 6 Jul 2019 18:02:48 +0000
Message-ID: <dbab1e7ad690f326e2ae230d2dbb2bb80bcfeace.1562435004.git.will.abele@starlab.io>
References: <cover.1562435004.git.will.abele@starlab.io>
In-Reply-To: <cover.1562435004.git.will.abele@starlab.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:404:8d::33) To DM6PR09MB3211.namprd09.prod.outlook.com
 (2603:10b6:5:35::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=will.abele@starlab.io; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [216.246.142.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bdc3d63-701f-472f-09e1-08d7023c27ed
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR09MB4189; 
x-ms-traffictypediagnostic: DM6PR09MB4189:
x-microsoft-antispam-prvs: <DM6PR09MB4189268094DCC44236FDFCB8F6F40@DM6PR09MB4189.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(39830400003)(136003)(346002)(366004)(189003)(199004)(316002)(6506007)(102836004)(386003)(2501003)(11346002)(54906003)(476003)(6512007)(5640700003)(6916009)(446003)(186003)(6436002)(256004)(14444005)(4744005)(25786009)(2616005)(486006)(4326008)(44832011)(81156014)(118296001)(81166006)(36756003)(8676002)(74482002)(68736007)(7736002)(76176011)(53936002)(305945005)(52116002)(508600001)(3846002)(2351001)(2906002)(99286004)(8936002)(6116002)(26005)(66446008)(71200400001)(6486002)(66476007)(66946007)(64756008)(73956011)(50226002)(86362001)(71190400001)(66066001)(66556008)(5660300002)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR09MB4189;
 H:DM6PR09MB3211.namprd09.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: starlab.io does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wXC5ujEdKKXZuc7z41wls39h3SS6NBEbJJ2itTpR/vTUeKRWO/MoqyQDorLAwCx07mPrduRKoklYg20OzTjNKvtdXiLSpCDX9jZtvrcCnZLxJGfGuLrJEn9RsHZRAMgF91jzT2QahgfYmZefAPOHSu1FzrAE9SbWYM7tb8a/sET+seOQr3BN+SNQMokQny3Powf3zazR8Xp5Ca/X6wVOM3r7BZFjOOthm3zHW0ZwsT8gXElLlrAedaFIdYXkDQ039i5llJO2GiaK7KL240UJiI4I+5jHnWtDWlN47XxSgC2qElSY3LAwXVD8p+ylrQ6zknVpx7a6UiQKTn+1GabpdpJev0dqcoMyHXaSpP6ExZs17kufqrwlx7ZWOA/ki0jMmGiDCsnujtdHqE0oj8MQGwQlLGsFx9EtkehrO9tdB+M=
MIME-Version: 1.0
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdc3d63-701f-472f-09e1-08d7023c27ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 18:02:48.9739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: will.abele@starlab.io
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR09MB4189
Subject: [Xen-devel] [PATCH 1/1] xen/arm: Use "" instead of "/" for domU
 root node.
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Will Abele <will.abele@starlab.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2lsbCBBYmVsZSA8d2lsbC5hYmVsZUBzdGFybGFiLmlvPgoKUHJpb3IgdG8gbGludXgg
YTdlNGNmYjBhN2NhNDc3M2U3ZDBkZDFkOWMwMThhYjI3YTE1MzYwZQoobWVyZ2VkIGluIDQuMTUp
LCBMaW51eCBjaGVja2VkIHRvIHNlZSBpZiB0aGUgZGV2aWNlIHRyZWUgdmVyc2lvbiB3YXMKZ3Jl
YXRlciB0aGFuIDB4MTAgYnkgY2hlY2tpbmcgZm9yIGEgcm9vdCBub2RlICIvIi4gWGVuIGNyZWF0
ZXMgYSB2ZXJzaW9uCjB4MTEgZGV2aWNlIHRyZWUsIHNvIHRoZSByb290IG5vZGUncyB1bml0IG5h
bWUgc2hvdWxkIGJlICIiLgoKU2lnbmVkLW9mZi1ieTogV2lsbCBBYmVsZSA8d2lsbC5hYmVsZUBz
dGFybGFiLmlvPgotLS0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpp
bmRleCBkOTgzNjc3OWQxLi5hZjkzNmI0YzNhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCkBAIC0xNjk3LDcg
KzE2OTcsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwcmVwYXJlX2R0Yl9kb21VKHN0cnVjdCBkb21h
aW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCiAgICAgaWYgKCByZXQgPCAwICkKICAg
ICAgICAgZ290byBlcnI7CiAKLSAgICByZXQgPSBmZHRfYmVnaW5fbm9kZShraW5mby0+ZmR0LCAi
LyIpOworICAgIHJldCA9IGZkdF9iZWdpbl9ub2RlKGtpbmZvLT5mZHQsICIiKTsKICAgICBpZiAo
IHJldCA8IDAgKQogICAgICAgICBnb3RvIGVycjsKIAotLSAKMi4yMC4xIChBcHBsZSBHaXQtMTE3
KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
