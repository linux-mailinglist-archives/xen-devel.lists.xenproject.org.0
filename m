Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6D714B902
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:30:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRqw-0002YX-De; Tue, 28 Jan 2020 14:28:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VmX/=3R=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iwRqu-0002XK-3x
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:28:28 +0000
X-Inumbo-ID: 6f790e74-41da-11ea-86e0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f790e74-41da-11ea-86e0-12813bfff9fa;
 Tue, 28 Jan 2020 14:28:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 714E2ACE3;
 Tue, 28 Jan 2020 14:28:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 Jan 2020 15:28:17 +0100
Message-Id: <20200128142818.27200-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200128142818.27200-1-jgross@suse.com>
References: <20200128142818.27200-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 2/3] xenstore: add console xenstore entries for
 xenstore stubdom
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgdG8gYmUgYWJsZSB0byBjb25uZWN0IHRvIHRoZSBjb25zb2xlIG9mIFhlbnN0b3Jl
IHN0dWJkb20gd2UKbmVlZCB0byBjcmVhdGUgdGhlIGFwcHJvcHJpYXRlIGVudHJpZXMgaW4gWGVu
c3RvcmUuCgpGb3IgdGhlIG1vbWVudCB3ZSBkb24ndCBzdXBwb3J0IHhlbmNvbnNvbGVkIGxpdmlu
ZyBpbiBhbm90aGVyIGRvbWFpbgp0aGFuIGRvbTAsIGFzIHRoaXMgaW5mb3JtYXRpb24gaXNuJ3Qg
YXZhaWxhYmxlIG90aGVyIHRoZW4gdmlhClhlbnN0b3JlIHdoaWNoIHdlIGFyZSBqdXN0IHNldHRp
bmcgdXAuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0t
LQogdG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jIHwgMzEgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9t
YWluLmMgYi90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMKaW5kZXggYTMxMmJj
MzhiOC4uYTgxYTE1YTRkZSAxMDA2NDQKLS0tIGEvdG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3Jl
LWRvbWFpbi5jCisrKyBiL3Rvb2xzL2hlbHBlcnMvaW5pdC14ZW5zdG9yZS1kb21haW4uYwpAQCAt
MTIsNiArMTIsNyBAQAogI2luY2x1ZGUgPHhlbnN0b3JlLmg+CiAjaW5jbHVkZSA8eGVuL3N5cy94
ZW5idXNfZGV2Lmg+CiAjaW5jbHVkZSA8eGVuLXhzbS9mbGFzay9mbGFzay5oPgorI2luY2x1ZGUg
PHhlbi9pby94ZW5idXMuaD4KIAogI2luY2x1ZGUgImluaXQtZG9tLWpzb24uaCIKICNpbmNsdWRl
ICJfcGF0aHMuaCIKQEAgLTMxMiw2ICszMTMsMTUgQEAgc3RhdGljIHZvaWQgZG9feHNfd3JpdGUo
c3RydWN0IHhzX2hhbmRsZSAqeHNoLCBjaGFyICpwYXRoLCBjaGFyICp2YWwpCiAgICAgICAgIGZw
cmludGYoc3RkZXJyLCAid3JpdGluZyAlcyB0byB4ZW5zdG9yZSBmYWlsZWQuXG4iLCBwYXRoKTsK
IH0KIAorc3RhdGljIHZvaWQgZG9feHNfd3JpdGVfZGlyX25vZGUoc3RydWN0IHhzX2hhbmRsZSAq
eHNoLCBjaGFyICpkaXIsIGNoYXIgKm5vZGUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjaGFyICp2YWwpCit7CisgICAgY2hhciBmdWxsX3BhdGhbMTAwXTsKKworICAgIHNucHJp
bnRmKGZ1bGxfcGF0aCwgMTAwLCAiJXMvJXMiLCBkaXIsIG5vZGUpOworICAgIGRvX3hzX3dyaXRl
KHhzaCwgZnVsbF9wYXRoLCB2YWwpOworfQorCiBzdGF0aWMgdm9pZCBkb194c193cml0ZV9kb20o
c3RydWN0IHhzX2hhbmRsZSAqeHNoLCBjaGFyICpwYXRoLCBjaGFyICp2YWwpCiB7CiAgICAgY2hh
ciBmdWxsX3BhdGhbNjRdOwpAQCAtMzI1LDcgKzMzNSw3IEBAIGludCBtYWluKGludCBhcmdjLCBj
aGFyKiogYXJndikKICAgICBpbnQgb3B0OwogICAgIHhjX2ludGVyZmFjZSAqeGNoOwogICAgIHN0
cnVjdCB4c19oYW5kbGUgKnhzaDsKLSAgICBjaGFyIGJ1ZlsxNl07CisgICAgY2hhciBidWZbMTZd
LCBiZV9wYXRoWzY0XSwgZmVfcGF0aFs2NF07CiAgICAgaW50IHJ2LCBmZDsKICAgICBjaGFyICpt
YXhtZW1fc3RyID0gTlVMTDsKIApAQCAtNDE0LDYgKzQyNCwyNSBAQCBpbnQgbWFpbihpbnQgYXJn
YywgY2hhcioqIGFyZ3YpCiAgICAgaWYgKG1heG1lbSkKICAgICAgICAgc25wcmludGYoYnVmLCAx
NiwgIiVkIiwgbWF4bWVtICogMTAyNCk7CiAgICAgZG9feHNfd3JpdGVfZG9tKHhzaCwgIm1lbW9y
eS9zdGF0aWMtbWF4IiwgYnVmKTsKKyAgICBzbnByaW50ZihiZV9wYXRoLCA2NCwgIi9sb2NhbC9k
b21haW4vMC9iYWNrZW5kL2NvbnNvbGUvJWQvMCIsIGRvbWlkKTsKKyAgICBzbnByaW50ZihmZV9w
YXRoLCA2NCwgIi9sb2NhbC9kb21haW4vJWQvY29uc29sZSIsIGRvbWlkKTsKKyAgICBzbnByaW50
ZihidWYsIDE2LCAiJWQiLCBkb21pZCk7CisgICAgZG9feHNfd3JpdGVfZGlyX25vZGUoeHNoLCBi
ZV9wYXRoLCAiZnJvbnRlbmQtaWQiLCBidWYpOworICAgIGRvX3hzX3dyaXRlX2Rpcl9ub2RlKHhz
aCwgYmVfcGF0aCwgImZyb250ZW5kIiwgZmVfcGF0aCk7CisgICAgZG9feHNfd3JpdGVfZGlyX25v
ZGUoeHNoLCBiZV9wYXRoLCAib25saW5lIiwgIjEiKTsKKyAgICBzbnByaW50ZihidWYsIDE2LCAi
JWQiLCBYZW5idXNTdGF0ZUluaXRpYWxpc2luZyk7CisgICAgZG9feHNfd3JpdGVfZGlyX25vZGUo
eHNoLCBiZV9wYXRoLCAic3RhdGUiLCBidWYpOworICAgIGRvX3hzX3dyaXRlX2Rpcl9ub2RlKHhz
aCwgYmVfcGF0aCwgInByb3RvY29sIiwgInZ0MTAwIik7CisgICAgZG9feHNfd3JpdGVfZGlyX25v
ZGUoeHNoLCBmZV9wYXRoLCAiYmFja2VuZCIsIGJlX3BhdGgpOworICAgIGRvX3hzX3dyaXRlX2Rp
cl9ub2RlKHhzaCwgZmVfcGF0aCwgImJhY2tlbmQtaWQiLCAiMCIpOworICAgIGRvX3hzX3dyaXRl
X2Rpcl9ub2RlKHhzaCwgZmVfcGF0aCwgImxpbWl0IiwgIjEwNDg1NzYiKTsKKyAgICBkb194c193
cml0ZV9kaXJfbm9kZSh4c2gsIGZlX3BhdGgsICJ0eXBlIiwgInhlbmNvbnNvbGVkIik7CisgICAg
ZG9feHNfd3JpdGVfZGlyX25vZGUoeHNoLCBmZV9wYXRoLCAib3V0cHV0IiwgInB0eSIpOworICAg
IGRvX3hzX3dyaXRlX2Rpcl9ub2RlKHhzaCwgZmVfcGF0aCwgInR0eSIsICIiKTsKKyAgICBzbnBy
aW50ZihidWYsIDE2LCAiJWQiLCBjb25zb2xlX2V2dGNobik7CisgICAgZG9feHNfd3JpdGVfZGly
X25vZGUoeHNoLCBmZV9wYXRoLCAicG9ydCIsIGJ1Zik7CisgICAgc25wcmludGYoYnVmLCAxNiwg
IiVsZCIsIGNvbnNvbGVfbWZuKTsKKyAgICBkb194c193cml0ZV9kaXJfbm9kZSh4c2gsIGZlX3Bh
dGgsICJyaW5nLXJlZiIsIGJ1Zik7CiAgICAgeHNfY2xvc2UoeHNoKTsKIAogICAgIGZkID0gY3Jl
YXQoWEVOX1JVTl9ESVIgIi94ZW5zdG9yZWQucGlkIiwgMDY2Nik7Ci0tIAoyLjE2LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
