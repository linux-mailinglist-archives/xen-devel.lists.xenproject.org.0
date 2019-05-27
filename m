Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383992B039
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 10:31:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVAyd-00049j-GZ; Mon, 27 May 2019 08:27:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vl5o=T3=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hVAyc-00049c-6h
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 08:27:26 +0000
X-Inumbo-ID: 41731805-8059-11e9-8980-bc764e045a96
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 41731805-8059-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 08:27:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 01:27:24 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga005.jf.intel.com with ESMTP; 27 May 2019 01:27:23 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 27 May 2019 16:31:22 +0800
Message-Id: <1558945891-3015-2-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v7 01/10] misc/xen-ucode: Upload a microcode
 blob to the hypervisor
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Chao Gao <chao.gao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBwcm92aWRlcyBhIHRvb2wgZm9yIGxhdGUgbWljcm9jb2RlIHVwZGF0ZS4KClNp
Z25lZC1vZmYtYnk6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT4KU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KLS0tCkNoYW5n
ZXMgaW4gdjc6CiAtIGludHJvZHVjZSB4Y19taWNyb2NvZGVfdXBkYXRlKCkgcmF0aGVyIHRoYW4g
eGNfcGxhdGZvcm1fb3AoKQogLSBhdm9pZCBjcmVhdGluZyBib3VuY2UgYnVmZmVyIHR3aWNlCiAt
IHJlbmFtZSB4ZW5taWNyb2NvZGUgdG8geGVuLXVjb2RlLCBmb2xsb3dpbmcgbmFtaW5nIHRyYWRp
dGlvbgogb2Ygb3RoZXIgdG9vbHMgdGhlcmUuCgotLS0KIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVu
Y3RybC5oIHwgIDEgKwogdG9vbHMvbGlieGMveGNfbWlzYy5jICAgICAgICAgfCAyMyArKysrKysr
KysrKysrCiB0b29scy9taXNjL01ha2VmaWxlICAgICAgICAgICB8ICA0ICsrKwogdG9vbHMvbWlz
Yy94ZW4tdWNvZGUuYyAgICAgICAgfCA3OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgdG9vbHMvbWlzYy94ZW4tdWNvZGUuYwoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhjL2luY2x1ZGUveGVuY3RybC5oIGIvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKaW5k
ZXggNTM4MDA3YS4uNmQ4MGFlNSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5j
dHJsLmgKKysrIGIvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKQEAgLTEyNDQsNiArMTI0
NCw3IEBAIHR5cGVkZWYgdWludDMyX3QgeGNfbm9kZV90b19ub2RlX2Rpc3RfdDsKIGludCB4Y19w
aHlzaW5mbyh4Y19pbnRlcmZhY2UgKnhjaCwgeGNfcGh5c2luZm9fdCAqaW5mbyk7CiBpbnQgeGNf
Y3B1dG9wb2luZm8oeGNfaW50ZXJmYWNlICp4Y2gsIHVuc2lnbmVkICptYXhfY3B1cywKICAgICAg
ICAgICAgICAgICAgICB4Y19jcHV0b3BvX3QgKmNwdXRvcG8pOworaW50IHhjX21pY3JvY29kZV91
cGRhdGUoeGNfaW50ZXJmYWNlICp4Y2gsIGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbik7CiBp
bnQgeGNfbnVtYWluZm8oeGNfaW50ZXJmYWNlICp4Y2gsIHVuc2lnbmVkICptYXhfbm9kZXMsCiAg
ICAgICAgICAgICAgICAgeGNfbWVtaW5mb190ICptZW1pbmZvLCB1aW50MzJfdCAqZGlzdGFuY2Up
OwogaW50IHhjX3BjaXRvcG9pbmZvKHhjX2ludGVyZmFjZSAqeGNoLCB1bnNpZ25lZCBudW1fZGV2
cywKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX21pc2MuYyBiL3Rvb2xzL2xpYnhjL3hjX21p
c2MuYwppbmRleCA1ZTY3MTRhLi44NTUzOGUwIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19t
aXNjLmMKKysrIGIvdG9vbHMvbGlieGMveGNfbWlzYy5jCkBAIC0yMjYsNiArMjI2LDI5IEBAIGlu
dCB4Y19waHlzaW5mbyh4Y19pbnRlcmZhY2UgKnhjaCwKICAgICByZXR1cm4gMDsKIH0KIAoraW50
IHhjX21pY3JvY29kZV91cGRhdGUoeGNfaW50ZXJmYWNlICp4Y2gsIGNvbnN0IHZvaWQgKmJ1Ziwg
c2l6ZV90IGxlbikKK3sKKyAgICBpbnQgcmV0OworICAgIERFQ0xBUkVfUExBVEZPUk1fT1A7Cisg
ICAgREVDTEFSRV9IWVBFUkNBTExfQlVGRkVSKHN0cnVjdCB4ZW5wZl9taWNyb2NvZGVfdXBkYXRl
LCB1Yyk7CisKKyAgICB1YyA9IHhjX2h5cGVyY2FsbF9idWZmZXJfYWxsb2MoeGNoLCB1YywgbGVu
KTsKKyAgICBpZiAodWMgPT0gTlVMTCkKKyAgICAgICAgcmV0dXJuIC0xOworCisgICAgbWVtY3B5
KHVjLCBidWYsIGxlbik7CisKKyAgICBwbGF0Zm9ybV9vcC5jbWQgPSBYRU5QRl9taWNyb2NvZGVf
dXBkYXRlOworICAgIHBsYXRmb3JtX29wLnUubWljcm9jb2RlLmxlbmd0aCA9IGxlbjsKKyAgICBz
ZXRfeGVuX2d1ZXN0X2hhbmRsZShwbGF0Zm9ybV9vcC51Lm1pY3JvY29kZS5kYXRhLCB1Yyk7CisK
KyAgICByZXQgPSBkb19wbGF0Zm9ybV9vcCh4Y2gsICZwbGF0Zm9ybV9vcCk7CisKKyAgICB4Y19o
eXBlcmNhbGxfYnVmZmVyX2ZyZWUoeGNoLCB1Yyk7CisKKyAgICByZXR1cm4gcmV0OworfQorCiBp
bnQgeGNfY3B1dG9wb2luZm8oeGNfaW50ZXJmYWNlICp4Y2gsIHVuc2lnbmVkICptYXhfY3B1cywK
ICAgICAgICAgICAgICAgICAgICB4Y19jcHV0b3BvX3QgKmNwdXRvcG8pCiB7CmRpZmYgLS1naXQg
YS90b29scy9taXNjL01ha2VmaWxlIGIvdG9vbHMvbWlzYy9NYWtlZmlsZQppbmRleCBkNDMyMGRj
Li42Mzk0N2JmIDEwMDY0NAotLS0gYS90b29scy9taXNjL01ha2VmaWxlCisrKyBiL3Rvb2xzL21p
c2MvTWFrZWZpbGUKQEAgLTIyLDYgKzIyLDcgQEAgSU5TVEFMTF9TQklOLSQoQ09ORklHX1g4Nikg
ICAgICs9IHhlbi1odm1jcmFzaAogSU5TVEFMTF9TQklOLSQoQ09ORklHX1g4NikgICAgICs9IHhl
bi1odm1jdHgKIElOU1RBTExfU0JJTi0kKENPTkZJR19YODYpICAgICArPSB4ZW4tbG93bWVtZAog
SU5TVEFMTF9TQklOLSQoQ09ORklHX1g4NikgICAgICs9IHhlbi1tZm5kdW1wCitJTlNUQUxMX1NC
SU4tJChDT05GSUdfWDg2KSAgICAgKz0geGVuLXVjb2RlCiBJTlNUQUxMX1NCSU4gICAgICAgICAg
ICAgICAgICAgKz0geGVuY292CiBJTlNUQUxMX1NCSU4gICAgICAgICAgICAgICAgICAgKz0geGVu
bG9ja3Byb2YKIElOU1RBTExfU0JJTiAgICAgICAgICAgICAgICAgICArPSB4ZW5wZXJmCkBAIC0x
MTMsNCArMTE0LDcgQEAgeGVuLWxvd21lbWQ6IHhlbi1sb3dtZW1kLm8KIHhlbmNvdjogeGVuY292
Lm8KIAkkKENDKSAkKExERkxBR1MpIC1vICRAICQ8ICQoTERMSUJTX2xpYnhlbmN0cmwpICQoQVBQ
RU5EX0xERkxBR1MpCiAKK3hlbi11Y29kZTogeGVuLXVjb2RlLm8KKwkkKENDKSAkKExERkxBR1Mp
IC1vICRAICQ8ICQoTERMSUJTX2xpYnhlbmN0cmwpICQoQVBQRU5EX0xERkxBR1MpCisKIC1pbmNs
dWRlICQoREVQU19JTkNMVURFKQpkaWZmIC0tZ2l0IGEvdG9vbHMvbWlzYy94ZW4tdWNvZGUuYyBi
L3Rvb2xzL21pc2MveGVuLXVjb2RlLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MC4uZGE2NjhjYQotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL21pc2MveGVuLXVjb2RlLmMKQEAg
LTAsMCArMSw3OCBAQAorI2RlZmluZSBfR05VX1NPVVJDRQorCisjaW5jbHVkZSA8c3RkaW8uaD4K
KyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlIDxzeXMvbW1hbi5oPgorI2luY2x1ZGUgPGVy
cm5vLmg+CisjaW5jbHVkZSA8c3RyaW5nLmg+CisjaW5jbHVkZSA8aW50dHlwZXMuaD4KKyNpbmNs
dWRlIDx1bmlzdGQuaD4KKyNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KKyNpbmNsdWRlIDxzeXMvc3Rh
dC5oPgorI2luY2x1ZGUgPGZjbnRsLmg+CisjaW5jbHVkZSA8eGVuY3RybC5oPgorCit2b2lkIHNo
b3dfaGVscCh2b2lkKQoreworICAgIGZwcmludGYoc3RkZXJyLAorICAgICAgICAgICAgInhlbm1p
Y3JvY29kZTogWGVuIG1pY3JvY29kZSB1cGRhdGluZyB0b29sXG4iCisgICAgICAgICAgICAiVXNh
Z2U6IHhlbm1pY3JvY29kZSA8bWljcm9jb2RlIGJsb2I+XG4iKTsKK30KKworaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKK3sKKyAgICBpbnQgZmQsIGxlbiwgcmV0OworICAgIGNoYXIg
KmZpbGVuYW1lLCAqYnVmOworICAgIHN0cnVjdCBzdGF0IHN0OworICAgIHhjX2ludGVyZmFjZSAq
eGNoOworCisgICAgaWYgKGFyZ2MgPCAyKQorICAgIHsKKyAgICAgICAgc2hvd19oZWxwKCk7Cisg
ICAgICAgIHJldHVybiAwOworICAgIH0KKworICAgIGZpbGVuYW1lID0gYXJndlsxXTsKKyAgICBm
ZCA9IG9wZW4oZmlsZW5hbWUsIE9fUkRPTkxZKTsKKyAgICBpZiAoZmQgPCAwKSB7CisgICAgICAg
IGZwcmludGYoc3RkZXJyLCAiQ291bGQgbm90IG9wZW4gJXMuIChlcnI6ICVzKVxuIiwKKyAgICAg
ICAgICAgICAgICBmaWxlbmFtZSwgc3RyZXJyb3IoZXJybm8pKTsKKyAgICAgICAgcmV0dXJuIGVy
cm5vOworICAgIH0KKworICAgIGlmIChzdGF0KGZpbGVuYW1lLCAmc3QpICE9IDApIHsKKyAgICAg
ICAgZnByaW50ZihzdGRlcnIsICJDb3VsZCBub3QgZ2V0IHRoZSBzaXplIG9mICVzLiAoZXJyOiAl
cylcbiIsCisgICAgICAgICAgICAgICAgZmlsZW5hbWUsIHN0cmVycm9yKGVycm5vKSk7CisgICAg
ICAgIHJldHVybiBlcnJubzsKKyAgICB9CisKKyAgICBsZW4gPSBzdC5zdF9zaXplOworICAgIGJ1
ZiA9IG1tYXAoMCwgbGVuLCBQUk9UX1JFQUQsIE1BUF9QUklWQVRFLCBmZCwgMCk7CisgICAgaWYg
KGJ1ZiA9PSBNQVBfRkFJTEVEKSB7CisgICAgICAgIGZwcmludGYoc3RkZXJyLCAibW1hcCBmYWls
ZWQuIChlcnJvcjogJXMpXG4iLCBzdHJlcnJvcihlcnJubykpOworICAgICAgICByZXR1cm4gZXJy
bm87CisgICAgfQorCisgICAgeGNoID0geGNfaW50ZXJmYWNlX29wZW4oMCwwLDApOworICAgIGlm
ICh4Y2ggPT0gTlVMTCkKKyAgICB7CisgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRXJyb3Igb3Bl
bmluZyB4YyBpbnRlcmZhY2UuIChlcnI6ICVzKVxuIiwKKyAgICAgICAgICAgICAgICBzdHJlcnJv
cihlcnJubykpOworICAgICAgICByZXR1cm4gZXJybm87CisgICAgfQorCisgICAgcmV0ID0geGNf
bWljcm9jb2RlX3VwZGF0ZSh4Y2gsIGJ1ZiwgbGVuKTsKKyAgICBpZiAocmV0KQorICAgICAgICBm
cHJpbnRmKHN0ZGVyciwgIkZhaWxlZCB0byB1cGRhdGUgbWljcm9jb2RlLiAoZXJyOiAlcylcbiIs
CisgICAgICAgICAgICAgICAgc3RyZXJyb3IoZXJybm8pKTsKKworICAgIHhjX2ludGVyZmFjZV9j
bG9zZSh4Y2gpOworCisgICAgaWYgKG11bm1hcChidWYsIGxlbikpIHsKKyAgICAgICAgcHJpbnRm
KCJDb3VsZCBub3QgdW5tYXA6ICVkKCVzKVxuIiwgZXJybm8sIHN0cmVycm9yKGVycm5vKSk7Cisg
ICAgICAgIHJldHVybiBlcnJubzsKKyAgICB9CisgICAgY2xvc2UoZmQpOworCisgICAgcmV0dXJu
IDA7Cit9Ci0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
