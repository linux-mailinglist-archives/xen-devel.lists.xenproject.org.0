Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346BA2D4AD
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 06:25:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVq7N-0007Ri-Ur; Wed, 29 May 2019 04:23:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PiYs=T5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hVq7N-0007Rd-9C
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 04:23:13 +0000
X-Inumbo-ID: 77e27aa4-81c9-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 77e27aa4-81c9-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 04:23:11 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: IJDR6ceTI/1up2X2njyBRC3lg55n9KOR05RHYrGj9akX8uuNCdwdsgdR0WPWz3RG6KI6VAAGqQ
 C4Zu1KxaU4DSHoBGszry95hDZ5RaKateazdy+1pbkC3ATpLgM9HpGoSkZKRpNBDXXMNgwPGURQ
 7eTk41tqTNXT2lI9rvx0WOqNEE20C2z7fJtpFGXf/f/dP5mhOcSl+3sjs3xztFMGAFfiU02Jka
 OuhCdXCOoXhXNyMWG51c2vlozvg8MyZp4Toi4ge0yQHM6T+9ZWJYcp5Yk4mND87Xaj0Ps7FXpA
 AVA=
X-SBRS: 2.7
X-MesageID: 1021925
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,525,1549947600"; 
   d="scan'208";a="1021925"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 29 May 2019 05:23:04 +0100
Message-ID: <1559103784-23731-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/altp2m: Fix style errors introduced with
 c/s 9abcac7ff
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCBpbnRyb2R1Y2VkIHRyYWlsaW5nIHdoaXRlc3BhY2UsIGV4Y2Vzc2l2ZWx5IGxvbmcgbGlu
ZXMsIG1hbC1pbmRlbnRpb24sCnN1cGVyZmx1b3VzIHVzZSBvZiBQUkkgbWFjcm9zIGZvciBpbnQt
b3Itc21hbGxlciB0eXBlcywgYW5kIGluY29ycmVjdCBQUkkKbWFjcm9zIGZvciBnZm5zIGFuZCBt
Zm5zLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KLS0tCkNDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+
CkNDOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNDOiBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9o
dm0uYyB8IDUgKysrLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgfCA4ICsrKystLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwppbmRleCAw
ZTMzZTA0Li5hNDQ5NDRiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTE3NjUsMTIgKzE3NjUsMTMgQEAgaW50IGh2bV9o
YXBfbmVzdGVkX3BhZ2VfZmF1bHQocGFkZHJfdCBncGEsIHVuc2lnbmVkIGxvbmcgZ2xhLAogICAg
IHsKICAgICAgICAgcDJtID0gcDJtX2dldF9hbHRwMm0oY3Vycik7CiAKLSAgICAgICAgLyogCisg
ICAgICAgIC8qCiAgICAgICAgICAqIEdldCB0aGUgYWx0cDJtIGVudHJ5IGlmIHByZXNlbnQ7IG9y
IGlmIG5vdCwgcHJvcGFnYXRlIGZyb20KICAgICAgICAgICogdGhlIGhvc3QgcDJtLiAgTkIgdGhh
dCB0aGlzIHJldHVybnMgd2l0aCBnZm4gbG9ja2VkIGluIHRoZQogICAgICAgICAgKiBhbHRwMm0u
CiAgICAgICAgICAqLwotICAgICAgICBpZiAoIHAybV9hbHRwMm1fZ2V0X29yX3Byb3BhZ2F0ZShw
Mm0sIGdmbiwgJm1mbiwgJnAybXQsICZwMm1hLCBwYWdlX29yZGVyKSApCisgICAgICAgIGlmICgg
cDJtX2FsdHAybV9nZXRfb3JfcHJvcGFnYXRlKHAybSwgZ2ZuLCAmbWZuLCAmcDJtdCwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnAybWEsIHBhZ2Vfb3JkZXIpICkK
ICAgICAgICAgewogICAgICAgICAgICAgLyogRW50cnkgd2FzIGNvcGllZCBmcm9tIGhvc3QgLS0g
cmV0cnkgZmF1bHQgKi8KICAgICAgICAgICAgIHJjID0gMTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCAwZWE4OTQxLi40Yzk5
NTQ4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2
L21tL3AybS5jCkBAIC0yNDQwLDcgKzI0NDAsNyBAQCBib29sIHAybV9hbHRwMm1fZ2V0X29yX3By
b3BhZ2F0ZShzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwgdW5zaWduZWQgbG9uZyBnZm5fbCwKICAg
ICAgKiBnZm5zIGJlbG93LgogICAgICAqLwogICAgIHAybV9sb2NrKGFwMm0pOwotICAgIAorCiAg
ICAgYW1mbiA9IGdldF9nZm5fdHlwZV9hY2Nlc3MoYXAybSwgZ2ZuX2wsICZhcDJtdCwgJmFwMm1h
LCAwLCBOVUxMKTsKIAogICAgIGlmICggIW1mbl9lcShhbWZuLCBJTlZBTElEX01GTikgKQpAQCAt
MjQ3NCwxMSArMjQ3NCwxMSBAQCBib29sIHAybV9hbHRwMm1fZ2V0X29yX3Byb3BhZ2F0ZShzdHJ1
Y3QgcDJtX2RvbWFpbiAqYXAybSwgdW5zaWduZWQgbG9uZyBnZm5fbCwKICAgICBpZiAoIHJjICkK
ICAgICB7CiAgICAgICAgIGdwcmludGsoWEVOTE9HX0VSUiwKLSAgICAgICAgImZhaWxlZCB0byBz
ZXQgZW50cnkgZm9yICUjIlBSSXg2NCIgLT4gJSMiUFJJeDY0IiBhbHRwMm0gJSMiUFJJeDE2Ii4g
cmM6ICUiUFJJaTMyIlxuIiwKLSAgICAgICAgZ2ZuX2wsIG1mbl94KGFtZm4pLCB2Y3B1X2FsdHAy
bShjdXJyZW50KS5wMm1pZHgsIHJjKTsKKyAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIHNldCBl
bnRyeSBmb3IgJSJQUklfZ2ZuIiAtPiAlIlBSSV9tZm4iIGFsdHAybSAldSwgcmMgJWRcbiIsCisg
ICAgICAgICAgICAgICAgZ2ZuX2wsIG1mbl94KGFtZm4pLCB2Y3B1X2FsdHAybShjdXJyZW50KS5w
Mm1pZHgsIHJjKTsKICAgICAgICAgZG9tYWluX2NyYXNoKGFwMm0tPmRvbWFpbik7CiAgICAgfQot
ICAgIAorCiAgICAgcmV0dXJuIHRydWU7CiB9CiAKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
