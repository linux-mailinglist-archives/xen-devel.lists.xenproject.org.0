Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC296128D
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 20:05:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjp1E-0005t9-Ft; Sat, 06 Jul 2019 18:02:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dJJZ=VD=starlab.io=will.abele@srs-us1.protection.inumbo.net>)
 id 1hjp1C-0005t4-Uc
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 18:02:38 +0000
X-Inumbo-ID: 3cf8dcec-a018-11e9-8980-bc764e045a96
Received: from GCC01-CY1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fd00::713])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3cf8dcec-a018-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 18:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LBmdQyeOYE0co4Ovpm/tHV3ogaUfAuXvhVD6IkCkj0=;
 b=VipUryrJHzE3a9Oh+nSD2FWtRARnwIXzBLS59v94pY8Hk0lR0bz43unv48k9+IG8mZ/7558kdqZDf3Ku8HXGZLnx0ofZkG+dbbKH7SoJaQ05tT3n+rGAm8oehetiSSYZdlokV8c6hFLx5q960o+FJstm/3aUY0V1PalEy6JHPM8=
Received: from DM6PR09MB3211.namprd09.prod.outlook.com (20.178.3.95) by
 DM6PR09MB4189.namprd09.prod.outlook.com (20.179.227.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Sat, 6 Jul 2019 18:02:34 +0000
Received: from DM6PR09MB3211.namprd09.prod.outlook.com
 ([fe80::85fb:bda:f7c:6420]) by DM6PR09MB3211.namprd09.prod.outlook.com
 ([fe80::85fb:bda:f7c:6420%2]) with mapi id 15.20.2052.019; Sat, 6 Jul 2019
 18:02:34 +0000
From: Will Abele <will.abele@starlab.io>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/1] Dom0less guest device tree format
Thread-Index: AQHVNCT8i/e9XHQvKUuqip9pKzLNpw==
Date: Sat, 6 Jul 2019 18:02:34 +0000
Message-ID: <cover.1562435004.git.will.abele@starlab.io>
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
x-ms-office365-filtering-correlation-id: b66f3c60-f751-474b-1de4-08d7023c1f3a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR09MB4189; 
x-ms-traffictypediagnostic: DM6PR09MB4189:
x-microsoft-antispam-prvs: <DM6PR09MB41899DDC4A4CB75B1AF9BE54F6F40@DM6PR09MB4189.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(39830400003)(136003)(346002)(366004)(189003)(199004)(316002)(6506007)(102836004)(386003)(2501003)(54906003)(476003)(6512007)(5640700003)(6916009)(186003)(6436002)(256004)(14444005)(4744005)(25786009)(2616005)(486006)(4326008)(44832011)(81156014)(81166006)(36756003)(8676002)(74482002)(68736007)(7736002)(53936002)(305945005)(52116002)(508600001)(3846002)(2351001)(2906002)(99286004)(8936002)(6116002)(26005)(66446008)(71200400001)(6486002)(66476007)(66946007)(64756008)(73956011)(50226002)(86362001)(71190400001)(66066001)(66556008)(5660300002)(14454004)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR09MB4189;
 H:DM6PR09MB3211.namprd09.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: starlab.io does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mMSI0sydH9L2oi/iPkxPY8UTsRizU+dEcBttkUfhuClqlQI9HoS99e9CD2vTG5ijhhXAl1rhzPP2YPzaAmksXVLLRnenNv6++6u2MmfaQ09XA7xvTohzP4dJcJYX7ESgevVkHxtt4I6Fz0l1GFZl4tTRec1UoMIlASmzcPK3lbzNafHmXTuPyrXDTvgTdz1+zBdSaDofAZkaGm/4QkM21U1p3VErJiXh8fXgvR2vH8wzacWmsKv+itFthqJAf4ey/n5puclGtRk5q5FWh5/bTyc4ICIJuMwXjaGjVBeAjS5R+vtJQ3AC6VGsukDjP6XyoHWBuZ6ad9zjhTs99S8gRt/2sxxsAaYM9QoNQ+T3vWLfQ2NAa7pLgo0RidTqFtDERfugYJqegz7xvltF6t7sh2L4P/iEyJAz5yZnkoYTjFc=
MIME-Version: 1.0
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b66f3c60-f751-474b-1de4-08d7023c1f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 18:02:34.4319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: will.abele@starlab.io
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR09MB4189
Subject: [Xen-devel] [PATCH 0/1] Dom0less guest device tree format
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

RnJvbTogV2lsbCBBYmVsZSA8d2lsbC5hYmVsZUBzdGFybGFiLmlvPgoKSGksCgpJJ3ZlIGJlZW4g
dXNpbmcgZG9tMGxlc3MgWGVuIG9uIHRoZSBIaWtleSA5NjAgd2l0aCBhIDQuMTQgTGludXggS2Vy
bmVsLiBJIGhhZAp0cm91YmxlIGdldHRpbmcgdGhlIDQuMTQgTGludXggS2VybmVsIHRvIGJvb3Qg
YXMgYSBkb20wbGVzcyBkb21VIGJlY2F1c2UgaXQgd2FzCm1pc2ludGVycHJldGluZyB0aGUgZGV2
aWNlIHRyZWUgdmVyc2lvbi4gTGludXggNC4xNCBhbmQgZWFybGllciBpbnRlcnByZXQgZGV2aWNl
CnRyZWVzIHdpdGggYSAiLyIgaW4gdGhlIHJvb3Qgbm9kZSBhcyB2ZXJzaW9uIDE2LiBYZW4gcHJv
ZHVjZXMgYSB2ZXJzaW9uIDE3CmRldmljZSB0cmVlLCBzbyB0aGUgcm9vdCBub2RlIG5lZWRzIHRv
IGJlICIiIHRvIHdvcmsgd2l0aCA0LjE0IGFuZCBlYXJsaWVyIExpbnV4Cktlcm5lbHMuIExpbnV4
IDQuMTUgYW5kIGxhdGVyIGFzc3VtZSB0aGF0IHRoZSB2ZXJzaW9uIGlzIDE3LCBzbyB0aGlzIHBh
dGNoIGRvZXMKbm90IGhhdmUgYW55IGltcGFjdC4KClBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ug
bmVlZCBhbnkgbW9yZSBpbmZvcm1hdGlvbiBvciBoYXZlIHN1Z2dlc3Rpb25zIGZvcgpvdGhlciB3
YXlzIHRvIGhhbmRsZSB0aGlzLgoKVGhhbmtzLApXaWxsCgpXaWxsIEFiZWxlICgxKToKICB4ZW4v
YXJtOiBVc2UgIiIgaW5zdGVhZCBvZiAiLyIgZm9yIGRvbVUgcm9vdCBub2RlLgoKIHhlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMjAuMSAoQXBwbGUgR2l0LTExNykKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
