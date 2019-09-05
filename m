Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C54A9B3B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:09:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5lr3-0007of-Vc; Thu, 05 Sep 2019 07:06:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5lr3-0007oZ-6d
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:06:53 +0000
X-Inumbo-ID: bc4151b8-cfab-11e9-abc0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc4151b8-cfab-11e9-abc0-12813bfff9fa;
 Thu, 05 Sep 2019 07:06:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 393A3ADDC;
 Thu,  5 Sep 2019 07:06:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  5 Sep 2019 09:06:49 +0200
Message-Id: <20190905070649.13975-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen: remove sched-if.h includes from various
 sources
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGVuL3NjaGVkLWlmLmggaXMgaW5jbHVkZWQgaW4gbXVsdGlwbGUgc291cmNlcyB3aGVyZSBpdCBp
c24ndCBkaXJlY3RseQpuZWVkZWQuIFJlbW92ZSB0aG9zZSAjaW5jbHVkZSBzdGF0ZW1lbnRzLgoK
U3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCkNhcnZlZCBvdXQgZnJvbSBw
YXRjaCA3IG9mIG15IGNvcmUgc2NoZWR1bGluZyBzZXJpZXMKLS0tCiB4ZW4vYXJjaC94ODYvYWNw
aS9jcHVfaWRsZS5jICAgICAgfCAxIC0KIHhlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jICAg
ICB8IDEgLQogeGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWN0ZWxlbS5jIHwgMSAtCiB4ZW4vYXJj
aC94ODYvc2V0dXAuYyAgICAgICAgICAgICAgfCAxIC0KIHhlbi9hcmNoL3g4Ni9zbXBib290LmMg
ICAgICAgICAgICB8IDEgLQogNSBmaWxlcyBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMgYi94ZW4vYXJjaC94ODYvYWNwaS9j
cHVfaWRsZS5jCmluZGV4IDhmN2I2ZTliOGMuLjgzNmY1MjRlZjQgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUu
YwpAQCAtMzgsNyArMzgsNiBAQAogI2luY2x1ZGUgPHhlbi9ndWVzdF9hY2Nlc3MuaD4KICNpbmNs
dWRlIDx4ZW4va2V5aGFuZGxlci5oPgogI2luY2x1ZGUgPHhlbi90cmFjZS5oPgotI2luY2x1ZGUg
PHhlbi9zY2hlZC1pZi5oPgogI2luY2x1ZGUgPHhlbi9pcnEuaD4KICNpbmNsdWRlIDxhc20vY2Fj
aGUuaD4KICNpbmNsdWRlIDxhc20vaW8uaD4KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUv
bWNoZWNrL21jZS5jIGIveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMKaW5kZXggMjhhZDdk
ZDY1OS4uNGIyYjZkZTE5MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNl
LmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMKQEAgLTEwLDcgKzEwLDYgQEAK
ICNpbmNsdWRlIDx4ZW4vZXJybm8uaD4KICNpbmNsdWRlIDx4ZW4vY29uc29sZS5oPgogI2luY2x1
ZGUgPHhlbi9zY2hlZC5oPgotI2luY2x1ZGUgPHhlbi9zY2hlZC1pZi5oPgogI2luY2x1ZGUgPHhl
bi9jcHVtYXNrLmg+CiAjaW5jbHVkZSA8eGVuL2V2ZW50Lmg+CiAjaW5jbHVkZSA8eGVuL2d1ZXN0
X2FjY2Vzcy5oPgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWN0ZWxlbS5j
IGIveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWN0ZWxlbS5jCmluZGV4IDNiYjEzZTUyNjUuLjAx
MmE5Yjk1ZTUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jdGVsZW0uYwor
KysgYi94ZW4vYXJjaC94ODYvY3B1L21jaGVjay9tY3RlbGVtLmMKQEAgLTE4LDcgKzE4LDYgQEAK
ICNpbmNsdWRlIDx4ZW4vc21wLmg+CiAjaW5jbHVkZSA8eGVuL2Vycm5vLmg+CiAjaW5jbHVkZSA8
eGVuL3NjaGVkLmg+Ci0jaW5jbHVkZSA8eGVuL3NjaGVkLWlmLmg+CiAjaW5jbHVkZSA8eGVuL2Nw
dW1hc2suaD4KICNpbmNsdWRlIDx4ZW4vZXZlbnQuaD4KIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwppbmRleCBkMGIzNWIwY2UyLi41YTg4
ZWYzNjhmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJjaC94
ODYvc2V0dXAuYwpAQCAtMyw3ICszLDYgQEAKICNpbmNsdWRlIDx4ZW4vZXJyLmg+CiAjaW5jbHVk
ZSA8eGVuL2dyYW50X3RhYmxlLmg+CiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+Ci0jaW5jbHVkZSA8
eGVuL3NjaGVkLWlmLmg+CiAjaW5jbHVkZSA8eGVuL2RvbWFpbi5oPgogI2luY2x1ZGUgPHhlbi9z
ZXJpYWwuaD4KICNpbmNsdWRlIDx4ZW4vc29mdGlycS5oPgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKaW5kZXggNWM0MjU0YWM4Ny4u
OTExNDE2YzFlMSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4v
YXJjaC94ODYvc21wYm9vdC5jCkBAIC0yNSw3ICsyNSw2IEBACiAjaW5jbHVkZSA8eGVuL2RvbWFp
bi5oPgogI2luY2x1ZGUgPHhlbi9kb21haW5fcGFnZS5oPgogI2luY2x1ZGUgPHhlbi9zY2hlZC5o
PgotI2luY2x1ZGUgPHhlbi9zY2hlZC1pZi5oPgogI2luY2x1ZGUgPHhlbi9pcnEuaD4KICNpbmNs
dWRlIDx4ZW4vZGVsYXkuaD4KICNpbmNsdWRlIDx4ZW4vc29mdGlycS5oPgotLSAKMi4xNi40CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
