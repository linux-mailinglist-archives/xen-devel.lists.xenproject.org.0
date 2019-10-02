Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BCFC8A0A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 15:44:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFetF-0004oh-Nx; Wed, 02 Oct 2019 13:42:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFetE-0004oa-MH
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 13:42:00 +0000
X-Inumbo-ID: 6858cc32-e51a-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 6858cc32-e51a-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 13:41:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E48D5AC52;
 Wed,  2 Oct 2019 13:41:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 15:41:56 +0200
Message-Id: <20191002134156.31073-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] docs: remove tmem references from man pages
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

VGhlICJUTyBCRSBET0NVTUVOVEVEIiBzZWN0aW9uIG9mIHRoZSB4bCBtYW4gcGFnZSBzdGlsbCBy
ZWZlcmVuY2VzCnRtZW0uIFNvIGRvZXMgdGhlIHhsLmNvbmYgbWFuIHBhZ2UuIFJlbW92ZSB0aGUg
cmVmZXJlbmNlcy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KLS0tCiBkb2NzL21hbi94bC4xLnBvZC5pbiAgIHwgMTIgLS0tLS0tLS0tLS0tCiBkb2NzL21h
bi94bC5jb25mLjUucG9kIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLjEucG9kLmluIGIvZG9j
cy9tYW4veGwuMS5wb2QuaW4KaW5kZXggMmY3Mzc1ZWQwYS4uMjI4MDAyMmY4ZSAxMDA2NDQKLS0t
IGEvZG9jcy9tYW4veGwuMS5wb2QuaW4KKysrIGIvZG9jcy9tYW4veGwuMS5wb2QuaW4KQEAgLTE5
MjEsMTggKzE5MjEsNiBAQCBpZ25vcmVkOgogCiA9YmFjawogCi09aGVhZDEgVE8gQkUgRE9DVU1F
TlRFRAotCi1XZSBuZWVkIGJldHRlciBkb2N1bWVudGF0aW9uIGZvcjoKLQotPW92ZXIgNAotCi09
aXRlbSBCPHRtZW0+Ci0KLVRyYW5zY2VuZGVudCBNZW1vcnkuCi0KLT1iYWNrCi0KID1oZWFkMSBT
RUUgQUxTTwogCiBUaGUgZm9sbG93aW5nIG1hbiBwYWdlczoKZGlmZiAtLWdpdCBhL2RvY3MvbWFu
L3hsLmNvbmYuNS5wb2QgYi9kb2NzL21hbi94bC5jb25mLjUucG9kCmluZGV4IGIxYmRlN2Q2NTcu
LjhjMjBkNzdhMjUgMTAwNjQ0Ci0tLSBhL2RvY3MvbWFuL3hsLmNvbmYuNS5wb2QKKysrIGIvZG9j
cy9tYW4veGwuY29uZi41LnBvZApAQCAtMTcyLDcgKzE3Miw3IEBAIGF0dGVtcHRlZCBhcyBub3Jt
YWwgYW5kIG1heSBmYWlsIGR1ZSB0byBtZW1vcnkgZXhoYXVzdGlvbi4KIAogPWl0ZW0gQzwxPgog
Ci1Ob3JtYWwgbWVtb3J5IGFuZCBmcmVlYWJsZSBwb29sIG9mIGVwaGVtZXJhbCBwYWdlcyAodG1l
bSkgaXMgdXNlZCB3aGVuCitGcmVlIG1lbW9yeSBhcyByZXBvcnRlZCBieSB0aGUgaHlwZXJ2aXNv
ciBpcyB1c2VkIGZvcgogY2FsY3VsYXRpbmcgd2hldGhlciB0aGVyZSBpcyBlbm91Z2ggbWVtb3J5
IGZyZWUgdG8gbGF1bmNoIGEgZ3Vlc3QuCiBUaGlzIGd1YXJhbnRlZXMgaW1tZWRpYXRlIGZlZWRi
YWNrIHdoZXRoZXIgdGhlIGd1ZXN0IGNhbiBiZSBsYXVuY2hlZCBkdWUKIHRvIG1lbW9yeSBleGhh
dXN0aW9uICh3aGljaCBjYW4gdGFrZSBhIGxvbmcgdGltZSB0byBmaW5kIG91dCBpZiBsYXVuY2hp
bmcKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
