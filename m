Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906C1331C0
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 16:10:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXncT-0005oL-PB; Mon, 03 Jun 2019 14:07:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yeU6=UC=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1hXncS-0005oG-UA
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:07:24 +0000
X-Inumbo-ID: e8d863d4-8608-11e9-8fb2-f305fba89dbc
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8d863d4-8608-11e9-8fb2-f305fba89dbc;
 Mon, 03 Jun 2019 14:07:23 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBFC227CDA;
 Mon,  3 Jun 2019 13:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559569855;
 bh=9ZIpxjRQkTPQKKOrEZEvuX2spVekKgyMa2r8cr6R3o0=;
 h=Subject:To:From:Date:From;
 b=oVouPxv1YC3UgFmN5VD/tW+qeCHkyuy+z9rfJpV7FRE6bephfALjS67dgLGlMOYCZ
 ViVbxzB1vsE4U0qyz7eOFKrbvBNebr3wrxFQpW7r99Mo6Kx4Dc0w/pJKhxyglFKTZH
 HgtX/62ThgD9gFiUeXxkX0a1U9il6AwAlegQqKNU=
To: gregkh@linuxfoundation.org, boris.ostrovsky@oracle.com, bp@alien8.de,
 hpa@zytor.com, jgross@suse.com, mingo@redhat.com, sstabellini@kernel.org,
 tglx@linutronix.de, x86@kernel.org, xen-devel@lists.xenproject.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 03 Jun 2019 15:50:45 +0200
Message-ID: <155956984518814@kroah.com>
MIME-Version: 1.0
Subject: [Xen-devel] patch "x86: xen: no need to check return value of
 debugfs_create functions" added to driver-core-testing
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ClRoaXMgaXMgYSBub3RlIHRvIGxldCB5b3Uga25vdyB0aGF0IEkndmUganVzdCBhZGRlZCB0aGUg
cGF0Y2ggdGl0bGVkCgogICAgeDg2OiB4ZW46IG5vIG5lZWQgdG8gY2hlY2sgcmV0dXJuIHZhbHVl
IG9mIGRlYnVnZnNfY3JlYXRlIGZ1bmN0aW9ucwoKdG8gbXkgZHJpdmVyLWNvcmUgZ2l0IHRyZWUg
d2hpY2ggY2FuIGJlIGZvdW5kIGF0CiAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvZ3JlZ2toL2RyaXZlci1jb3JlLmdpdAppbiB0aGUgZHJpdmVyLWNvcmUt
dGVzdGluZyBicmFuY2guCgpUaGUgcGF0Y2ggd2lsbCBzaG93IHVwIGluIHRoZSBuZXh0IHJlbGVh
c2Ugb2YgdGhlIGxpbnV4LW5leHQgdHJlZQoodXN1YWxseSBzb21ldGltZSB3aXRoaW4gdGhlIG5l
eHQgMjQgaG91cnMgZHVyaW5nIHRoZSB3ZWVrLikKClRoZSBwYXRjaCB3aWxsIGJlIG1lcmdlZCB0
byB0aGUgZHJpdmVyLWNvcmUtbmV4dCBicmFuY2ggc29tZXRpbWUgc29vbiwKYWZ0ZXIgaXQgcGFz
c2VzIHRlc3RpbmcsIGFuZCB0aGUgbWVyZ2Ugd2luZG93IGlzIG9wZW4uCgpJZiB5b3UgaGF2ZSBh
bnkgcXVlc3Rpb25zIGFib3V0IHRoaXMgcHJvY2VzcywgcGxlYXNlIGxldCBtZSBrbm93LgoKCkZy
b20gYWQwOTEzNzYzMWU2ZTVhY2ZhZjI4OGYzYmEzZjRiM2E5Zjg1NWQxNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKRnJvbTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KRGF0ZTogVHVlLCAyMiBKYW4gMjAxOSAxNTozNTo0MiArMDEwMApTdWJqZWN0OiB4
ODY6IHhlbjogbm8gbmVlZCB0byBjaGVjayByZXR1cm4gdmFsdWUgb2YgZGVidWdmc19jcmVhdGUg
ZnVuY3Rpb25zCgpXaGVuIGNhbGxpbmcgZGVidWdmcyBmdW5jdGlvbnMsIHRoZXJlIGlzIG5vIG5l
ZWQgdG8gZXZlciBjaGVjayB0aGUKcmV0dXJuIHZhbHVlLiAgVGhlIGZ1bmN0aW9uIGNhbiB3b3Jr
IG9yIG5vdCwgYnV0IHRoZSBjb2RlIGxvZ2ljIHNob3VsZApuZXZlciBkbyBzb21ldGhpbmcgZGlm
ZmVyZW50IGJhc2VkIG9uIHRoaXMuCgpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogSW5nbyBN
b2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5k
ZT4KQ2M6ICJILiBQZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+CkNjOiA8eDg2QGtlcm5lbC5v
cmc+CkNjOiA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgpSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgotLS0KIGFyY2gveDg2L3hlbi9kZWJ1
Z2ZzLmMgfCA3ICstLS0tLS0KIGFyY2gveDg2L3hlbi9wMm0uYyAgICAgfCAzIC0tLQogMiBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni94ZW4vZGVidWdmcy5jIGIvYXJjaC94ODYveGVuL2RlYnVnZnMuYwppbmRleCAxM2Rh
ODc5MThiNGYuLjUzMjQxMDk5ODY4NCAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2RlYnVnZnMu
YworKysgYi9hcmNoL3g4Ni94ZW4vZGVidWdmcy5jCkBAIC05LDEzICs5LDggQEAgc3RhdGljIHN0
cnVjdCBkZW50cnkgKmRfeGVuX2RlYnVnOwogCiBzdHJ1Y3QgZGVudHJ5ICogX19pbml0IHhlbl9p
bml0X2RlYnVnZnModm9pZCkKIHsKLQlpZiAoIWRfeGVuX2RlYnVnKSB7CisJaWYgKCFkX3hlbl9k
ZWJ1ZykKIAkJZF94ZW5fZGVidWcgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoInhlbiIsIE5VTEwpOwot
Ci0JCWlmICghZF94ZW5fZGVidWcpCi0JCQlwcl93YXJuaW5nKCJDb3VsZCBub3QgY3JlYXRlICd4
ZW4nIGRlYnVnZnMgZGlyZWN0b3J5XG4iKTsKLQl9Ci0KIAlyZXR1cm4gZF94ZW5fZGVidWc7CiB9
CiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9wMm0uYyBiL2FyY2gveDg2L3hlbi9wMm0uYwpp
bmRleCA5NWNlOWI1YmU0MTEuLjBhY2JhMmM3MTJhYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVu
L3AybS5jCisrKyBiL2FyY2gveDg2L3hlbi9wMm0uYwpAQCAtODE3LDkgKzgxNyw2IEBAIHN0YXRp
YyBpbnQgX19pbml0IHhlbl9wMm1fZGVidWdmcyh2b2lkKQogewogCXN0cnVjdCBkZW50cnkgKmRf
eGVuID0geGVuX2luaXRfZGVidWdmcygpOwogCi0JaWYgKGRfeGVuID09IE5VTEwpCi0JCXJldHVy
biAtRU5PTUVNOwotCiAJZF9tbXVfZGVidWcgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoIm1tdSIsIGRf
eGVuKTsKIAogCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInAybSIsIDA2MDAsIGRfbW11X2RlYnVnLCBO
VUxMLCAmcDJtX2R1bXBfZm9wcyk7Ci0tIAoyLjIxLjAKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
