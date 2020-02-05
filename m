Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A05153296
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 15:13:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izLP2-0002XZ-2R; Wed, 05 Feb 2020 14:11:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lMay=3Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1izLP0-0002XU-Fl
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 14:11:38 +0000
X-Inumbo-ID: 6bf6508e-4821-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bf6508e-4821-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 14:11:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A8DE1AB87;
 Wed,  5 Feb 2020 14:11:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Wed,  5 Feb 2020 15:11:35 +0100
Message-Id: <20200205141135.31595-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [GIT PULL] xen: branch for v5.6-rc1
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy01
LjYtcmMxLXRhZwoKeGVuOiBicmFuY2ggZm9yIHY1LjYtcmMxCgpJdCBjb250YWluczoKCi0gYSBm
aXggb2YgYSBidWcgaW50cm9kdWNlZCBpbiA1LjUgZm9yIHRoZSBYZW4gZ250ZGV2IGRyaXZlcgot
IGEgZml4IG9mIHRoZSBYZW4gYmFsbG9vbiBkcml2ZXIgd2hlbiBydW5uaW5nIG9uIGFuY2llbnQg
WGVuIHZlcnNpb25zCi0gYSBwYXRjaCBhbGxvd2luZyBYZW4gc3R1YmRvbXMgdG8gY29udHJvbCBp
bnRlcnJ1cHQgZW5hYmxlIGZsYWdzIG9mCiAgcGFzc2VkLXRocm91Z2ggUENJIGNhcmRzCi0gYSBz
ZXJpZXMgZm9yIHJlbGVhc2luZyByZXNvdXJjZXMgaW4gWGVuIGJhY2tlbmRzIHVuZGVyIG1lbW9y
eSBwcmVzc3VyZQoKClRoYW5rcy4KCkp1ZXJnZW4KCiBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5n
L3N5c2ZzLWRyaXZlci1wY2liYWNrICAgICB8IDEzICsrKysKIERvY3VtZW50YXRpb24vQUJJL3Rl
c3Rpbmcvc3lzZnMtZHJpdmVyLXhlbi1ibGtiYWNrIHwgMTAgKysrCiBkcml2ZXJzL2Jsb2NrL3hl
bi1ibGtiYWNrL2Jsa2JhY2suYyAgICAgICAgICAgICAgICB8IDQyICsrKysrLS0tLS0KIGRyaXZl
cnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmggICAgICAgICAgICAgICAgIHwgIDEgKwogZHJp
dmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyAgICAgICAgICAgICAgICAgfCAyNiArKysr
KystCiBkcml2ZXJzL3hlbi9nbnRkZXYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDI0ICsrKy0tLQogZHJpdmVycy94ZW4veGVuLWJhbGxvb24uYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZS5jICAgICAg
ICAgICAgICAgfCAzNyArKysrKysrKysKIGRyaXZlcnMveGVuL3hlbi1wY2liYWNrL2NvbmZfc3Bh
Y2UuaCAgICAgICAgICAgICAgIHwgIDcgKysKIGRyaXZlcnMveGVuL3hlbi1wY2liYWNrL2NvbmZf
c3BhY2VfY2FwYWJpbGl0eS5jICAgIHwgODkgKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVy
cy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZV9oZWFkZXIuYyAgICAgICAgfCAxOSArKysrKwog
ZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYyAgICAgICAgICAgICAgICAgfCA2NiAr
KysrKysrKysrKysrKysrCiBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2liYWNrLmggICAgICAg
ICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyAgICAg
ICAgICAgICAgICAgIHwgIDggKy0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFj
a2VuZC5jICAgICAgICAgIHwgMzggKysrKysrKysrCiBpbmNsdWRlL3hlbi94ZW5idXMuaCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIDE2IGZpbGVzIGNoYW5nZWQsIDM0NiBp
bnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkKCkJvcmlzIE9zdHJvdnNreSAoMSk6CiAgICAg
IHhlbi9nbnRkZXY6IERvIG5vdCB1c2UgbW0gbm90aWZpZXJzIHdpdGggYXV0b3RyYW5zbGF0aW5n
IGd1ZXN0cwoKSnVlcmdlbiBHcm9zcyAoMSk6CiAgICAgIHhlbi9iYWxsb29uOiBTdXBwb3J0IHhl
bmQtYmFzZWQgdG9vbHN0YWNrIHRha2UgdHdvCgpNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
KDEpOgogICAgICB4ZW4tcGNpYmFjazogb3B0aW9uYWxseSBhbGxvdyBpbnRlcnJ1cHQgZW5hYmxl
IGZsYWcgd3JpdGVzCgpTZW9uZ0phZSBQYXJrICg1KToKICAgICAgeGVuYnVzL2JhY2tlbmQ6IEFk
ZCBtZW1vcnkgcHJlc3N1cmUgaGFuZGxlciBjYWxsYmFjawogICAgICB4ZW5idXMvYmFja2VuZDog
UHJvdGVjdCB4ZW5idXMgY2FsbGJhY2sgd2l0aCBsb2NrCiAgICAgIHhlbi9ibGtiYWNrOiBTcXVl
ZXplIHBhZ2UgcG9vbHMgaWYgYSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQKICAgICAgeGVu
L2Jsa2JhY2s6IFJlbW92ZSB1bm5lY2Vzc2FyeSBzdGF0aWMgdmFyaWFibGUgbmFtZSBwcmVmaXhl
cwogICAgICB4ZW4vYmxrYmFjazogQ29uc2lzdGVudGx5IGluc2VydCBvbmUgZW1wdHkgbGluZSBi
ZXR3ZWVuIGZ1bmN0aW9ucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
