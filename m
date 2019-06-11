Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1A33C72D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 11:24:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hacxW-0006Vr-Mi; Tue, 11 Jun 2019 09:20:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tchP=UK=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hacxV-0006Vm-D1
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 09:20:49 +0000
X-Inumbo-ID: 30abe35e-8c2a-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 30abe35e-8c2a-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 09:20:46 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Tue, 11 Jun 2019 17:17:34 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 11 Jun 2019 17:20:37 +0800
Message-ID: <1560244837-31477-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH] xen: superficial clean-ups
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Baodong Chen <chenbaodong@mxnavi.com>, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KiBSZW1vdmUgcmVkdW5kYW50IHNldCAnRE9NRFlJTkdfZGVhZCcKZG9tYWluX2NyZWF0ZSgpIHdp
bGwgc2V0IHRoaXMgd2hlbiBmYWlsLCB0aHVzIG5vIG5lZWQKc2V0IGluIGFyY2hfZG9tYWluX2Ny
ZWF0ZSgpLgoKKiBTZXQgZXJyb3Igd2hlbiByZWFsbHkgaGFwcGVuZWQKClNpZ25lZC1vZmYtYnk6
IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0v
ZG9tYWluLmMgfCAgMSAtCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgfCAxNSArKysrKysrLS0tLS0t
LS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyB8ICA0ICsrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCmluZGV4IGZmMzMwYjMuLmM3MmJlMDgg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYworKysgYi94ZW4vYXJjaC9hcm0vZG9t
YWluLmMKQEAgLTczMSw3ICs3MzEsNiBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBk
b21haW4gKmQsCiAgICAgcmV0dXJuIDA7CiAKIGZhaWw6Ci0gICAgZC0+aXNfZHlpbmcgPSBET01E
WUlOR19kZWFkOwogICAgIGFyY2hfZG9tYWluX2Rlc3Ryb3koZCk7CiAKICAgICByZXR1cm4gcmM7
CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYwpp
bmRleCA5MGM2NjA3Li5hNmFmNWE2IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCisr
KyBiL3hlbi9jb21tb24vZG9tYWluLmMKQEAgLTM1OCwxMCArMzU4LDkgQEAgc3RydWN0IGRvbWFp
biAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbWlkLAogICAgICAqLwogICAgIGlmICggIWlzX3N5
c3RlbV9kb21haW4oZCkgKQogICAgIHsKLSAgICAgICAgZXJyID0gLUVOT01FTTsKICAgICAgICAg
ZC0+dmNwdSA9IHh6YWxsb2NfYXJyYXkoc3RydWN0IHZjcHUgKiwgY29uZmlnLT5tYXhfdmNwdXMp
OwogICAgICAgICBpZiAoICFkLT52Y3B1ICkKLSAgICAgICAgICAgIGdvdG8gZmFpbDsKKyAgICAg
ICAgICAgIGdvdG8gbm9fbWVtOwogCiAgICAgICAgIGQtPm1heF92Y3B1cyA9IGNvbmZpZy0+bWF4
X3ZjcHVzOwogICAgIH0KQEAgLTM4OSw5ICszODgsOCBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5f
Y3JlYXRlKGRvbWlkX3QgZG9taWQsCiAKICAgICByd2xvY2tfaW5pdCgmZC0+dm51bWFfcndsb2Nr
KTsKIAotICAgIGVyciA9IC1FTk9NRU07CiAgICAgaWYgKCAhemFsbG9jX2NwdW1hc2tfdmFyKCZk
LT5kaXJ0eV9jcHVtYXNrKSApCi0gICAgICAgIGdvdG8gZmFpbDsKKyAgICAgICAgZ290byBub19t
ZW07CiAKICAgICByYW5nZXNldF9kb21haW5faW5pdGlhbGlzZShkKTsKIApAQCAtNDI5LDcgKzQy
Nyw3IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwKICAgICAg
ICAgZC0+aW9tZW1fY2FwcyA9IHJhbmdlc2V0X25ldyhkLCAiSS9PIE1lbW9yeSIsIFJBTkdFU0VU
Rl9wcmV0dHlwcmludF9oZXgpOwogICAgICAgICBkLT5pcnFfY2FwcyAgID0gcmFuZ2VzZXRfbmV3
KGQsICJJbnRlcnJ1cHRzIiwgMCk7CiAgICAgICAgIGlmICggIWQtPmlvbWVtX2NhcHMgfHwgIWQt
PmlycV9jYXBzICkKLSAgICAgICAgICAgIGdvdG8gZmFpbDsKKyAgICAgICAgICAgIGdvdG8gbm9f
bWVtOwogCiAgICAgICAgIGlmICggKGVyciA9IHhzbV9kb21haW5fY3JlYXRlKFhTTV9IT09LLCBk
LCBjb25maWctPnNzaWRyZWYpKSAhPSAwICkKICAgICAgICAgICAgIGdvdG8gZmFpbDsKQEAgLTQ0
OSwxMSArNDQ3LDkgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbWlk
LAogICAgICAgICBpZiAoIChlcnIgPSBhcmdvX2luaXQoZCkpICE9IDAgKQogICAgICAgICAgICAg
Z290byBmYWlsOwogCi0gICAgICAgIGVyciA9IC1FTk9NRU07Ci0KICAgICAgICAgZC0+cGJ1ZiA9
IHh6YWxsb2NfYXJyYXkoY2hhciwgRE9NQUlOX1BCVUZfU0laRSk7CiAgICAgICAgIGlmICggIWQt
PnBidWYgKQotICAgICAgICAgICAgZ290byBmYWlsOworICAgICAgICAgICAgZ290byBub19tZW07
CiAKICAgICAgICAgaWYgKCAoZXJyID0gc2NoZWRfaW5pdF9kb21haW4oZCwgMCkpICE9IDAgKQog
ICAgICAgICAgICAgZ290byBmYWlsOwpAQCAtNDgyLDYgKzQ3OCw5IEBAIHN0cnVjdCBkb21haW4g
KmRvbWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwKIAogICAgIHJldHVybiBkOwogCisgbm9fbWVt
OgorICAgIGVyciA9IC1FTk9NRU07CisKICBmYWlsOgogICAgIEFTU0VSVChlcnIgPCAwKTsgICAg
ICAvKiBTYW5pdHkgY2hlY2sgcGF0aHMgbGVhZGluZyBoZXJlLiAqLwogICAgIGVyciA9IGVyciA/
OiAtRUlMU0VROyAvKiBSZWxlYXNlIGJ1aWxkIHNhZmV0eS4gKi8KZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRleCA4NjM0MWJjLi5k
NmNkY2Y4IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKKysrIGIveGVuL2NvbW1v
bi9zY2hlZHVsZS5jCkBAIC0xODk0LDkgKzE4OTQsMTEgQEAgc3RydWN0IHNjaGVkdWxlciAqc2No
ZWR1bGVyX2FsbG9jKHVuc2lnbmVkIGludCBzY2hlZF9pZCwgaW50ICpwZXJyKQogICAgIHJldHVy
biBOVUxMOwogCiAgZm91bmQ6Ci0gICAgKnBlcnIgPSAtRU5PTUVNOwogICAgIGlmICggKHNjaGVk
ID0geG1hbGxvYyhzdHJ1Y3Qgc2NoZWR1bGVyKSkgPT0gTlVMTCApCisgICAgeworICAgICAgICAq
cGVyciA9IC1FTk9NRU07CiAgICAgICAgIHJldHVybiBOVUxMOworICAgIH0KICAgICBtZW1jcHko
c2NoZWQsIHNjaGVkdWxlcnNbaV0sIHNpemVvZigqc2NoZWQpKTsKICAgICBpZiAoICgqcGVyciA9
IFNDSEVEX09QKHNjaGVkLCBpbml0KSkgIT0gMCApCiAgICAgewotLSAKMi43LjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
