Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461FA73638
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 19:59:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqLUU-0000YB-Fc; Wed, 24 Jul 2019 17:55:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ItzJ=VV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hqLUS-0000Y6-Mm
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 17:55:48 +0000
X-Inumbo-ID: 4398aa13-ae3c-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4398aa13-ae3c-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 17:55:46 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0B4maToHIbWQDQ0w5GjuzOK1K29vQFlO9wfIyCQH2A+FgLWDpIqfdjxBBWtqVka+L7eivhmRQf
 R9zCgu97FPCV8/s/yikmcQmvn6MpE+Y4wmS1JRbVwbIrwy16678gZkYF+PZHacC4Q3t30Iig2X
 zlZX91nxtqBptYxfzBGh2sbXvh1zyyTLPt+UrwCv7WKh/hBh6NIKgbfo5dZ1oPHAr2dsknwE5z
 NJYQb8FuD7V936G8wC4+O0EiBtxTnvY6h65H+AvFPEV9pH1+I/g8FS8WbCgKFqC9CrObtaHmeQ
 Tr4=
X-SBRS: 2.7
X-MesageID: 3511983
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,303,1559534400"; 
   d="scan'208";a="3511983"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 24 Jul 2019 18:55:38 +0100
Message-ID: <20190724175538.6098-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190724174256.5295-1-andrew.cooper3@citrix.com>
References: <20190724174256.5295-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/3] x86/dmi: Drop warning with an obsolete URL
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBxdWlyayBkb2Vzbid0IGNoYW5nZSBhbnl0aGluZyBpbiBYZW4sIGFuZCB0aGUgd2ViIHBh
Z2UgZG9lc24ndCBleGlzdC4KClRoZSB3YXliYWNrIG1hY2hpbmUgY29uZmlybXMgdGhhdCB0aGUg
bGluayBkaXNhcHBlYXJlZCBzb21ld2hlcmUgYmV0d2VlbgoyMDAzLTA2LTE0IGFuZCAyMDA0LTA3
LTA3LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L2RtaV9zY2FuLmMgfCAxNSAtLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG1p
X3NjYW4uYyBiL3hlbi9hcmNoL3g4Ni9kbWlfc2Nhbi5jCmluZGV4IDgwOGZhN2YxMGUuLjA1M2Yw
NTk4Y2MgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kbWlfc2Nhbi5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9kbWlfc2Nhbi5jCkBAIC00NTUsMTYgKzQ1NSw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBk
bWlfc2F2ZV9pZGVudChzdHJ1Y3QgZG1pX2hlYWRlciAqZG0sIGludCBzbG90LCBpbnQgc3RyaW5n
KQogI2RlZmluZSBOT19NQVRDSAl7IERNSV9OT05FLCBOVUxMfQogI2RlZmluZSBNQVRDSAkJRE1J
X01BVENICiAKLS8qCi0gKiBUb3NoaWJhIGtleWJvYXJkIGxpa2VzIHRvIHJlcGVhdCBrZXlzIHdo
ZW4gdGhleSBhcmUgbm90IHJlcGVhdGVkLgotICovCi0KLXN0YXRpYyBfX2luaXQgaW50IGJyb2tl
bl90b3NoaWJhX2tleWJvYXJkKGNvbnN0IHN0cnVjdCBkbWlfYmxhY2tsaXN0ICpkKQotewotCXBy
aW50ayhLRVJOX1dBUk5JTkcgIlRvc2hpYmEgd2l0aCBicm9rZW4ga2V5Ym9hcmQgZGV0ZWN0ZWQu
IElmIHlvdXIga2V5Ym9hcmQgc29tZXRpbWVzIGdlbmVyYXRlcyAzIGtleXByZXNzZXMgaW5zdGVh
ZCBvZiBvbmUsIHNlZSBodHRwOi8vZGF2eWQudWNjLmFzbi5hdS9wcm9qZWN0cy90b3NoaWJhL1JF
QURNRVxuIik7Ci0JcmV0dXJuIDA7Ci19Ci0KIHN0YXRpYyBpbnQgX19pbml0IGljaDEwX2Jpb3Nf
cXVpcmsoY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgKmQpCiB7CiAgICAgdTMyIHBvcnQsIHNt
aWN0bDsKQEAgLTUzNSwxMSArNTI1LDYgQEAgc3RhdGljIF9faW5pdCBpbnQgZm9yY2VfYWNwaV9o
dChjb25zdCBzdHJ1Y3QgZG1pX2JsYWNrbGlzdCAqZCkKICAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZG1pX2JsYWNrbGlzdCBfX2luaXRjb25zdCBkbWlfYmxhY2tsaXN0W109ewogCi0JeyBicm9rZW5f
dG9zaGliYV9rZXlib2FyZCwgIlRvc2hpYmEgU2F0ZWxsaXRlIDQwMzBjZHQiLCB7IC8qIEtleWJv
YXJkIGdlbmVyYXRlcyBzcHVyaW91cyByZXBlYXRzICovCi0JCQlNQVRDSChETUlfUFJPRFVDVF9O
QU1FLCAiUzQwMzBDRFQvNC4zIiksCi0JCQlOT19NQVRDSCwgTk9fTUFUQ0gsIE5PX01BVENICi0J
CQl9IH0sCi0KIAl7IHJlc2V0X3ZpZGVvbW9kZV9hZnRlcl9zMywgIlRvc2hpYmEgU2F0ZWxsaXRl
IDQwMzBjZHQiLCB7IC8qIFJlc2V0IHZpZGVvIG1vZGUgYWZ0ZXIgcmV0dXJuaW5nIGZyb20gQUNQ
SSBTMyBzbGVlcCAqLwogCQkJTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIlM0MDMwQ0RULzQuMyIp
LAogCQkJTk9fTUFUQ0gsIE5PX01BVENILCBOT19NQVRDSAotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
