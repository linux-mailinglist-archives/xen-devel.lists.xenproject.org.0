Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012241348F9
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:17:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEul-0000T9-6M; Wed, 08 Jan 2020 17:14:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uSPe=25=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ipEuj-0000Sw-JJ
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:14:37 +0000
X-Inumbo-ID: 580c60b0-323a-11ea-8599-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 580c60b0-323a-11ea-8599-bc764e2007e4;
 Wed, 08 Jan 2020 17:14:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 09:14:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="395806082"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.132.23])
 by orsmga005.jf.intel.com with ESMTP; 08 Jan 2020 09:14:33 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 09:14:01 -0800
Message-Id: <c4f6b34fcbb8b5d592d33218a1b59ee613a3dc00.1578503483.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578503483.git.tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 04/18] x86/mem_sharing: drop flags from
 mem_sharing_unshare_page
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsIGNhbGxlcnMgcGFzcyAwIGluLgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0
YW1hcy5sZW5neWVsQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICAgIHwgMiArLQogeGVuL2FyY2gv
eDg2L21tL3AybS5jICAgICAgICAgICAgIHwgNSArKy0tLQogeGVuL2NvbW1vbi9tZW1vcnkuYyAg
ICAgICAgICAgICAgIHwgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oIHwg
OCArKystLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jCmluZGV4IDI0ZjA4ZDcwNDMuLjM4ZTkwMDZjOTIgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtMTg5OCw3
ICsxODk4LDcgQEAgaW50IGh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQocGFkZHJfdCBncGEsIHVu
c2lnbmVkIGxvbmcgZ2xhLAogICAgIGlmICggbnBmZWMud3JpdGVfYWNjZXNzICYmIChwMm10ID09
IHAybV9yYW1fc2hhcmVkKSApCiAgICAgewogICAgICAgICBBU1NFUlQocDJtX2lzX2hvc3RwMm0o
cDJtKSk7Ci0gICAgICAgIHNoYXJpbmdfZW5vbWVtID0gbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdl
KGN1cnJkLCBnZm4sIDApOworICAgICAgICBzaGFyaW5nX2Vub21lbSA9IG1lbV9zaGFyaW5nX3Vu
c2hhcmVfcGFnZShjdXJyZCwgZ2ZuKTsKICAgICAgICAgcmMgPSAxOwogICAgICAgICBnb3RvIG91
dF9wdXRfZ2ZuOwogICAgIH0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hl
bi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCAzMTE5MjY5MDczLi5iYWVhNjMyYWNjIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBA
IC01MTUsNyArNTE1LDcgQEAgbWZuX3QgX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKHN0cnVjdCBwMm1f
ZG9tYWluICpwMm0sIHVuc2lnbmVkIGxvbmcgZ2ZuX2wsCiAgICAgICAgICAqIFRyeSB0byB1bnNo
YXJlLiBJZiB3ZSBmYWlsLCBjb21tdW5pY2F0ZSBFTk9NRU0gd2l0aG91dAogICAgICAgICAgKiBz
bGVlcGluZy4KICAgICAgICAgICovCi0gICAgICAgIGlmICggbWVtX3NoYXJpbmdfdW5zaGFyZV9w
YWdlKHAybS0+ZG9tYWluLCBnZm5fbCwgMCkgPCAwICkKKyAgICAgICAgaWYgKCBtZW1fc2hhcmlu
Z191bnNoYXJlX3BhZ2UocDJtLT5kb21haW4sIGdmbl9sKSA8IDAgKQogICAgICAgICAgICAgbWVt
X3NoYXJpbmdfbm90aWZ5X2Vub21lbShwMm0tPmRvbWFpbiwgZ2ZuX2wsIGZhbHNlKTsKICAgICAg
ICAgbWZuID0gcDJtLT5nZXRfZW50cnkocDJtLCBnZm4sIHQsIGEsIHEsIHBhZ2Vfb3JkZXIsIE5V
TEwpOwogICAgIH0KQEAgLTg5Niw4ICs4OTYsNyBAQCBndWVzdF9waHlzbWFwX2FkZF9lbnRyeShz
dHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIG1mbl90IG1mbiwKICAgICAgICAgewogICAgICAg
ICAgICAgLyogRG8gYW4gdW5zaGFyZSB0byBjbGVhbmx5IHRha2UgY2FyZSBvZiBhbGwgY29ybmVy
IGNhc2VzLiAqLwogICAgICAgICAgICAgaW50IHJjOwotICAgICAgICAgICAgcmMgPSBtZW1fc2hh
cmluZ191bnNoYXJlX3BhZ2UocDJtLT5kb21haW4sCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBnZm5feChnZm5fYWRkKGdmbiwgaSkpLCAwKTsKKyAgICAgICAgICAg
IHJjID0gbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHAybS0+ZG9tYWluLCBnZm5feChnZm5fYWRk
KGdmbiwgaSkpKTsKICAgICAgICAgICAgIGlmICggcmMgKQogICAgICAgICAgICAgewogICAgICAg
ICAgICAgICAgIHAybV91bmxvY2socDJtKTsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbWVtb3J5
LmMgYi94ZW4vY29tbW9uL21lbW9yeS5jCmluZGV4IDMwOWU4NzJlZGYuLmM3ZDJiYWM0NTIgMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vbWVtb3J5LmMKKysrIGIveGVuL2NvbW1vbi9tZW1vcnkuYwpA
QCAtMzUyLDcgKzM1Miw3IEBAIGludCBndWVzdF9yZW1vdmVfcGFnZShzdHJ1Y3QgZG9tYWluICpk
LCB1bnNpZ25lZCBsb25nIGdtZm4pCiAgICAgICAgICAqIG1pZ2h0IGJlIHRoZSBvbmx5IG9uZSB1
c2luZyB0aGlzIHNoYXJlZCBwYWdlLCBhbmQgd2UgbmVlZCB0bwogICAgICAgICAgKiB0cmlnZ2Vy
IHByb3BlciBjbGVhbnVwLiBPbmNlIGRvbmUsIHRoaXMgaXMgbGlrZSBhbnkgb3RoZXIgcGFnZS4K
ICAgICAgICAgICovCi0gICAgICAgIHJjID0gbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKGQsIGdt
Zm4sIDApOworICAgICAgICByYyA9IG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShkLCBnbWZuKTsK
ICAgICAgICAgaWYgKCByYyApCiAgICAgICAgIHsKICAgICAgICAgICAgIG1lbV9zaGFyaW5nX25v
dGlmeV9lbm9tZW0oZCwgZ21mbiwgZmFsc2UpOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9tZW1fc2hhcmluZy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oCmlu
ZGV4IGFmMmExMDM4YjUuLmNmNzg0ODcwOWYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvbWVtX3NoYXJpbmcuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgK
QEAgLTY5LDEwICs2OSw5IEBAIGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3Qg
ZG9tYWluICpkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGZsYWdz
KTsKIAogc3RhdGljIGlubGluZSBpbnQgbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBk
b21haW4gKmQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBnZm4sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDE2X3QgZmxhZ3MpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBnZm4pCiB7Ci0gICAgaW50IHJjID0gX19tZW1fc2hhcmluZ191
bnNoYXJlX3BhZ2UoZCwgZ2ZuLCBmbGFncyk7CisgICAgaW50IHJjID0gX19tZW1fc2hhcmluZ191
bnNoYXJlX3BhZ2UoZCwgZ2ZuLCAwKTsKICAgICBCVUdfT04ocmMgJiYgKHJjICE9IC1FTk9NRU0p
KTsKICAgICByZXR1cm4gcmM7CiB9CkBAIC0xMTUsOCArMTE0LDcgQEAgc3RhdGljIGlubGluZSB1
bnNpZ25lZCBpbnQgbWVtX3NoYXJpbmdfZ2V0X25yX3NoYXJlZF9tZm5zKHZvaWQpCiAgICAgcmV0
dXJuIDA7CiB9CiAKLXN0YXRpYyBpbmxpbmUgaW50IG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShz
dHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbiwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBmbGFncykKK3N0YXRpYyBpbmxpbmUgaW50
IG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25n
IGdmbikKIHsKICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKICAgICByZXR1cm4gLUVPUE5PVFNV
UFA7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
