Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C397314A85C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 17:53:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw7bE-0000ao-QH; Mon, 27 Jan 2020 16:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QvhJ=3Q=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iw7bC-0000a0-Kc
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 16:50:54 +0000
X-Inumbo-ID: 2e57c15c-4125-11ea-aecd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e57c15c-4125-11ea-aecd-bc764e2007e4;
 Mon, 27 Jan 2020 16:50:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E68AB23B;
 Mon, 27 Jan 2020 16:50:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 27 Jan 2020 17:50:50 +0100
Message-Id: <20200127165050.29413-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH resend] docs: add DIRECTORY_PART specification
 do xenstore protocol doc
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RElSRUNUT1JZX1BBUlQgd2FzIG1pc3NpbmcgaW4gZG9jcy9taXNjL3hlbnN0b3JlLnR4dC4gQWRk
IGl0LgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0K
IGRvY3MvbWlzYy94ZW5zdG9yZS50eHQgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQgYi9kb2Nz
L21pc2MveGVuc3RvcmUudHh0CmluZGV4IGFlMWI2YThjNmUuLjY1NTcwMTgzYjYgMTAwNjQ0Ci0t
LSBhL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQKKysrIGIvZG9jcy9taXNjL3hlbnN0b3JlLnR4dApA
QCAtMTUyLDYgKzE1MiwxNSBAQCBESVJFQ1RPUlkJCTxwYXRoPnwJCQk8Y2hpbGQtbGVhZi1uYW1l
PnwqCiAJbGVhZm5hbWVzLiAgVGhlIHJlc3VsdGluZyBjaGlsZHJlbiBhcmUgZWFjaCBuYW1lZAog
CTxwYXRoPi88Y2hpbGQtbGVhZi1uYW1lPi4KIAorRElSRUNUT1JZX1BBUlQJCTxwYXRoPnw8b2Zm
c2V0PgkJPGdlbmNudD58PGNoaWxkLWxlYWYtbmFtZT58KgorCVNhbWUgYXMgRElSRUNUT1JZLCBi
dXQgdG8gYmUgdXNlZCBmb3IgY2hpbGRyZW4gbGlzdHMgbG9uZ2VyIHRoYW4KKwlYRU5TVE9SRV9Q
QVlMT0FEX01BWC4gSW5wdXQgYXJlIDxwYXRoPiBhbmQgdGhlIGJ5dGUgb2Zmc2V0IGludG8KKwl0
aGUgbGlzdCBvZiBjaGlsZHJlbiB0byByZXR1cm4uIFJldHVybiB2YWx1ZXMgYXJlIHRoZSBnZW5l
cmF0aW9uCisJY291bnQgPGdlbmNudD4gb2YgdGhlIG5vZGUgKHRvIGJlIHVzZWQgdG8gZW5zdXJl
IHRoZSBub2RlIGhhc24ndAorCWNoYW5nZWQgYmV0d2VlbiB0d28gcmVhZHM6IDxnZW5jbnQ+IGJl
aW5nIHRoZSBzYW1lIGZvciBtdWx0aXBsZQorCXJlYWRzIGd1YXJhbnRlZXMgdGhlIG5vZGUgaGFz
bid0IGNoYW5nZWQpIGFuZCB0aGUgbGlzdCBvZiBjaGlsZHJlbgorCXN0YXJ0aW5nIGF0IHRoZSBz
cGVjaWZpZWQgPG9mZnNldD4gb2YgdGhlIGNvbXBsZXRlIGxpc3QuCisKIEdFVF9QRVJNUwkgCTxw
YXRoPnwJCQk8cGVybS1hcy1zdHJpbmc+fCsKIFNFVF9QRVJNUwkJPHBhdGg+fDxwZXJtLWFzLXN0
cmluZz58Kz8KIAk8cGVybS1hcy1zdHJpbmc+IGlzIG9uZSBvZiB0aGUgZm9sbG93aW5nCi0tIAoy
LjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
