Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29F581D54
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 15:33:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hud3x-0004sf-3h; Mon, 05 Aug 2019 13:30:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9cV=WB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hud3u-0004rC-UB
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 13:30:06 +0000
X-Inumbo-ID: 231d066c-b785-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 231d066c-b785-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 13:30:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B022D337;
 Mon,  5 Aug 2019 06:30:05 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BF573F706;
 Mon,  5 Aug 2019 06:30:04 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  5 Aug 2019 14:29:54 +0100
Message-Id: <20190805132955.1630-4-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190805132955.1630-1-julien.grall@arm.com>
References: <20190805132955.1630-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 3/4] xen/public: Document
 HYPERCALL_console_io()
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5LCBPUyBkZXZlbG9wcGVycyB3aWxsIGhhdmUgdG8gbG9vayBhdCBYZW4gY29kZSBp
biBvcmRlciB0byBrbm93CnRoZSBwYXJhbWV0ZXJzIG9mIGFuIGh5cGVyY2FsbCBhbmQgaG93IGl0
IGlzIG1lYW50IHRvIHdvcmsuCgpUaGlzIGlzIG5vdCBhIHRyaXZpYWwgdGFzayBhcyB5b3UgbWF5
IG5lZWQgdG8gaGF2ZSBhIGRlZXAgdW5kZXJzdGFuZGluZwpvZiBYZW4gaW50ZXJuYWwuCgpUaGlz
IHBhdGNoIGF0dGVtcHRzIHRvIGRvY3VtZW50IHRoZSBiZWhhdmlvciBvZiBIWVBFUkNBTExfY29u
c29sZV9pbygpIHRvCmhlbHAgT1MgZGV2ZWxvcGVyLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAg
ICAtIEZvbGxvdyB0aGUgc3R5bGUgb2Ygb3RoZXIgY29tbWVudHMgd2l0aGluIHRoZSBmaWxlCiAg
ICAgICAgLSBVc2UgQHJldHVybiB0byBtYWtlIHJldHVybiB2YWx1ZQogICAgICAgIC0gQWRkIGEg
c2VudGVuY2UgcmVnYXJkaW5nIHRoZSBidWZmZXIgc2l6ZQotLS0KIHhlbi9pbmNsdWRlL3B1Ymxp
Yy94ZW4uaCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9w
dWJsaWMveGVuLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKaW5kZXggY2IyOTE3ZTc0Yi4u
NzQyYWI3MTAwNCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oCisrKyBiL3hl
bi9pbmNsdWRlL3B1YmxpYy94ZW4uaApAQCAtNDg2LDcgKzQ4NiwyOSBAQCBERUZJTkVfWEVOX0dV
RVNUX0hBTkRMRShtbXVleHRfb3BfdCk7CiAvKiBgIH0gKi8KIAogLyoKLSAqIENvbW1hbmRzIHRv
IEhZUEVSVklTT1JfY29uc29sZV9pbygpLgorICogYCBpbnQKKyAqIGAgSFlQRVJWSVNPUl9jb25z
b2xlX2lvKHVuc2lnbmVkIGludCBjbWQsCisgKiBgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgY291bnQsCisgKiBgICAgICAgICAgICAgICAgICAgICAgICBjaGFyIGJ1ZmZlcltd
KTsKKyAqCisgKiBAY21kOiBDb21tYW5kIChzZWUgYmVsb3cpCisgKiBAY291bnQ6IFNpemUgb2Yg
dGhlIGJ1ZmZlciB0byByZWFkL3dyaXRlCisgKiBAYnVmZmVyOiBQb2ludGVyIGluIHRoZSBndWVz
dCBtZW1vcnkKKyAqCisgKiBMaXN0IG9mIGNvbW1hbmRzOgorICoKKyAqICAqIENPTlNPTEVJT193
cml0ZTogV3JpdGUgdGhlIGJ1ZmZlciBvbiBYZW4gY29uc29sZS4KKyAqICAgICAgRm9yIHRoZSBo
YXJkd2FyZSBkb21haW4sIGFsbCB0aGUgY2hhcmFjdGVycyBpbiB0aGUgYnVmZmVyIHdpbGwKKyAq
ICAgICAgYmUgd3JpdHRlbi4gQ2hhcmFjdGVycyB3aWxsIGJlIHByaW50ZWQgdG8gZGlyZWN0bHkg
dG8gdGhlCisgKiAgICAgIGNvbnNvbGUuCisgKiAgICAgIEZvciBhbGwgdGhlIG90aGVyIGRvbWFp
bnMsIG9ubHkgdGhlIHByaW50YWJsZSBjaGFyYWN0ZXJzIHdpbGwgYmUKKyAqICAgICAgd3JpdHRl
bi4gQ2hhcmFjdGVycyBtYXkgYmUgYnVmZmVyZWQgdW50aWwgYSBuZXdsaW5lIChpLmUgJ1xuJykg
aXMKKyAqICAgICAgZm91bmQuCisgKiAgICAgIEByZXR1cm4gMCBvbiBzdWNjZXNzLCBvdGhlcndp
c2UgcmV0dXJuIGFuIGVycm9yIGNvZGUuCisgKiAgKiBDT05TT0xFSU9fcmVhZDogQXR0ZW1wdHMg
dG8gcmVhZCB1cCBAY291bnQgY2hhcmFjdGVycyBmcm9tIFhlbiBjb25zb2xlLgorICogICAgICBU
aGUgbWF4aW11bSBidWZmZXIgc2l6ZSAoaS5lIEBjb3VudCkgc3VwcG9ydGVkIGlzIDJHQi4KKyAq
ICAgICAgQHJldHVybiB0aGUgbnVtYmVyIG9mIGNoYXJhY3RlciByZWFkIG9uIHN1Y2Nlc3MsIG90
aGVyd2lzZSByZXR1cm4KKyAqICAgICAgYW4gZXJyb3IgY29kZS4KICAqLwogI2RlZmluZSBDT05T
T0xFSU9fd3JpdGUgICAgICAgICAwCiAjZGVmaW5lIENPTlNPTEVJT19yZWFkICAgICAgICAgIDEK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
